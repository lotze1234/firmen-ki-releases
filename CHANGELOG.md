# Changelog

Alle nennenswerten Änderungen an Firmen-KI stehen in dieser Datei. Der Abschnitt der jeweiligen Version
wird Kunden auf der Seite „Updates“ als Änderungsübersicht angezeigt – deshalb bitte verständlich und aus
Anwendersicht formulieren (was ist neu, was hat sich geändert, worauf ist beim Update zu achten).

Format nach [Keep a Changelog](https://keepachangelog.com/de/1.1.0/), Versionsnummern nach
[Semantic Versioning](https://semver.org/lang/de/). Der oberste Abschnitt `[Unreleased]` sammelt die Änderungen
bis zum nächsten Release; `bin/release <version>` macht daraus den Versionsabschnitt.

Rubriken: **Neu**, **Geändert**, **Behoben**, **Entfernt**, **Sicherheit**, **Neue Skills**, **Hinweise zum Update**.

## [Unreleased]

## [1.2.0] – 2026-09-10

### Behoben
- Updates-Seite zeigte nach einem abgeschlossenen Update die gerade installierte Version weiter als „verfügbar“ an (samt Zähler in der Seitenleiste). Jetzt gilt nur ein Release als verfügbar, das neuer als die laufende Version ist, und nach einem Update wird sofort neu geprüft.
- Einstellungen → KI-Agent- und Skill-Verbesserung: Die Karten für Claude Code und Codex stehen untereinander, Knöpfe und Versionsangaben brechen nicht mehr um.

### Neu
- Hilfe & FAQ ergänzt (DE/EN/FR): Zeitangaben unter Antworten, Modellauswahl „Standard“, Cloud-Datenbanken mit SSL, Benutzerverzeichnis, Ablauf eines Updates mit Sperrbildschirm, Anmeldung von Claude Code/Codex.
- **Benutzerverzeichnis für die KI**: Neues Werkzeug `list_users` (Name, E-Mail, Rolle, aktiv), damit der Assistent Fragen wie „Welche Benutzer gibt es?“ beantworten oder Kollegen-Adressen nachschlagen kann. Für Nicht-Admins nur mit dem Haken „Benutzerverzeichnis“ beim Benutzer.
- **Datenzugriff je Benutzer**: Beim Anlegen oder Bearbeiten eines Benutzers legt der Administrator per Haken fest, auf welche angebundenen Quellen der Benutzer zugreifen darf (Dokumente, Datenbanken, DATEV, Server, Ticketsysteme). Ohne Haken hat ein Benutzer keinen Zugriff; Administratoren haben immer alle Quellen. Die Freigaben gelten für Unterhaltungen, Agenten, automatische Aufgaben und das Öffnen von Dokumenten.

### Hinweise zum Update
- Bestehende Benutzer ohne Administratorrolle verlieren mit diesem Update den Zugriff auf angebundene Quellen, bis ein Administrator unter Benutzer die entsprechenden Haken setzt.

## [1.1.9] – 2026-09-10

### Behoben
- Einstellungen → KI-Agent- und Skill-Verbesserung: Nach „Bei Claude anmelden“ (ebenso Codex) blieb die Karte leer, statt Link zur Anmeldeseite und Code-Feld zu zeigen. Ursache war das automatische Nachladen der Karte.

## [1.1.8] – 2026-09-10

### Geändert
- Ticketsysteme (DocBee): Der Assistent kennt jetzt die Status (inkl. geschlossen/pausiert) und Prioritäten des angebundenen Systems aus dem Systemprompt und kann Fragen wie „Was wartet auf den Kunden?“ oder „Welche Tickets haben hohe Priorität?“ gezielt beantworten. Die Liste wird stündlich aktualisiert.

## [1.1.7] – 2026-09-10

### Neu
- Zeitmessung im Chat: Jeder Werkzeugaufruf zeigt seine Dauer, jede Antwort die Modellzeit des Schritts und am Ende die Gesamtzeit seit der Frage (Modell und Werkzeuge getrennt). Die Aktivitätsleiste zählt live mit, solange der Assistent arbeitet.
- Während ein Update läuft, ist die Oberfläche für alle Benutzer gesperrt: Ein Sperrbildschirm zeigt Version und aktuellen Schritt, Nachrichten werden nicht angenommen, automatische Aufgaben warten. Nach dem Umschalten lädt die Seite von selbst neu.

## [1.1.6] – 2026-09-10

### Geändert
- Modellauswahl in Unterhaltung, Agent und Aufgabe: Ist nur ein KI-Modell angebunden, erscheint nur noch „Standard (Name)“ statt zusätzlich desselben Modells als zweiter Eintrag.

### Neu
- **Datenanbindung → Datenbanken**: SSL-Modus wählbar (bevorzugt, erforderlich, mit Zertifikatsprüfung, aus). Cloud-Datenbanken wie Supabase lassen sich damit über den Connection-Pooler mit erzwungenem SSL anbinden; geprüft mit einer Supabase-Datenbank (Nur-Lese-Rolle, Port 6543).

## [1.1.5] – 2026-09-10

### Geändert
- Beim Öffnen der Updates-Seite wird sofort nach neuen Versionen gesucht (höchstens alle zwei Minuten, nicht während einer laufenden Installation); der Knopf „Jetzt prüfen“ bleibt für die manuelle Wiederholung.
- Updates-Seite: Ist die Statusdatei des Updaters für die Anwendung nicht lesbar (Updater vor 1.0.1), erscheint ein Hinweis mit dem Befehl zur Behebung statt einer leeren Anzeige.

## [1.1.4] – 2026-09-10

### Behoben
- Leerer Wert für `LLM_REQUEST_TIMEOUT` (Standard bei neuen Installationen) ergab 0 Sekunden: Modell-Liste, Verbindungstest und Smoke-Test meldeten sofort „Zeitüberschreitung“. Leere Werte gelten jetzt als 600 Sekunden.
- Updates-Seite zeigte nach dem Start eines Updates „500 Internal Server Error“, weil der Updater die Statusdatei `state/update.json` ohne Leserecht für die App anlegte. Die App verkraftet das jetzt; der Updater 1.0.1 schreibt die Datei lesbar.

## [1.1.3] – 2026-09-10

### Behoben
- „Verbindung testen“, „Modelle laden“ und „Testmail senden“ auf Bearbeiten-Seiten (KI-Modelle, Dokumente, Server, Ticketsysteme, E-Mail-Versand) lieferten „404 Not Found“, weil das Formular ein verstecktes `_method=patch` mitschickte. Beim Anlegen war der Test nicht betroffen.

## [1.1.2] – 2026-09-10

### Behoben
- Neue Installation ohne API-Schlüssel des KI-Servers (Feld leer gelassen): Nach der Ersteinrichtung erschien Fehler 500, weil der leere Schlüssel an RubyLLM ging. Leere Werte aus der Umgebung werden jetzt wie „nicht gesetzt“ behandelt.

## [1.1.1] – 2026-09-10

### Neu
- **Datenanbindung → Ticketsysteme**: DocBee anbinden (Adresse, Benutzer/Passwort oder API-Token, Verbindungstest). Der Assistent sucht und liest Tickets mit Verlauf (Tools `ticket_search`, `ticket_get`) und darf nur mit „Schreiben erlauben“ Kommentare anfügen oder Tickets anlegen (`ticket_comment`, `ticket_create`); jeder Zugriff im Audit.
- Unter jedem Eingabefeld steht der Hinweis „<App-Name> kann Fehler machen. Überprüfe wichtige Informationen.“ (Deutsch, Englisch, Französisch).

## [1.1.0] – 2026-09-09

### Neu
- **E-Mail-Versand** (Einstellungen → E-Mail-Versand): SMTP oder Microsoft 365 über die Graph API (App-Registrierung mit `Mail.Send`), Absender, Testmail-Knopf, Empfänger-Positivliste (Adressen oder @domain). Der Assistent kann damit auf Wunsch E-Mails mit Anhängen aus seinen Ergebnissen senden (Tool `send_email`, jeder Versand im Audit), und automatische Aufgaben melden ihr Ergebnis per E-Mail – nur bei Meldungen oder nach jedem Lauf.
- **Aufgaben**: automatische, wiederkehrende Aufgaben für den Assistenten oder einen Agenten (alle X Minuten, täglich, wöchentlich). Anlegen per Formular oder direkt im Chat („Prüfe … alle 2 Stunden“ – der Assistent legt die Aufgabe über das Tool `schedule_task` an). Jede Aufgabe hat eine eigene Unterhaltung mit den vollständigen Antworten; die Seite „Aufgaben“ zeigt Verlauf (OK / Meldung / Fehler), nächsten Lauf, Jetzt ausführen, Pausieren, Meldungen als gesehen markieren. Antworten, die mit „ACHTUNG“ beginnen, zählen als Meldung und erscheinen als Zähler in der Seitenleiste. Administratoren sehen die Aufgaben aller Benutzer.
- **Datenanbindung → Server**: Server per SSH anbinden (Schlüssel oder Passwort, verschlüsselt gespeichert) mit einer **Positivliste erlaubter Befehle** (ein Muster je Zeile, `*` für Argumente; Verkettungen, Umleitungen und Schreibbefehle sind immer verboten). Der Assistent nutzt das Tool `server_command` für Speicherplatz, Dienste, Last und Logs; jeder Aufruf steht im Audit, abgelehnte Befehle als blockiert. Verbindungstest im Formular; Host-Schlüssel werden unter `storage/ssh/known_hosts` gemerkt.
- 16 Standard-Agenten für den Büroalltag: Daten-Analyst, Berichtsersteller, Dokumenten-Konverter, Dokumenten-Rechercheur, Web-Rechercheur, Präsentations-Ersteller, Serienbrief-Assistent, Projektplaner, Protokollant, Übersetzer, Zusammenfasser, Angebotsersteller, Rechnungsprüfer, Kennzahlen-Reporter, Listen-Abgleicher, Dokumenten-Sortierer. Auslöser und Beschreibungen in Deutsch, Englisch und Französisch; die Agenten antworten in der Sprache der Anfrage. Der Data Analyst hat die automatische Funktionsprüfung bestanden (Testaufgabe Einlesen → Bereinigen → Kennzahlen → Pivot → Diagramme → Excel und PDF).
- Standard-Skills und -Agenten haben Beschreibungen in drei Sprachen (Frontmatter `description_en`, `description_fr`).

- **Datenanbindung → Dokumente**: SharePoint Online und OneDrive for Business als Dokumentquelle über Microsoft Graph (Entra-App-Registrierung mit `Sites.Read.All`): Site-URL, Bibliothek, Unterordner, Verbindungstest, regelmäßiger Scan wie bei Ordnern und SMB. Dokumente aus SMB- und SharePoint-Quellen lassen sich jetzt auch direkt aus der Trefferliste öffnen.
- Hochgeladene Dateien erscheinen als Karten mit Typ-Icon, Name, Format und Größe direkt im Eingabefeld und lassen sich dort einzeln wieder entfernen; noch nicht gesendete Dateien werden ebenfalls als Karten gezeigt.
- Dateien lassen sich per Drag & Drop in das Chatfenster ziehen oder aus der Zwischenablage einfügen, auch mehrere auf einmal; zu große Dateien werden gemeldet.
- Der Assistent beantwortet Bedienungsfragen aus der Hilfe & FAQ (neues Tool `help_lookup`, durchsucht die FAQ in der Sprache des Benutzers).
- **Hilfe & FAQ** in der Seitenleiste: ausführliche Fragen und Antworten in Deutsch, Englisch und Französisch zu Bedienung, Agenten, Skills, KI-Modellen, Datenanbindung, Sicherheit und Administration, mit Suche und der Liste der aktiven Agenten und Skills.

### Geändert
- Standard-Skills und -Agenten heißen jetzt englisch (z. B. `excel-create`, `data-analyst`); bestehende Installationen werden beim Update automatisch umbenannt, Verweise in Agenten und Vorschlägen folgen.
- Neue Seitenleiste: Suche in den Unterhaltungen, Einklappen auf Icons, Menüpunkte mit Icons, Gruppen „Verwaltung“ und „Unterhaltungen“, laufende Antworten mit Punkt markiert, Konto mit Avatar in der Fußzeile.

## [1.0.1] – 2026-09-09

### Behoben
- Neuinstallation: Der Start scheiterte, wenn `LLM_MAX_TOKENS` in der Umgebung leer war (Compose reicht nicht gesetzte Werte als leer durch). Leere Werte gelten jetzt als nicht gesetzt, und ein Fehler beim Übernehmen der Startwerte verhindert den Start nicht mehr.

### Hinweise zum Update
- Bestehende Installationen sind nicht betroffen; 1.0.0 ließ sich nur nicht frisch installieren.

## [1.0.0] – 2026-09-09

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
- Erstes freigegebenes Release (entspricht den Vorabversionen 0.9.0-beta.1 und 0.9.0-beta.2). Keine Vorgängerversion.
