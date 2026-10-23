# Changelog

Alle nennenswerten Änderungen an Firmen-KI stehen in dieser Datei. Der Abschnitt der jeweiligen Version
wird Kunden auf der Seite „Updates“ als Änderungsübersicht angezeigt – deshalb bitte verständlich und aus
Anwendersicht formulieren (was ist neu, was hat sich geändert, worauf ist beim Update zu achten).

Format nach [Keep a Changelog](https://keepachangelog.com/de/1.1.0/), Versionsnummern nach
[Semantic Versioning](https://semver.org/lang/de/). Der oberste Abschnitt `[Unreleased]` sammelt die Änderungen
bis zum nächsten Release; `bin/release <version>` macht daraus den Versionsabschnitt.

Rubriken: **Neu**, **Geändert**, **Behoben**, **Entfernt**, **Sicherheit**, **Neue Skills**, **Hinweise zum Update**.

## [Unreleased]

## [1.8.0-beta.2] – 2026-10-23

### Neu
- **Workflow-Karte**: Workflows bauen Sie jetzt auf einer Karte wie auf einer Folie. Agenten und Freigabe-Stopps lassen sich frei verschieben und per Ziehen vom Ausgangspunkt einer Karte zur nächsten verbinden (oder per Klick auf Ausgangs- und Eingangspunkt). Über den Knopf auf einer Linie fügen Sie dort einen Freigabe-Stopp ein oder lösen die Verbindung. Nicht verbundene Karten sind markiert, gespeichert wird nur eine durchgehende Kette. Zoom und „Alles einpassen“ helfen bei größeren Abläufen, die Anordnung wird mitgespeichert. Die bisherige Listenansicht bleibt per Umschalter erhalten (auf kleinen Bildschirmen Standard). Die Laufansicht zeigt den Ablauf als Live-Karte mit dem Status jedes Schritts.
- **Workflows**: Unter *Workflows* in der Seitenleiste bauen Sie aus Agenten einen festen Ablauf. Links wählen Sie in der Palette Agenten
  aus (per Klick, Enter oder Ziehen), rechts entsteht die Kette von oben nach unten; zu jedem Agenten schreiben Sie, was er mit dem
  Ergebnis des vorigen Schritts tun soll. Ein **Freigabe-Stopp** hält den Ablauf zwischen zwei Schritten an. Der Editor warnt, wenn ein
  Agent, der schreiben oder senden kann, keinen Freigabe-Stopp direkt vor sich hat. Persönliche Workflows sieht nur der Besitzer.
  Gestartet wird per **Starten** mit Auftragstext und Dateien. Die Laufansicht zeigt live jeden Schritt mit Status, Aktivität, Antwort,
  Dateien, Tokens und Kosten; bei einem Freigabe-Stopp geben Sie mit **Weiter** frei oder brechen ab, **Stopp** beendet einen laufenden
  Lauf, und nach einem Fehler startet **Neu starten** einen neuen Lauf mit derselben Eingabe. Der Chat eines laufenden Workflows ist
  bis zum Ende gesperrt. Administratoren geben eigene Workflows mit **Für alle freigeben** frei, sofern alle Agenten bereits für
  alle freigegeben sind; ein Workflow läuft immer mit den Rechten des Startenden. Eine Videoanleitung erklärt das Bauen und Starten.
  Der Freigabe-Stopp wirkt nur zwischen den Schritten. **Neu starten** ist gegen Doppelklick gesichert.
  Workflows laufen auch **nach Zeitplan**: **Regelmäßig ausführen** in der Workflow-Übersicht (oder die Auswahl *Workflow* im Formular
  unter *Aufgaben*) legt eine Aufgabe an, die den Workflow mit Ihren Rechten startet. Status und Meldungen erscheinen im Verlauf der
  Aufgabe; bei einem Freigabe-Stopp zeigt die Seitenleiste die Zahl wartender Läufe, und wenn E-Mail-Versand eingerichtet ist, kommt
  eine E-Mail mit dem Link zum Lauf. Wartende Läufe werden nach sieben Tagen beendet.
  In **Central** zeigt der Abschnitt *Workflows* je Workflow Läufe, Erfolgsquote, durchschnittliche Dauer, Wartezeit auf Freigaben, Kosten
  und einen 30-Tage-Verlauf; die Detailseite listet zusätzlich Fehler je Schritt und die Läufe (ohne Inhalte). Administratoren sehen nur
  Zahlen, nie Inhalte fremder Läufe. Alle Nutzer erreichen über **Kennzahlen** in der Workflow-Übersicht die Seite mit ihren eigenen Läufen.
  Jede Änderung an Name, Beschreibung oder Ablauf legt eine **Version** an; auf der Central-Seite des Workflows (Besitzer bzw. bei geteilten
  Workflows Administratoren) sehen Sie den Verlauf mit Unterschied zu früheren Ständen und können einen älteren Stand **wiederherstellen**.
  Geteilte Workflows lassen sich im Editor mit **Als Entwurf speichern** ändern, ohne dass der Live-Workflow etwas merkt: Der Entwurf wird mit
  Testfällen getestet und dann live geschaltet (mit Warnung, wenn sich der Live-Stand inzwischen geändert hat, und optional nur nach
  bestandenen Tests). **Testfälle** (Auftrag und Abnahmekriterien) werden mit **Alle testen** als Evaluation ausgeführt; ein Testlauf endet
  am ersten Freigabe-Stopp und gibt ihn nie frei, bewertet wird das Zwischenergebnis.
- **Hilfe auf jeder Seite**: Unten rechts sitzt ein animiertes Fragezeichen mit Sprechblase. Ein Klick zeigt die Hilfe zur aktuellen
  Seite – passende Videoanleitungen zum direkten Abspielen und die wichtigsten Fragen mit Antworten – und führt auf Wunsch zur
  vollständigen Hilfe.
- **Videoanleitungen in der Hilfe**: Im Abschnitt „Agenten“ der Seite *Hilfe & FAQ* zeigen kurze Videos, wie man einen Agenten
  im Chat nutzt und im Baukasten einen eigenen baut. Administratoren sehen zusätzlich Videos zu *Central* sowie zu Entwürfen, Live
  schalten und Versionen. Die Videos gibt es auf Deutsch, Englisch und Französisch; die Schritte stehen zusätzlich als Text darunter.
- **Entwürfe für geteilte Agenten**: Änderungen an einem geteilten Firmen-Agenten lassen sich als Entwurf speichern (Agenten-Formular,
  Baukasten, Verbesserungsvorschlag „Als Entwurf übernehmen“), ohne dass der Agent live etwas merkt. In *Central* testen Administratoren
  den Entwurf mit den Testfällen, sehen den Unterschied zum Live-Stand und schalten ihn live oder verwerfen ihn. Der Schalter
  „Live nur nach bestandenen Tests“ sperrt die Freigabe, bis die letzte Evaluation des Entwurfs bestanden ist. Persönliche Agenten
  sowie Standard- und Paket-Agenten haben keine Entwürfe.
- **Testfälle für Agenten**: In *Central* lassen sich je Agent Testfälle anlegen (Aufgabe plus Abnahmekriterien), aus der letzten
  automatischen Prüfung übernehmen oder vom Modell vorschlagen. „Alle testen“ führt die aktiven Testfälle nacheinander aus, ein
  Prüfer bewertet jede Antwort. Das Ergebnis (bestanden x von y, Ø Score, getestete Version) steht im Verlauf der Evaluationen und in
  der Übersicht als „Letzte Evaluation“. Persönliche Agenten werden immer mit den Rechten ihres Besitzers getestet.
- **Versionen für Agenten**: Jede Änderung am Inhalt eines Agenten (Anweisungen, Tools, Skills, Modell) legt automatisch eine neue
  Version an, egal ob per Formular, Baukasten, Verbesserungsvorschlag, Assistent oder automatischer Prüfung. In *Central* zeigt
  die Detailseite des Agenten den Verlauf mit Datum, Herkunft und Autor; eine Version lässt sich mit den Unterschieden ansehen und
  mit „Wiederherstellen“ zurückholen. Zeitplan und Prüfstatus bleiben dabei unverändert. Bestehende Agenten starten mit Version 1.
- **Central (Kennzahlen)**: Neue Seite *Central* für Administratoren mit Läufen, Erfolgsquote, Ø Dauer, Tokens, Tool-Fehlerquote
  und Kosten je Agent (7/30 Tage, Verlauf über 30 Tage). Benutzer sehen die Kennzahlen ihrer eigenen Agenten und nur ihre
  eigenen Läufe. Kosten erscheinen nur, wenn unter *KI-Modelle* ein Preis je Million Tokens eingetragen ist. Prüf- und
  Testunterhaltungen von Agenten erscheinen nicht mehr in der Chat-Liste. Die automatische Verbesserung wertet jetzt die
  erfassten Läufe aus (viele Tool-Fehler oder viele fehlgeschlagene Läufe).
- **Central: Oberfläche**: Übersicht mit Kennzahl-Kacheln, Tabelle je Agent mit Verlaufslinie und Umschalter 7/30 Tage; je Agent eine
  Detailseite mit Tagesdiagramm (Läufe ohne und mit Fehler, Details beim Überfahren), Aufteilung nach Art, häufigsten Tool-Fehlern
  und gefilterter Laufliste mit Link in die Unterhaltung. Unter *Agenten bauen* zeigt jeder eigene Agent Läufe und Erfolgsquote der
  letzten 30 Tage. Unter *KI-Modelle* lassen sich Preise je 1 Mio. Tokens eintragen, damit Central Kosten anzeigt.
- **Kennzahlen für Agenten**: Jeder Lauf eines Agenten (Chat, Delegation, Zeitplan, Ausprobieren, Prüfung) wird jetzt mit
  Dauer, Tokens, Tool-Aufrufen und Ergebnis erfasst. Auf der Agenten-Seite erscheinen Läufe, Erfolgsquote, Ø Dauer und
  Tokens der letzten 30 Tage; die Erfassung beginnt mit diesem Update (keine Rückwirkung).
- **Agenten bauen**: Jeder Benutzer kann sich unter *Agenten bauen* per Drag & Drop einen eigenen Agenten aus Bausteinen
  zusammenstellen (Rolle und Ziel, Auslöser, Wissen und Daten, Fähigkeiten, Arbeitsschritte, Regeln, Ausgabe), mit
  Live-Vorschau, Expertenblick auf die erzeugten Anweisungen und „Speichern & ausprobieren“. Vorlagen erleichtern den Start.
  Persönliche Agenten sieht nur ihr Besitzer; Administratoren können sie unter *Agenten* für alle freigeben.
- Stichwörter und ein optionaler Zeitplan lassen sich im Baukasten direkt am Agenten festlegen.

### Sicherheit
- **Wiederherstellen ohne Rechteausweitung**: Nutzer ohne Administratorrechte können beim Wiederherstellen einer Agent-Version keine Tools oder Modelle mehr zurückholen, die ihnen nicht zustehen (Baukasten-Agenten werden aus dem Bauplan neu geprüft). Der Assistent darf bestehende geteilte Agenten nur noch für Administratoren ändern; gilt „Live nur nach bestandenen Tests“, wird die Änderung ein Entwurf.
- **Entwürfe prüfen ihre Basis**: „Live schalten“ warnt, wenn sich der Live-Stand seit dem Anlegen des Entwurfs geändert hat, und überschreibt ihn nur nach ausdrücklicher Bestätigung. Die automatische Prüfung verwirft keinen fremden offenen Entwurf mehr und schaltet nie einen veralteten Entwurf live.
- **Lastbegrenzung bei Evaluationen**: Evaluationen laufen in einer eigenen Warteschlange mit einem Thread; je Nutzer läuft höchstens eine, Nicht-Admins starten höchstens 20 pro Tag. „Testfall vorschlagen lassen“ ist auf 5 pro Minute begrenzt.
- **Workflow-Läufe bleiben privat**: Die Unterhaltungen eines Workflow-Laufs (Haupt-Chat und Schritt-Chats) sieht und bearbeitet nur der Startende; auch Administratoren erhalten dort eine Fehlerseite und sehen keine Links, Werkzeugaufrufe oder Agentenlisten dazu.
- **Workflows härter gegen Fehlbedienung**: Das Löschen eines geteilten Workflows entfernt nicht mehr den Verlauf der Nutzer (Läufe und Unterhaltungen bleiben erhalten, nur die Zeitpläne entfallen; die Rückfrage sagt das). Der Chat eines laufenden Workflows lässt sich auch nicht löschen und keine Dateien hinzufügen oder entfernen. Dateinamen und Marken in der Übergabe zwischen Schritten werden bereinigt, Agenten mit Internetzugriff tragen im Editor einen Hinweis auf möglichen Datenabfluss, und je Nutzer läuft höchstens ein Workflow-Schritt gleichzeitig. Aufgaben mit Workflow ändert, startet und liest nur ihr Besitzer (Administratoren können sie löschen), Inhalte aus Workflow-Läufen gehen nicht an die automatische Verbesserung, und beim Löschen eines Workflows werden aktive Läufe abgebrochen.
- **Unterhaltungen bleiben privat, auch gegenüber Administratoren**: Administratoren öffnen Unterhaltungen anderer Benutzer nicht mehr. Im Audit, in Central, auf der Agentenseite, bei Aufgaben, Skill-Vorschlägen und Wiki-Fragen sehen sie bei fremden Unterhaltungen nur noch Benutzer, Zeitpunkt, Werkzeugnamen und Kennzahlen, aber keine Titel, Inhalte, Werkzeug-Argumente, Ergebnisse oder Links. Aufgaben anderer Benutzer können Administratoren nur noch pausieren oder löschen, aber nicht mehr ändern oder starten, und sie sehen deren Anweisungen nicht. Die automatische Verbesserung übergibt an das Entwicklerwerkzeug nur noch Texte aus Unterhaltungen des auslösenden Administrators, aus allen übrigen nur Kennzahlen. Persönliche Agenten anderer Benutzer können Administratoren nur noch ansehen, deaktivieren, löschen oder für alle freigeben, aber nicht mehr ändern, testen, wiederherstellen oder verbessern lassen; persönliche Agenten werden nur noch verbessert, wenn ihr Besitzer es selbst anstößt.

### Geändert
- Die automatische Prüfung bessert bei geteilten Agenten die Anweisungen nicht mehr direkt am Live-Agenten nach: Die Nachbesserung wird ein
  Entwurf, der zweite Versuch läuft gegen den Entwurf, und nur ein bestandener Entwurf geht live (sofern die Sperre „Live nur nach
  bestandenen Tests“ es erlaubt). Persönliche Agenten werden wie bisher direkt nachgebessert.
- Agenten, die nur ihr Besitzer sieht, werden bei Auswahl, Delegation (`run_agent`), Zeitplänen und automatischem Routing
  nur diesem angeboten; die Prüfung persönlicher Agenten (Freigabe, „Automatisch prüfen“) läuft mit den Rechten des Besitzers.
- Der Assistent kann persönliche und im Baukasten gebaute Agenten nicht mehr per `create_agent` überschreiben; der Import
  einer Agent-Datei über einen persönlichen Agenten wird abgelehnt.

### Behoben
- **Hilfe & FAQ**: Die Abschnitts-Links oben auf der Hilfe-Seite springen wieder zuverlässig zum Abschnitt; bisher sprang die Seite ab dem zweiten Klick nach oben zurück.
- Agenten mit dem Tool `list_users` sehen das Benutzerverzeichnis nur noch, wenn der Benutzer dafür freigeschaltet ist.

## [1.7.4] – 2026-10-16

### Geändert
- Automatische Dokumentscans starten nur noch in einem Zeitfenster, standardmäßig nachts von 1 bis 6 Uhr
  (*Einstellungen → Dokumentsuche*). Scans fordern viele Embeddings an; lief das Embedding-Modell auf demselben
  KI-Server wie das Chat-Modell, konnten sie laufende Unterhaltungen abbrechen („Model is unloaded“).
  „Jetzt scannen“ funktioniert weiterhin jederzeit.

## [1.7.3] – 2026-10-15

### Behoben
- Antworten brachen mit „undefined method 'delete_prefix' for nil“ ab, wenn der KI-Server mitten im Stream einen
  Fehler meldete und dessen Details in einem eigenen Netzwerk-Paket ankamen (häufig nach langen Agenten-Läufen).
  Jetzt erscheint die eigentliche Meldung des Servers („Der KI-Server hat die Antwort mit einem Fehler
  abgebrochen: …“), damit klar ist, was schiefging.

## [1.7.2] – 2026-10-13

### Behoben
- Die „KI-Agent- und Skill-Verbesserung“ ist wieder für alle Installationen da (in 1.7.1 versehentlich auf die
  Herstellerinstanz beschränkt): Anmeldung unter *Einstellungen*, Seite *Verbesserungen*, Knöpfe auf Skill- und
  Agenten-Seiten. Die Anmeldung gilt für die ganze Installation und nur für Administratoren. Claude Code bzw. Codex
  überarbeitet ausschließlich Skills und Agenten und wird nie als Chat-Modell für Benutzer verwendet.
  `FIRMENKI_VENDOR` wird nicht mehr benötigt.

## [1.7.1] – 2026-10-13

### Geändert
- Die herstellerinterne „KI-Agent- und Skill-Verbesserung“ (Claude Code/Codex) ist aus Kundeninstallationen
  entfernt: kein Abschnitt mehr unter *Einstellungen*, keine Seite *Verbesserungen*, keine Knöpfe und keine
  FAQ-Einträge dazu. Sie existiert nur noch in der Herstellerinstanz (`FIRMENKI_VENDOR=1`).

### Behoben
- Anmeldung bei Claude/ChatGPT blieb bei „Anmeldung wird vorbereitet“ stehen, wenn ein früherer Versuch noch lief
  oder alle Hintergrund-Worker belegt waren. Die Anmeldung hat jetzt einen eigenen Worker, ein neuer Start löst einen
  alten Versuch sofort ab, und die Karte zeigt an, worauf sie wartet. Die Schritte erklären jetzt auch, dass der
  Bestätigungscode aus der E-Mail auf der Seite von Claude eingegeben wird.

### Hinweise zum Update
- Nur Herstellerinstanz: vor dem Update `FIRMENKI_VENDOR=1` in `.env` eintragen, sonst ist die
  KI-Agent- und Skill-Verbesserung danach ausgeblendet. Kundeninstallationen müssen nichts tun.

## [1.7.0] – 2026-09-30

### Neu
- **Meine Postfächer**: Jeder Benutzer kann eigene Postfächer anbinden – per IMAP (Server, Benutzer, Passwort bzw. App-Passwort) oder mit „Mit Microsoft 365 anmelden“ im Browser. Der Assistent durchsucht sie nur lesend und nur in den Unterhaltungen, Agenten und Aufgaben des Besitzers (Tools `mailbox_folders`, `mailbox_search`, `mailbox_get`); es wird keine Kopie der E-Mails gespeichert. Niemand sonst, auch kein Administrator, sieht fremde Postfächer, Zugangsdaten oder Inhalte.
- **Einstellungen → Persönliche Postfächer**: Schalter, ob Benutzer eigene Postfächer anbinden dürfen (Standard: ja), und die Microsoft-365-App-Registrierung (Mandanten-ID, Anwendungs-ID, geheimer Clientschlüssel) für die Anmeldung der Benutzer. Ohne App-Registrierung steht IMAP zur Verfügung.

### Hinweise zum Update
- Persönliche Postfächer sind nach dem Update für alle Benutzer freigegeben. Wer das nicht will, schaltet es unter Einstellungen → Persönliche Postfächer ab. Für Microsoft 365 ist in Microsoft Entra eine App-Registrierung mit Umleitungs-URI `https://<Adresse der Anwendung>/postfaecher/m365/callback` und den delegierten Berechtigungen User.Read, Mail.Read und offline_access nötig.

## [1.6.0] – 2026-09-29

### Neu
- **Ticketsysteme – ganze Schnittstelle nutzbar**: Der Assistent erreicht jetzt alle Endpunkte, die die Schnittstelle des angebundenen Ticketsystems (z. B. DocBee) anbietet, nicht nur Tickets und Kommentare. Er kann damit zum Beispiel den Bearbeiter eines Tickets ändern, Leistungen anlegen oder Planungszeiten eintragen. Neue Tools: `ticket_api_describe` (Endpunkte und Felder nachschlagen), `ticket_api_get` (lesen), `ticket_api_write` (anlegen und ändern, nur mit „Schreiben erlauben“) und `ticket_api_delete` (löschen).
- **Ticketsysteme – Schalter „Löschen erlauben“**: Löschen ist ein eigener Schalter je Ticketsystem, standardmäßig aus, und wirkt nur zusammen mit „Schreiben erlauben“. Der Assistent löscht nur auf ausdrücklichen Wunsch und immer nur einen Datensatz. Jeder Aufruf steht im Audit.

### Hinweise zum Update
- Ticketsysteme: Nach dem Update kann der Assistent über die Schnittstelle alles lesen, was der angebundene Benutzer im Ticketsystem sehen darf, und bei gesetztem „Schreiben erlauben“ auch alles ändern, was dieser Benutzer ändern darf. Bitte die Rechte dieses Benutzers im Ticketsystem prüfen und knapp halten. Bestehende Agenten bekommen die neuen Tools erst, wenn ein Administrator sie unter Agenten → Bearbeiten anhakt.

## [1.5.3] – 2026-09-21

### Behoben
- Agenten und Datenanbindungen: Ein vom Assistenten angelegter Agent meldete, der Zugriff auf das Ticketsystem (z. B. DocBee) sei „in der Laufumgebung nicht angekommen“. Ursache: Der Agent hatte die Ticket-Tools nicht erhalten, bekam das Ticketsystem aber trotzdem beschrieben. Jetzt gibt der Assistent beim Anlegen die passenden Tools mit und nennt, welche Datenanbindungen der Agent erreicht; ein Agent bekommt nur noch die Anbindungen beschrieben, für die er Tools hat, und sagt sonst klar, welches Tool fehlt. Bestehende Agenten: unter **Agenten → Bearbeiten** die Tools der gewünschten Datenanbindung anhaken. (Version 1.5.2 mit derselben Korrektur wurde nicht veröffentlicht.)

### Geändert
- Agenten bearbeiten: Die Tool-Auswahl ist in „Allgemein“ und „Datenanbindungen“ gegliedert, mit Hinweis, dass ein Agent nur über diese Tools auf Ticketsysteme, ecoDMS, MailStore, Datenbanken, DATEV, Dokumente und Server zugreift.
- Updates: Stellt ein künftiges Update die Datenbank grundlegend um, hält der Updater die Anwendung vor dem Backup an und stellt bei einem Fehler der Umstellung den Stand des Backups wieder her. Das bereitet das nächste größere Update vor; bei gewöhnlichen Updates ändert sich nichts.

## [1.5.2] – 2026-09-21

### Behoben
- Agenten und Datenanbindungen: Ein vom Assistenten angelegter Agent meldete, der Zugriff auf das Ticketsystem (z. B. DocBee) sei „in der Laufumgebung nicht angekommen“. Ursache: Der Agent hatte die Ticket-Tools nicht erhalten, bekam das Ticketsystem aber trotzdem beschrieben. Jetzt gibt der Assistent beim Anlegen die passenden Tools mit und nennt, welche Datenanbindungen der Agent erreicht; ein Agent bekommt nur noch die Anbindungen beschrieben, für die er Tools hat, und sagt sonst klar, welches Tool fehlt. Bestehende Agenten: unter **Agenten → Bearbeiten** die Tools der gewünschten Datenanbindung anhaken.

### Geändert
- Agenten bearbeiten: Die Tool-Auswahl ist in „Allgemein“ und „Datenanbindungen“ gegliedert, mit Hinweis, dass ein Agent nur über diese Tools auf Ticketsysteme, ecoDMS, MailStore, Datenbanken, DATEV, Dokumente und Server zugreift.

## [1.5.1] – 2026-09-16

### Neu
- ecoDMS und MailStore: Feld „CA-Zertifikat (PEM)“ je Verbindung. Wer ein selbst signiertes oder firmeninternes Zertifikat einsetzt, trägt es (oder die Firmen-CA) dort ein und lässt „TLS-Zertifikat prüfen“ eingeschaltet, statt die Prüfung abzuschalten.

### Geändert
- ecoDMS: Formular und Übersicht erklären den verschlüsselten Zugriff (in ecoDMS „TLS (SSL)“ aktivieren, Adresse mit `https://`); die Übersicht zeigt je Verbindung, ob TLS mit Prüfung, TLS ohne Prüfung oder unverschlüsselt verwendet wird.

## [1.5.0] – 2026-09-15

### Neu
- **MailStore-Anbindung** (Datenanbindung → MailStore): Firmen-KI liest das E-Mail-Archiv über den in MailStore integrierten IMAP-Server (TLS oder STARTTLS, Rechte des eingetragenen MailStore-Benutzers, nur lesend). Der Assistent kennt die Ordner (`mailstore_folders`), sucht E-Mails nach Suchtext, Betreff, Absender, Empfänger und Zeitraum (`mailstore_search`) und liest einzelne E-Mails mit Text und Anhängen (`mailstore_get`); Anhänge oder die ganze E-Mail als .eml erscheinen auf Wunsch als Download im Chat. Freigabe je Benutzer unter Benutzer → Datenzugriff, Ordnerliste wird stündlich aktualisiert, jeder Zugriff steht im Audit.

### Hinweise zum Update
- Für MailStore muss in der MailStore Server Service Configuration der IMAP-Server (SSL, Port 993, oder STARTTLS, Port 143) aktiviert sein. Der KI-Benutzer braucht eine MailStore-eigene Anmeldung (bei MFA ein App-Passwort); Anmeldung über Microsoft 365, Google Workspace oder AD FS funktioniert per IMAP nicht.

## [1.4.1] – 2026-09-15

### Behoben
- ecoDMS: Ein aus dem Archiv geladenes Dokument (`ecodms_get` mit Download) erscheint jetzt sofort als Download im Chat. Bisher lag die Datei nur im Arbeitsbereich des Assistenten und ließ sich nicht herunterladen.

## [1.4.0] – 2026-09-15

### Neu
- **ecoDMS-Anbindung** (Datenanbindung → ecoDMS): Firmen-KI verbindet sich mit dem API REST Service eines ecoDMS-Archivs (Adresse mit API-Port, Archiv-ID, Benutzer/Passwort, optional API-Schlüssel bei Multi-Faktor-Authentifizierung). Der Assistent kennt Ordner, Dokumentenarten, Status und die eigenen Klassifizierungsattribute des Kunden (`ecodms_describe`), sucht Dokumente per Volltext, Bemerkung, Ordner, Dokumentenart, Status, Zeitraum und Attributen (`ecodms_search`) und lädt Dateien nur bei Bedarf zum Auswerten in den Arbeitsbereich (`ecodms_get`). Archivieren neuer Dokumente samt Klassifizierung (`ecodms_upload`) nur, wenn „Archivieren erlauben“ gesetzt ist. Freigabe je Benutzer unter Benutzer → Datenzugriff, Katalog wird stündlich aktualisiert, jeder Zugriff steht im Audit.

### Hinweise zum Update
- Für ecoDMS muss der API REST Service im ecoDMS-Client aktiviert sein (Einstellungen → Web / API → API Zugriff → „Dienst starten“, Standardport 8180). Downloads und Uploads verbrauchen API-Connects aus dem ecoDMS-Lizenzkontingent.

## [1.3.2] – 2026-09-11

### Neu
- Kunden-Wiki füllt sich von selbst: Nach jeder Antwort prüft der Assistent im Hintergrund, ob dauerhaftes Wissen über einen Kunden hervorging (Infrastruktur, Ansprechpartner, Abläufe, Lösungen), legt den Kunden bei Bedarf an und trägt Fakten und Notizen mit Quelle ein; fehlendes Wissen wird als KI-Frage gestellt. Eine kurze Meldung zeigt, was ergänzt wurde.

### Entfernt
- Knopf „Kunden aus dem Ticketsystem übernehmen“ im Kunden-Wiki – Kunden entstehen ausschließlich bei Bedarf.

## [1.3.1] – 2026-09-11

### Geändert
- Kunden-Wiki: Kunden entstehen bei Bedarf. Beim ersten Eintrag oder der ersten KI-Frage zu einem noch unbekannten Kunden legt der Assistent ihn automatisch an, mit Name und Kundennummer aus dem Ticketsystem (DocBee), wenn er dort existiert.

## [1.3.0] – 2026-09-11

### Neu
- **Kunden-Wiki** (Seitenleiste): Wissen je Kunde als Markdown-Seiten (Kategorie und Schlagwörter frei) und Fakten (Schlüssel–Wert), mit Versionsverlauf und Wiederherstellen, Suche über Seiten, Fakten und Kunden. Kunden entstehen bei Bedarf: Beim ersten Eintrag legt der Assistent den Kunden automatisch an (Name und Nummer aus DocBee, wenn dort vorhanden); alternativ Übernahme aller Kunden per Knopf oder manuelles Anlegen. „Allgemein“ für kundenunabhängiges Wissen. Der Assistent liest vor Annahmen im Wiki nach (`wiki_search`, `wiki_read`) und trägt Neues mit Quelle ein (`wiki_write`); Passwörter werden abgewiesen.
- **KI-Fragen** (Seitenleiste mit Zähler): Fehlt dem Assistenten Wissen, stellt er eine Frage (`wiki_ask`) an einen Benutzer oder an alle mit Wiki-Zugriff. Antworten fließen automatisch ins Wiki, als Fakt oder auf die Seite „Fragen & Antworten“. Auch Benutzer können Kollegen fragen.
- Haken „Kunden-Wiki“ beim Benutzer (Datenzugriff); Administratoren haben immer Zugriff.

### Behoben
- Benutzer löschen schlug fehl, sobald der Benutzer Gedächtnis-Einträge hatte (Fehler 500). Die persönlichen Einträge werden jetzt mit dem Benutzer entfernt, gemeinsame bleiben.

### Geändert
- Gedächtnis: Einträge werden in einem mitwachsenden mehrzeiligen Feld angezeigt und bearbeitet, lange Texte sind vollständig lesbar statt abgeschnitten.

## [1.2.1] – 2026-09-11

### Behoben
- Schleifenbremse für Werkzeuge: Ruft das Modell dasselbe Werkzeug dreimal in Folge mit denselben Parametern auf (bei lokalen Modellen etwa endloses Durchsuchen der Hilfe), bekommt es einen Hinweis statt eines Ergebnisses und antwortet dem Nutzer. Bisher lief die Antwort bis zum Tool-Limit weiter.
- Benutzerverzeichnis: Die Anweisung an das Modell ist eindeutiger, damit Fragen nach „den Benutzern hier“ das Verzeichnis der Anwendung meinen und nicht Kunden aus Datenbanken oder Ticketsystemen.

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
