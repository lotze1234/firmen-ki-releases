# Changelog

Alle nennenswerten Änderungen an Firmen-KI stehen in dieser Datei. Der Abschnitt der jeweiligen Version
wird Kunden auf der Seite „Updates“ als Änderungsübersicht angezeigt – deshalb bitte verständlich und aus
Anwendersicht formulieren (was ist neu, was hat sich geändert, worauf ist beim Update zu achten).

Format nach [Keep a Changelog](https://keepachangelog.com/de/1.1.0/), Versionsnummern nach
[Semantic Versioning](https://semver.org/lang/de/). Der oberste Abschnitt `[Unreleased]` sammelt die Änderungen
bis zum nächsten Release; `bin/release <version>` macht daraus den Versionsabschnitt.

Rubriken: **Neu**, **Geändert**, **Behoben**, **Entfernt**, **Sicherheit**, **Neue Skills**, **Hinweise zum Update**.

## [Unreleased]

## [0.9.0-beta.2] – 2026-09-09

### Behoben
- Veröffentlichung des Installers im Release-Workflow (Platzhalterprüfung).

## [0.9.0-beta.1] – 2026-09-09

### Neu
- Firmen-KI hat jetzt eine Versionsnummer. Sie steht unten in der Seitenleiste und auf der Status-Seite
  (zusammen mit Build-Datum und Sandbox-Version).
- Standard-Skills und Standard-Agenten werden nach einem Update automatisch auf den neuen Stand gebracht.
- Neue Admin-Seite **Updates**: zeigt installierte und verfügbare Version mit Änderungsübersicht, prüft alle
  6 Stunden den Update-Server (Schaltfläche „Jetzt prüfen“), installiert Updates per Knopfdruck oder automatisch
  im Wartungsfenster (Wochentage und Uhrzeit wählbar) und führt einen Verlauf aller Updates.
- Installation als Docker-Compose-Paket unter `/opt/firmen-ki` mit Installer, Betriebs-CLI `bin/firmenki`
  (Status, Logs, Backup, Wiederherstellung, Update, Rollback) und wahlweise HTTP im LAN oder HTTPS über Caddy.
- Skills und Agenten sind jetzt in **Standard** (kommt mit Updates) und **Firmen-Inhalte** (bleiben bei Updates
  unverändert) getrennt. Standard-Inhalte lassen sich per „Anpassen“ als Firmen-Kopie übernehmen; ändert sich der
  Standard später, zeigt die Seite die Unterschiede und bietet „Zurücksetzen“ an. Firmen-Skills können als ZIP,
  Firmen-Agenten als Markdown exportiert und importiert werden.
- Firmen-Pakete des Herstellers (`packages/`) werden beim Start und über „Pakete neu einlesen“ importiert.
- Einstellungen → Tools: einzelne Tools abschalten und die Tool-Policy per YAML überlagern; beides bleibt bei
  Updates erhalten.
- Neuer Bereich **KI-Modelle**: Anbindungen an mehrere Anbieter verwalten – lokale OpenAI-kompatible Server
  (LM Studio, vLLM, llama.cpp), Ollama, Anthropic Claude, OpenAI ChatGPT, Google Gemini, OpenRouter (u. a. Meta
  Llama), Mistral, DeepSeek, xAI, Perplexity. Je Anbindung Zugang, Modell (Liste über „Modelle laden“ oder
  manuell), Kontextfenster, Antwortlänge, Temperatur, Reasoning; „Verbindung testen“ mit Dauer und Token/s.
  Ein Modell ist Standard; in jeder Unterhaltung (Chat-Kopf „Modell“) und bei jedem Agenten kann ein anderes gewählt
  werden. Änderungen gelten sofort ohne Neustart; Werte aus der Umgebung legen nur beim ersten Start das
  Standard-Modell an.
- **KI-Agent- und Skill-Verbesserung**: Ein Entwicklerwerkzeug (Claude Code oder Codex, im App-Image enthalten;
  Anmeldung unter Einstellungen mit dem Claude- bzw. ChatGPT-Konto über die Anmeldeseite des Anbieters) überarbeitet Skills und Agenten im Hintergrund – nach
  fehlgeschlagenen Agenten-Prüfungen, bei gehäuften Skript-Fehlern oder auf Knopfdruck. Vorschläge erscheinen unter
  „Verbesserungen“ mit Begründung und Diff und werden vom Admin übernommen oder verworfen; Standard-Inhalte werden
  dabei zu Firmen-Kopien.
- Einstellungen → **Dokumentsuche**: Embedding-Modell, Dimensionen und die Anbindung für Embeddings in der
  Oberfläche, mit Hinweis auf die Neu-Indizierung (`firmenki:documents:reindex`).

- Die Oberfläche ist dreisprachig (Deutsch, Englisch, Französisch): Umschalter DE/EN/FR unten in der Seitenleiste,
  gespeichert je Benutzer; ohne Einstellung folgt die Sprache dem Browser. Der Assistent antwortet im Zweifel in der
  Oberflächensprache.
- Seitenleiste: DATEV, Datenbanken und Dokumente sind unter „Datenanbindung“ zusammengefasst.

### Hinweise zum Update
- Erstes Release, keine Vorgängerversion.
