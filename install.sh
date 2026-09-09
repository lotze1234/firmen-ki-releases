#!/usr/bin/env bash
# Firmen-KI – Installer für den Kundenserver (Linux mit Docker). Idempotent: kann erneut ausgeführt werden.
#
#   curl -fsSL https://<update-domain>/install.sh -o install.sh && sudo bash install.sh
#
# Legt /opt/firmen-ki an (Compose-Dateien, .env, versions.env, Verzeichnisse), fragt KI-Server, Registry-Zugang,
# Hostname und TLS-Variante ab, lädt das signierte Update-Manifest, zieht die Images per Digest und startet die App.
# Optionen:  --home DIR   --channel stable|beta   --non-interactive (alle Werte aus ENV)   --no-verify (nur Entwicklung)
set -euo pipefail

# Vom Release-Workflow ersetzt (Public Key der Manifest-Signatur und Basis-URL der Manifeste):
RELEASE_PUBLIC_KEY='-----BEGIN PUBLIC KEY-----
MCowBQYDK2VwAyEAQD1xx4GX+abyfC92KlgcIoXw0HM6VRwpGBkZdOEGzcw=
-----END PUBLIC KEY-----'
DEFAULT_UPDATE_URL='https://lotze1234.github.io/firmen-ki-releases'
DEFAULT_REGISTRY_OWNER='lotze1234'

HOME_DIR="${FIRMENKI_HOME:-/opt/firmen-ki}"
CHANNEL="${UPDATE_CHANNEL:-stable}"
INTERACTIVE=1
VERIFY=1
while [ $# -gt 0 ]; do
  case "$1" in
    --home) HOME_DIR="$2"; shift 2 ;;
    --channel) CHANNEL="$2"; shift 2 ;;
    --non-interactive) INTERACTIVE=0; shift ;;
    --no-verify) VERIFY=0; shift ;;
    -h|--help) sed -n '2,12p' "$0"; exit 0 ;;
    *) echo "Unbekannte Option: $1" >&2; exit 2 ;;
  esac
done

say()  { printf '\n\033[1m%s\033[0m\n' "$*"; }
info() { printf '  %s\n' "$*"; }
fail() { printf '\nFehler: %s\n' "$*" >&2; exit 1; }
ask()  { # ask VAR "Frage" "Default" [secret]
  local var="$1" q="$2" def="${3:-}" secret="${4:-}" val
  if [ -n "${!var:-}" ]; then return; fi
  [ "$INTERACTIVE" = 1 ] || { [ -n "$def" ] && { printf -v "$var" '%s' "$def"; return; } || fail "$var fehlt (ENV setzen oder ohne --non-interactive ausführen)"; }
  if [ -n "$secret" ]; then read -r -s -p "  $q: " val; echo; else read -r -p "  $q${def:+ [$def]}: " val; fi
  printf -v "$var" '%s' "${val:-$def}"
}
rand() { openssl rand -hex "$1"; }
envval() { grep -E "^${2}=" "$1" 2>/dev/null | tail -n1 | cut -d= -f2- | sed 's/[[:space:]]*#.*$//; s/^"//; s/"$//'; }

# --- Voraussetzungen -----------------------------------------------------------------------------------------
say "Firmen-KI Installation → $HOME_DIR (Kanal: $CHANNEL)"
[ "$(id -u)" = 0 ] || fail "Bitte als root ausführen (sudo bash install.sh)"
command -v docker >/dev/null || fail "Docker fehlt. Installation: curl -fsSL https://get.docker.com | sh"
docker info >/dev/null 2>&1 || fail "Docker-Daemon nicht erreichbar"
dv="$(docker version --format '{{.Server.Version}}')"
[ "${dv%%.*}" -ge 27 ] || fail "Docker ≥ 27 erforderlich (gefunden: $dv)"
docker compose version >/dev/null 2>&1 || fail "Docker Compose v2 fehlt (Paket docker-compose-plugin)"
for t in curl jq openssl; do command -v "$t" >/dev/null || fail "$t fehlt: apt-get install -y curl jq openssl"; done
[ "$CHANNEL" = stable ] || [ "$CHANNEL" = beta ] || fail "Kanal muss stable oder beta sein"
info "Docker $dv, Compose $(docker compose version --short)"

# --- Verzeichnisse -------------------------------------------------------------------------------------------
mkdir -p "$HOME_DIR"/{bin,state,state/logs,backups,workspaces,storage,docs,packages,searxng,caddy/certs}
chown 1000:1000 "$HOME_DIR"/{workspaces,storage,state,state/logs}
chmod 750 "$HOME_DIR"
cd "$HOME_DIR"

# --- Konfiguration (.env) ------------------------------------------------------------------------------------
if [ -f .env ]; then
  say "Bestehende Konfiguration gefunden ($HOME_DIR/.env) – wird beibehalten."
  for k in REGISTRY REGISTRY_USER REGISTRY_TOKEN UPDATE_URL LLM_BASE_URL LLM_MODEL_ID APP_HOST COMPOSE_FILE; do
    v="$(envval .env "$k")"; [ -n "$v" ] && printf -v "$k" '%s' "$v"
  done
  CHANNEL="$(envval .env UPDATE_CHANNEL)"; CHANNEL="${CHANNEL:-stable}"
else
  say "Konfiguration"
  ask REGISTRY "Container-Registry" "ghcr.io"
  ask REGISTRY_OWNER "Registry-Namensraum (Hersteller)" "$DEFAULT_REGISTRY_OWNER"
  ask REGISTRY_USER "Registry-Benutzer (vom Hersteller erhalten)" ""
  ask REGISTRY_TOKEN "Registry-Token (Leserecht)" "" secret
  ask UPDATE_URL "Update-Server (Basis-URL der Manifeste)" "$DEFAULT_UPDATE_URL"
  ask LLM_BASE_URL "KI-Server (OpenAI-kompatibel, z. B. http://192.168.1.50:1234/v1; auf diesem Host: http://host.docker.internal:1234/v1)" "http://host.docker.internal:1234/v1"
  ask LLM_API_KEY "API-Token des KI-Servers (leer, wenn keiner)" ""
  ask LLM_MODEL_ID "Modell-ID (laut GET /v1/models)" "openai/gpt-oss-120b"
  ask EMBEDDING_MODEL_ID "Embedding-Modell (leer = nur Volltextsuche)" "text-embedding-nomic-embed-text-v1.5"
  ask APP_HOST "Hostname/IP, unter dem Firmen-KI erreichbar ist" "$(hostname -f 2>/dev/null || hostname)"
  ask TLS_MODE "Zugriff: http (Port im LAN) | cert (HTTPS, eigenes Zertifikat) | internal (HTTPS, interne CA)" "http"
  case "$TLS_MODE" in
    http)     ask HTTP_PORT "HTTP-Port" "80"; COMPOSE_FILE="compose.yml:compose.direct.yml"; ASSUME_SSL=false; FORCE_SSL=false ;;
    cert|internal) COMPOSE_FILE="compose.yml:compose.tls.yml"; HTTP_PORT=80; ASSUME_SSL=true; FORCE_SSL=true ;;
    *) fail "TLS_MODE muss http, cert oder internal sein" ;;
  esac
  [ -n "$REGISTRY_USER" ] && [ -n "$REGISTRY_TOKEN" ] || fail "Registry-Zugang fehlt"

  umask 077
  cat > .env <<ENV
# Firmen-KI – Konfiguration (erzeugt von install.sh am $(date +%Y-%m-%d)). Nur root darf diese Datei lesen.
FIRMENKI_HOME=$HOME_DIR
COMPOSE_FILE=$COMPOSE_FILE
COMPOSE_PROJECT_NAME=firmen-ki
DOCKER_GID=$(stat -c %g /var/run/docker.sock 2>/dev/null || stat -f %g /var/run/docker.sock)

APP_HOST=$APP_HOST
ALLOWED_HOSTS=
HTTP_PORT=$HTTP_PORT
HTTP_BIND=0.0.0.0
ASSUME_SSL=$ASSUME_SSL
FORCE_SSL=$FORCE_SSL

# Geheimnisse – nie ändern (SECRET_KEY_BASE schützt gespeicherte Passwörter; bei Verlust sind sie unlesbar)
SECRET_KEY_BASE=$(rand 64)
POSTGRES_PASSWORD=$(rand 24)
SEARXNG_SECRET=$(rand 32)

# Registry (nur Installer/Updater)
REGISTRY=$REGISTRY
REGISTRY_OWNER=$REGISTRY_OWNER
REGISTRY_USER=$REGISTRY_USER
REGISTRY_TOKEN=$REGISTRY_TOKEN

# Updates
UPDATE_CHANNEL=$CHANNEL
UPDATE_URL=$UPDATE_URL

# KI-Server
LLM_BASE_URL=$LLM_BASE_URL
LLM_API_KEY=$LLM_API_KEY
LLM_MODEL_ID=$LLM_MODEL_ID
LLM_CONTEXT_WINDOW=65536
EMBEDDING_MODEL_ID=$EMBEDDING_MODEL_ID
EMBEDDING_DIMENSIONS=768

# Dokumentbibliothek (nur lesend als /docs eingebunden)
DOCS_ROOT=$HOME_DIR/docs

# Betrieb
RAILS_LOG_LEVEL=info
WEB_CONCURRENCY=2
RAILS_MAX_THREADS=5
JOB_CONCURRENCY=1
ENV
  chmod 600 .env
  info ".env geschrieben"
  case "$TLS_MODE" in
    cert)     info "Zertifikat später nach caddy/certs/cert.pem und caddy/certs/key.pem legen (Kette + Schlüssel), dann bin/firmenki restart" ;;
    internal) info "Nach dem Start: bin/firmenki ca-cert > firmen-ki-root-ca.crt und auf den Arbeitsplätzen als vertrauenswürdig installieren" ;;
  esac
fi
REGISTRY="$(envval .env REGISTRY)"; REGISTRY_OWNER="$(envval .env REGISTRY_OWNER)"
REGISTRY_USER="$(envval .env REGISTRY_USER)"; REGISTRY_TOKEN="$(envval .env REGISTRY_TOKEN)"
UPDATE_URL="$(envval .env UPDATE_URL)"; COMPOSE_FILE="$(envval .env COMPOSE_FILE)"

# --- Registry-Login (Credentials nur in einem temporären Docker-Config-Verzeichnis) -------------------------
say "Registry-Anmeldung ($REGISTRY)"
DOCKER_CONFIG="$(mktemp -d)"; export DOCKER_CONFIG; trap 'rm -rf "$DOCKER_CONFIG"' EXIT
printf '%s' "$REGISTRY_TOKEN" | docker login "$REGISTRY" -u "$REGISTRY_USER" --password-stdin >/dev/null || fail "Registry-Login fehlgeschlagen"
info "angemeldet als $REGISTRY_USER"

# --- Manifest laden und prüfen -------------------------------------------------------------------------------
say "Release-Manifest laden (Kanal $CHANNEL)"
manifest="state/manifest-$CHANNEL.json"
curl -fsSL "$UPDATE_URL/channels/$CHANNEL.json" -o "$manifest" || fail "Manifest $UPDATE_URL/channels/$CHANNEL.json nicht ladbar"
if [ "$VERIFY" = 1 ]; then
  case "$RELEASE_PUBLIC_KEY" in __RELEASE_PUBLIC_KEY__) fail "Dieser Installer ist nicht signiert (Entwicklungsstand). Nur mit --no-verify verwendbar." ;; esac
  curl -fsSL "$UPDATE_URL/channels/$CHANNEL.json.sig" -o "$manifest.sig" || fail "Signatur nicht ladbar"
  printf '%s\n' "$RELEASE_PUBLIC_KEY" > state/release_signing.pub
  base64 -d "$manifest.sig" > "$manifest.sig.bin"
  openssl pkeyutl -verify -pubin -inkey state/release_signing.pub -rawin -in "$manifest" -sigfile "$manifest.sig.bin" >/dev/null \
    || fail "Signatur des Manifests ungültig – Abbruch (Manipulation oder falscher Update-Server)"
  rm -f "$manifest.sig.bin"
  info "Signatur gültig"
else
  info "WARNUNG: Signaturprüfung abgeschaltet (--no-verify)"
fi
jq -e '.schema == 1 and .product == "firmen-ki"' "$manifest" >/dev/null || fail "Manifest hat ein unbekanntes Format"
latest="$(jq -r .latest "$manifest")"
rel="$(jq -c --arg v "$latest" '.releases[] | select(.version == $v)' "$manifest")"
[ -n "$rel" ] || fail "Release $latest nicht im Manifest"
[ "$(jq -r '.requires_manual_steps // false' <<<"$rel")" = "false" ] || fail "Release $latest erfordert manuelle Schritte – siehe Changelog"
info "Aktuelle Version: $latest"

# Image-Referenzen: Registry-Namensraum aus .env, Digest aus dem Manifest (Tag nur zur Anzeige)
img() { # img <app|sandbox|updater>
  local ref digest name
  ref="$(jq -r ".images.$1.ref" <<<"$rel")"; digest="$(jq -r ".images.$1.digest" <<<"$rel")"
  name="${ref#*/}"; name="${name#*/}"                       # ghcr.io/<owner>/firmen-ki:1.0.0 → firmen-ki:1.0.0
  printf '%s/%s/%s@%s' "$REGISTRY" "$REGISTRY_OWNER" "$name" "$digest"
}
APP_IMAGE="$(img app)"; SANDBOX_IMAGE="$(img sandbox)"; UPDATER_IMAGE="$(img updater)"

if [ -f versions.env ] && [ "$(envval versions.env APP_VERSION)" = "$latest" ]; then
  info "versions.env ist bereits auf $latest"
else
  [ -f versions.env ] && cp versions.env versions.env.prev
  cat > versions.env <<V
# Von install.sh/Updater geschrieben – nicht von Hand ändern. Images werden ausschließlich per Digest referenziert.
APP_VERSION=$latest
APP_IMAGE=$APP_IMAGE
SANDBOX_VERSION=$(jq -r .images.sandbox.version <<<"$rel")
SANDBOX_IMAGE=$SANDBOX_IMAGE
UPDATER_VERSION=$(jq -r .images.updater.version <<<"$rel")
UPDATER_IMAGE=$UPDATER_IMAGE
V
  info "versions.env geschrieben"
fi

# --- Images laden --------------------------------------------------------------------------------------------
say "Images laden (App, Sandbox ~3–5 GB, Updater)"
for i in "$APP_IMAGE" "$SANDBOX_IMAGE" "$UPDATER_IMAGE"; do
  docker image inspect "$i" >/dev/null 2>&1 && { info "vorhanden: $i"; continue; }
  docker pull -q "$i" >/dev/null || fail "Pull fehlgeschlagen: $i"
  info "geladen: $i"
done

# --- Produktdateien aus dem App-Image (Compose, Caddy-Vorlagen, SearXNG, CLI) --------------------------------
say "Produktdateien aus dem App-Image übernehmen"
tmpc="$(docker create "$APP_IMAGE")"
extract="$(mktemp -d)"
docker cp "$tmpc:/rails/deploy/." "$extract/" && docker rm "$tmpc" >/dev/null
cp "$extract"/compose.yml "$extract"/compose.direct.yml "$extract"/compose.tls.yml .
cp "$extract"/firmenki bin/firmenki && chmod 755 bin/firmenki
cp "$extract"/install.sh bin/install.sh && chmod 755 bin/install.sh
cp "$extract"/searxng/settings.yml searxng/settings.yml
cp "$extract"/caddy/Caddyfile.cert "$extract"/caddy/Caddyfile.internal caddy/
rm -rf "$extract"
if [ ! -f caddy/Caddyfile ]; then
  case "${TLS_MODE:-http}" in
    cert) cp caddy/Caddyfile.cert caddy/Caddyfile ;;
    *)    cp caddy/Caddyfile.internal caddy/Caddyfile ;;
  esac
fi
[ -f compose.override.yml ] || cat > compose.override.yml <<'O'
# Kundeneigene Anpassungen (wird von Updates NIE überschrieben). Beispiele:
# services:
#   app:
#     volumes:
#       - /mnt/nas/dokumente:/docs/nas:ro     # weitere Dokumentordner (Hinweis: DOCS_ROOT in .env bleibt /docs)
#     environment:
#       LLM_REQUEST_TIMEOUT: "600"
services: {}
O
info "compose.yml, bin/firmenki, searxng/settings.yml, caddy/ aktualisiert"

# --- Start ---------------------------------------------------------------------------------------------------
say "Start"
bin/firmenki check || true
bin/firmenki up

say "Fertig."
info "Ersteinrichtung im Browser öffnen und den ersten Administrator anlegen."
info "Danach: bin/firmenki smoke  (prüft KI-Server, Sandbox und löst eine Testaufgabe)"
info "Betrieb: bin/firmenki status | logs | backup | update   – Doku: docs/INSTALL.md"
