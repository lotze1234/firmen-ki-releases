# Changelog

Alle nennenswerten Änderungen an Firmen-KI stehen in dieser Datei. Der Abschnitt der jeweiligen Version
wird Kunden auf der Seite „Updates“ als Änderungsübersicht angezeigt – deshalb bitte verständlich und aus
Anwendersicht formulieren (was ist neu, was hat sich geändert, worauf ist beim Update zu achten).

Format nach [Keep a Changelog](https://keepachangelog.com/de/1.1.0/), Versionsnummern nach
[Semantic Versioning](https://semver.org/lang/de/). Der oberste Abschnitt `[Unreleased]` sammelt die Änderungen
bis zum nächsten Release; `bin/release <version>` macht daraus den Versionsabschnitt.

Rubriken: **Neu**, **Geändert**, **Behoben**, **Entfernt**, **Sicherheit**, **Neue Skills**, **Hinweise zum Update**.

## [Unreleased]

## [1.8.0] – 2026-11-11

Dieses Release fasst die Vorabversionen 1.8.0-beta.1 bis 1.8.0-beta.4 zusammen.

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
- **MySQL und MariaDB als Datenbankquelle** laufen jetzt wirklich: Der Treiber (Gem `mysql2`, im Image mit `libmariadb`) war bisher nicht enthalten, jede MySQL-Anbindung scheiterte mit „mysql2 is not part of the bundle“. Gegen MySQL 8.4 und MariaDB 11.4 getestet (Timeout, Zeilenlimit, Nur-Lese-Transaktion, Tabellenfreigabe). Empfehlung: einen Lesebenutzer nur mit SELECT anlegen, ohne FILE, PROCESS, SUPER und ohne Rechte auf `mysql.*`, denn bei MySQL ist die Tabellenfreigabe eine Textprüfung und die Rechte des Benutzers sind die eigentliche Sperre. Neu abgelehnt bei MySQL: Versionskommentare (`/*! … */`), `--` ohne folgendes Leerzeichen, `FOR SHARE`, weitere Warte-/Sperrfunktionen; ein `;` im Text-Literal ist dagegen erlaubt.
- **OCR**: Gescannte PDF-Seiten ohne Textebene werden per OCR indexiert (höchstens 50 Seiten je Dokument; ist das Limit erreicht, steht ein Hinweis am Dokument). Dokumente ohne erkennbaren Text erhalten den Status „kein Text“ und werden nicht bei jedem Scan neu verarbeitet.
- **Chat**: Lange Unterhaltungen laden nur die letzten 40 Nachrichten, ältere über „Ältere Nachrichten laden“; die Ladezeit bleibt konstant. Mehrfachsenden per Enter wird verhindert, der Senden-Knopf zeigt den Ladezustand, nach dem Senden wird automatisch gescrollt.
- **Barrierefreiheit**: Nachrichtenliste als Live-Region, beschriftete Eingabefelder und Symbol-Knöpfe, höhere Kontraste, reduzierte Bewegung.
- **Passwort selbst ändern**: Jeder Benutzer ändert sein Passwort über das Schlüssel-Symbol unten in der Seitenleiste (aktuelles Passwort und neues Passwort mit mindestens 10 Zeichen). Danach sind alle anderen Geräte abgemeldet. Die Anmeldeseite weist bei vergessenem Passwort auf den Administrator hin.
- **Sprache vor der Anmeldung**: Auf der Anmeldeseite und bei der Ersteinrichtung wählen Sie die Sprache (DE, EN, FR). Meldungen erscheinen in dieser Sprache, und bei der ersten Anmeldung wird sie als Ihre Sprache übernommen.
- **Handy-Ansicht**: Auf kleinen Bildschirmen öffnet ein Menü-Knopf die Seitenleiste als Überlagerung, die Ergebnisspalte lässt sich einblenden, und Inhalte laufen nicht mehr über den Rand.
- **Verständliche Meldungen bei Problemen mit dem KI-Modell**: Ist das Modell nicht erreichbar, lehnt es die Anmeldung ab, wird es nicht gefunden, ist ein Limit erreicht oder antwortet es zu lange nicht, erscheint eine verständliche Meldung in Ihrer Sprache; Administratoren sehen zusätzlich die technische Ursache.
- **Start ohne KI-Modell**: Eine neue Unterhaltung zeigt einen Hinweis, solange kein KI-Modell angebunden ist (Administratoren mit Knopf „KI-Modell einrichten“); nach der Ersteinrichtung führt die Anwendung direkt zum Anlegen des Modells.
- **Fehlerseiten** (nicht gefunden, abgelehnt, Serverfehler) sind schlicht, dreisprachig und bieten einen Rückweg; ein nicht mehr vorhandenes Dokument ergibt eine verständliche Meldung statt einer leeren Seite.
- **Outlook-Kalender lesen (Microsoft 365, nur lesend)**: Der Assistent kann Termine, Feiertage und Abwesenheiten aus dem eigenen Outlook-Kalender eines Benutzers lesen (Werkzeug `calendar_events`, Zeitraum bis 62 Tage; private und vertrauliche Termine nur mit Zeit, ohne Betreff). Die Funktion ist standardmäßig aus: Der Administrator aktiviert unter Einstellungen → Persönliche Postfächer „Kalender lesen“ und ergänzt in der Entra-App-Registrierung die delegierte Berechtigung `Calendars.Read`. Benutzer melden sich danach unter „Meine Postfächer“ einmal erneut mit Microsoft 365 an; bestehende Anmeldungen laufen unverändert weiter (nur Mail). Neue Spalten: `mailboxes.granted_scopes`, `app_settings.mailbox_calendar`.
- **Monatliche Aufgaben**: Automatische Aufgaben lassen sich jetzt auch monatlich an einem Tag im Monat planen (Aufgaben-Formular, Agenten-Baukasten und im Chat: „jeden Monat am 1. um 7 Uhr“). Gibt es den Tag in einem Monat nicht (z. B. der 31.), läuft die Aufgabe am letzten Tag dieses Monats. Neue Spalte: `scheduled_tasks.day_of_month`.
- **Vier Ebenen bei den Benutzern**: Eigentümer (Hauptadministrator), Administrator, Technik-Administrator (für einen externen IT-Dienstleister) und Benutzer. Der Technik-Administrator richtet KI-Modelle, Datenanbindungen, Updates, Status und die allgemeinen Einstellungen ein, sieht aber keine Inhalte (Dokumentsuche, Befehlsausgaben) und hat keinen Zugriff auf Benutzer, Skills, Agenten, Audit, Werkzeug-Richtlinien, Verbesserung, Postfächer/Kalender sowie Update-Kanal und Update-Adresse; Daten und Wiki nur über die Haken unter Benutzer → Datenzugriff. Administratoren verwalten nur Technik-Administratoren und Benutzer; Administratoren anlegen oder ändern und den Eigentümer-Status vergeben kann nur ein Eigentümer, und es bleibt immer mindestens ein aktiver Eigentümer. Neue Spalte: `users.owner`.
- **Vertrauliche Kunden im Wiki**: Ein Administrator kann einen Kunden im Kunden-Wiki als „Vertraulich“ markieren und Benutzer dafür freigeben. Ein vertraulicher Kunde samt Seiten, Fakten und KI-Fragen ist nur für Administratoren und die freigegebenen Benutzer sichtbar – in Liste, Suche, Lesen, Schreiben und für den Assistenten (auch in Unter-Agenten, Aufgaben und Workflows); für alle anderen ist er nicht auffindbar und wird auch nicht automatisch angelegt oder befüllt. Technik-Administratoren sehen ihn nur mit Freigabe. Standard ist „nicht vertraulich“: ohne markierte Kunden ändert sich nichts. Neue Spalte: `wiki_customers.restricted`.

### Geändert
- Die automatische Prüfung bessert bei geteilten Agenten die Anweisungen nicht mehr direkt am Live-Agenten nach: Die Nachbesserung wird ein
  Entwurf, der zweite Versuch läuft gegen den Entwurf, und nur ein bestandener Entwurf geht live (sofern die Sperre „Live nur nach
  bestandenen Tests“ es erlaubt). Persönliche Agenten werden wie bisher direkt nachgebessert.
- Agenten, die nur ihr Besitzer sieht, werden bei Auswahl, Delegation (`run_agent`), Zeitplänen und automatischem Routing
  nur diesem angeboten; die Prüfung persönlicher Agenten (Freigabe, „Automatisch prüfen“) läuft mit den Rechten des Besitzers.
- Der Assistent kann persönliche und im Baukasten gebaute Agenten nicht mehr per `create_agent` überschreiben; der Import
  einer Agent-Datei über einen persönlichen Agenten wird abgelehnt.
- **Rückfrage im Chat auf dem Handy**: Solange eine Rückfrage offen ist, wird der schwebende Hilfe-Knopf ausgeblendet, damit er den Text der Karte nicht verdeckt; die Hilfe bleibt über „Hilfe & FAQ“ erreichbar.
- **Wiki-Fragen** (`wiki_ask`) sind kein Standard-Werkzeug mehr: Das Werkzeug legt eine Frage an die Wissensverantwortlichen an und muss deshalb für einen Agenten ausdrücklich ausgewählt werden; es steht nur aktiven Adressaten mit Wiki-Freigabe zur Verfügung.
- **Namen der Standard-Agenten** sind für persönliche Agenten reserviert (auch beim Anlegen per Assistent); die Meldung nennt den Grund.
- **Werkzeug-Limit** stoppt Antwortläufe hart: Der Abschlussaufruf erfolgt mit gesperrten Werkzeugen (`tool_choice none`); lehnt ein lokaler (nicht Anthropic) Server das ab oder ruft das Modell trotzdem Werkzeuge auf, folgt ein zweiter Versuch ohne Werkzeuge mit ausdrücklicher Aufforderung zur Zusammenfassung, sonst ein Hinweis statt Endlosschleife. Aufrufe von Unteragenten zählen im Budget der Anfrage mit, Agenten-Chats dürfen höchstens 40 Werkzeuge aufrufen. Sehr große Werkzeugergebnisse werden auf 30.000 Zeichen gekürzt, das Kontextfenster gilt auch während der Werkzeugrunden.
- **Wiederholungsbremse**: Der dritte identische Aufruf (Werkzeug und Parameter) in Folge wird abgewiesen, ebenso der vierte identische innerhalb der letzten acht Aufrufe; nach drei Abweisungen in Folge endet die Werkzeugrunde. Unbekannte Werkzeugnamen werden mitgezählt. Solche Abbrüche erscheinen im Aktivitätsfenster als Warnung.
- **Hilfsaufgaben** (Chat-Titel, Gedächtnis-/Wiki-Extraktion, Agenten-Prüfung und -Bewertung, Workflow-Prüfer) nutzen die Modell-Anbindung der Unterhaltung bzw. des Agenten statt der Standard-Anbindung; lokale Daten gehen nicht mehr an eine Cloud-Anbindung.
- **Systemprompt** ohne Dubletten und beim automatischen Routing deutlich kürzer (etwa 3 statt 18 KB); das Gedächtnis im Prompt ist auf 4000 Zeichen begrenzt, mit neuem Hinweis zu externen Inhalten. JSON-Antworten des Modells werden robuster ausgewertet. Anthropic-Anbindungen nutzen Prompt-Caching.
- **Chat-Streaming** schlanker: Klartext während der Antwort, Markdown am Ende; SweetAlert2 und Editor-Controller laden erst bei Bedarf.
- **Dokumentbibliothek**: Ein vom Massenlöschungsschutz blockierter oder wegen fehlendem Quellordner abgebrochener Scan läuft erst nach dem eingestellten Intervall erneut (nicht alle 10 Minuten). Schlägt die Neuindexierung fehl, bleiben die alten Abschnitte durchsuchbar. Bei Ausfall des Embedding-Servers liefert die Suche weiter Volltexttreffer (Timeout 15 s); Suchanfragen-Embeddings werden 10 Minuten zwischengespeichert.
- **Python-Paketindex** konfigurierbar über `FIRMENKI_PIP_INDEX_URL` (Standard `https://pypi.org/simple`, nur http(s)-URL ohne Zugangsdaten), z. B. für einen internen Mirror.
- **Betrieb**: Chat-Antworten und Hintergrundaufgaben (Dokumentscan, Verbindungsanalysen, Agentenprüfung, Verbesserung) laufen in eigenen Worker-Prozessen (Queues `chat` und `background`). Aufräumarbeiten laufen im Minutentakt-Job statt beim Aufruf von Central; die Statusseite speichert Prüfungen 30 Sekunden zwischen (`?refresh=1` erzwingt neu); neue Datenbank-Indizes; Updater 1.0.3 (Beta-Zähler im Versionsvergleich; bei nicht rollback-sicheren Updates startet die alte Version, wenn der Fehler vor der Migration auftritt, wieder); das Release-Skript pusht atomar.
- **Einheitliche Begriffe**: In der Seitenleiste heißen die Bereiche jetzt „Meine Agenten“ (bisher „Agenten bauen“) und „Agenten verwalten“; neue Agenten legen Sie mit „+ Neuer Agent“ an. Agenten erscheinen überall mit ihrer Bezeichnung statt mit dem technischen Namen. Die Oberfläche spricht Sie durchgehend mit „Sie“ an; Status, Rollen und Mehrzahlformen sind übersetzt.
- **Formulare und Meldungen**: Alle Formulare zeigen Fehler in einer einheitlichen Liste und markieren die betroffenen Felder rot; Pflichtfelder tragen ein Sternchen. Löschdialoge haben einen roten Knopf „Löschen“, Meldungen erscheinen unten links, und die Hilfe-Sprechblase lässt sich dauerhaft ausblenden.
- **Einstellungen**: Werkzeuge stehen mit lesbaren Namen in der Liste „Erlaubte Werkzeuge“ (Haken = erlaubt); die Abschnitte haben eigene Speichern-Knöpfe. Bei KI-Modell und Postfach stehen seltene Angaben unter „Erweiterte Einstellungen“.
- **Agenten-Baukasten und Workflows**: Gesperrte Bausteine nennen den Grund (Administratoren mit „Jetzt anbinden“), die Speichern-Leiste bleibt sichtbar. Ein Workflow ohne Auftrag und ohne Datei startet erst nach einer Rückfrage.
- **Deaktivierte Benutzer und Agenten**: Aufgaben und Workflow-Läufe deaktivierter Benutzer werden nicht mehr gestartet; nach dem Reaktivieren wird der nächste Termin neu geplant, Versäumtes wird nicht nachgeholt. Aufgaben mit deaktiviertem Agenten werden übersprungen (Hinweis im Verlauf). Ein deaktivierter Agent arbeitet auch in bestehenden Unterhaltungen nicht weiter: Die Unterhaltung wechselt mit einem Hinweis zum Standard-Assistenten.
- **Automatische Verbesserung**: Ein Verbesserungsvorschlag wird nicht übernommen, wenn Skill oder Agent seitdem geändert wurden; kürzlich fehlgeschlagene Kandidaten werden nicht sofort erneut versucht; nachgebesserte Agenten-Anweisungen werden von Code-Rahmen und Vorreden befreit, unbrauchbare verworfen.
- **Erscheinungsbild**: Seitentitel und Platzhalter verwenden den eingestellten Namen der Anwendung, das Symbol zeigt dessen Anfangsbuchstaben. Die Standard-Primärfarbe neuer Installationen ist etwas dunkler (besser lesbar). Texte automatischer Aufgaben erscheinen in der Sprache des Besitzers.
- **Datenanbindung**: Fällige Dokumentscans und Aufgaben werden nur noch einmal gestartet, auch wenn mehrere Prozesse gleichzeitig prüfen. SharePoint-Scans verwenden die Verbindung wieder, erneuern das Zugangstoken und warten bei Drosselung durch Microsoft die vorgegebene Zeit ab. Datenbankquellen prüfen das Aktualisierungsintervall (mindestens 15 Minuten) und den Port.

### Behoben
- **Hilfe & FAQ**: Die Abschnitts-Links oben auf der Hilfe-Seite springen wieder zuverlässig zum Abschnitt; bisher sprang die Seite ab dem zweiten Klick nach oben zurück.
- Agenten mit dem Tool `list_users` sehen das Benutzerverzeichnis nur noch, wenn der Benutzer dafür freigeschaltet ist.
- **MySQL/MariaDB-Abfragen (Spaltennamen)**: Die Stichwortsperre ist auf echte Gefahren begrenzt (INTO, FOR UPDATE/FOR SHARE/LOCK IN SHARE MODE, Schreibbefehle nach WITH, gefährliche Funktionen). Spalten wie `comment`, `begin`, `import`, `reset`, `execute`, `refresh`, `prepare`, `copy`, `cluster`, `t.set` und Funktionen wie `insert('abc', 1, 1, 'x')` werden nicht mehr abgelehnt; die Meldung nennt das auslösende Wort und den Ausweg (Backticks).
- **MySQL/MariaDB-Abfragen**: Wörter wie „Set“, „do it“ oder „comment“ in Textwerten und in gequoteten Spaltennamen (`` `set` ``) lösen die Befehlssperre nicht mehr aus; `INTO OUTFILE`, `INTO @variable` und Schreibbefehle bleiben gesperrt.
- Hängende Updates sperren Chat und Aufgaben nicht mehr dauerhaft (Abgleich im Minutenlauf, beim Auto-Update und beim Status-Abruf; Höchstdauer 2 Stunden, solange der Updater nicht mehr läuft, 12 Stunden bei laufendem Updater); das Update-Overlay lädt nicht mehr in Schleife neu; abgestürzte Antworten (älter als 30 Minuten) blockieren Updates nicht mehr; hängende Agentenprüfungen und Aufgabenläufe werden nach 2 bzw. 3 Stunden beendet; scheitert das Einreihen bei Prüfung, Veröffentlichung oder Workflow-Freigabe, bleibt kein „läuft“-Zustand zurück; Fehler in Aufgabenläufen werden zuverlässig protokolliert und gemeldet.
- Die Dokumentbibliothek löscht bei fehlendem oder nicht lesbarem Quellordner keine Dokumente mehr: Der Abgleich bricht mit Fehlermeldung ab, ebenso wenn mehr als die Hälfte der Dokumente wegfiele („Trotzdem abgleichen“ hebt den Schutz auf). Unlesbare Unterordner werden gemeldet, ihre Dokumente bleiben. SharePoint meldet zu große Ordner und eine nicht lesbare Standardbibliothek als Fehler statt einer unvollständigen Liste.
- Agenten bekommen Datenquellen-, E-Mail- und Postfach-Werkzeuge nur, wenn eine Anbindung vorhanden und freigegeben ist; ein Stopp im Unterlauf beendet auch den übergeordneten Lauf; die Antwort eines Unterlaufs ist die letzte Antwort ohne Werkzeugaufruf; die zweite Kontext-Zusammenfassung enthält keine Doppelungen.
- Automatische Aufgaben starten keinen neuen Lauf, solange die Antwort auf den vorigen Lauf in derselben Unterhaltung noch läuft; der Termin wird als übersprungener Lauf (Status „Fehler“, Hinweis „Übersprungen“) festgehalten.
- Eine zweite Nachricht während einer laufenden Antwort wird mit Hinweis abgelehnt statt doppelt verarbeitet; die Aktivmarkierung der Seitenleiste bleibt nach einer Titeländerung erhalten.
- Updater: Erscheint ein Release genau zwischen dem Abruf von Manifest und Signatur, lädt der Updater beides einmal neu und prüft erneut, statt fälschlich „Signatur des Manifests ungültig“ zu melden. Ein manipuliertes Manifest wird weiterhin abgelehnt.
- **Stopp**: Nach „Stopp“ während eines Werkzeug-Schritts (zum Beispiel beim Delegieren an einen Agenten) bleibt die Unterhaltung benutzbar; bereits betroffene Unterhaltungen funktionieren wieder. Ein früh gedrückter Stopp wirkt, und „Stopp“ gibt eine nach Absturz oder Neustart hängende Unterhaltung sofort frei (bisher bis zu 30 Minuten gesperrt).
- **Fehler des KI-Modells**: Nach einem Fehler bleibt keine „Denkt …“-Anzeige stehen; leere oder fehlgeschlagene Antworten werden nicht mehr an das Modell zurückgegeben, eine leere Modellantwort erscheint als verständliche Meldung.
- **Geplante Aufgaben**: Die Uhrzeit täglicher und wöchentlicher Aufgaben lässt sich wieder ändern; eine pausiert angelegte Aufgabe führt nicht mehr zu einem Serverfehler; wöchentliche Aufgaben ohne Wochentag werden mit Meldung abgelehnt; „Jetzt ausführen“ bei pausierten Aufgaben und „Jetzt scannen“ bei inaktiven Quellen melden den Grund; ein unerwarteter Startfehler bei Workflow-Aufgaben beendet den Lauf mit Fehlerstatus.
- **Verbindungen**: Serververbindungen mit Passwort-Anmeldung funktionieren wieder. Bei DATEV bleibt das gespeicherte Passwort erhalten, wenn das Feld beim Bearbeiten leer bleibt. Die Testmail meldet abgebrochene SMTP-Verbindungen als Fehler statt mit einem Serverfehler.
- **Datenfreigaben** werden nur gespeichert, wenn das Speichern des Benutzers gelingt; beim Löschen einer Datenquelle werden ihre Freigaben mitgelöscht.
- **Kunden-Wiki**: Fakten werden nicht mehr wegen eines ähnlichen Namens dem falschen Kunden zugeordnet. Ein deaktivierter Kunde bleibt deaktiviert: Die automatische Wiki-Pflege überspringt ihn, und nur eine ausdrückliche Aktion eines Administrators aktiviert ihn wieder. Die Adresse `/wiki/seiten` führt zum Wiki.
- **Agenten und Skills**: Gleichzeitig angestoßene Agenten-Prüfungen laufen nacheinander, ein veraltetes Prüfergebnis wird verworfen. Skill-Vorschläge lassen sich nicht mehr doppelt freigeben, und eine Freigabe aktiviert einen deaktivierten Skill nicht wieder.
- **Kleinere Korrekturen**: Die Kontextanzeige berücksichtigt den Systemprompt; ein selbst vergebener Unterhaltungstitel bleibt erhalten; ein leerer oder zu langer Gedächtnis-Eintrag wird mit Meldung abgelehnt; die Modellauswahl zeigt nicht mehr „Standard (Standard (lokal))“; fehlende Übersetzungen sind ergänzt.

### Sicherheit
- **Wiederherstellen ohne Rechteausweitung**: Nutzer ohne Administratorrechte können beim Wiederherstellen einer Agent-Version keine Tools oder Modelle mehr zurückholen, die ihnen nicht zustehen (Baukasten-Agenten werden aus dem Bauplan neu geprüft). Der Assistent darf bestehende geteilte Agenten nur noch für Administratoren ändern; gilt „Live nur nach bestandenen Tests“, wird die Änderung ein Entwurf.
- **Entwürfe prüfen ihre Basis**: „Live schalten“ warnt, wenn sich der Live-Stand seit dem Anlegen des Entwurfs geändert hat, und überschreibt ihn nur nach ausdrücklicher Bestätigung. Die automatische Prüfung verwirft keinen fremden offenen Entwurf mehr und schaltet nie einen veralteten Entwurf live.
- **Lastbegrenzung bei Evaluationen**: Evaluationen laufen in einer eigenen Warteschlange mit einem Thread; je Nutzer läuft höchstens eine, Nicht-Admins starten höchstens 20 pro Tag. „Testfall vorschlagen lassen“ ist auf 5 pro Minute begrenzt.
- **Workflow-Läufe bleiben privat**: Die Unterhaltungen eines Workflow-Laufs (Haupt-Chat und Schritt-Chats) sieht und bearbeitet nur der Startende; auch Administratoren erhalten dort eine Fehlerseite und sehen keine Links, Werkzeugaufrufe oder Agentenlisten dazu.
- **Workflows härter gegen Fehlbedienung**: Das Löschen eines geteilten Workflows entfernt nicht mehr den Verlauf der Nutzer (Läufe und Unterhaltungen bleiben erhalten, nur die Zeitpläne entfallen; die Rückfrage sagt das). Der Chat eines laufenden Workflows lässt sich auch nicht löschen und keine Dateien hinzufügen oder entfernen. Dateinamen und Marken in der Übergabe zwischen Schritten werden bereinigt, Agenten mit Internetzugriff tragen im Editor einen Hinweis auf möglichen Datenabfluss, und je Nutzer läuft höchstens ein Workflow-Schritt gleichzeitig. Aufgaben mit Workflow ändert, startet und liest nur ihr Besitzer (Administratoren können sie löschen), Inhalte aus Workflow-Läufen gehen nicht an die automatische Verbesserung, und beim Löschen eines Workflows werden aktive Läufe abgebrochen.
- **Unterhaltungen bleiben privat, auch gegenüber Administratoren**: Administratoren öffnen Unterhaltungen anderer Benutzer nicht mehr. Im Audit, in Central, auf der Agentenseite, bei Aufgaben, Skill-Vorschlägen und Wiki-Fragen sehen sie bei fremden Unterhaltungen nur noch Benutzer, Zeitpunkt, Werkzeugnamen und Kennzahlen, aber keine Titel, Inhalte, Werkzeug-Argumente, Ergebnisse oder Links. Aufgaben anderer Benutzer können Administratoren nur noch pausieren oder löschen, aber nicht mehr ändern oder starten, und sie sehen deren Anweisungen nicht. Die automatische Verbesserung übergibt an das Entwicklerwerkzeug nur noch Texte aus Unterhaltungen des auslösenden Administrators, aus allen übrigen nur Kennzahlen. Persönliche Agenten anderer Benutzer können Administratoren nur noch ansehen, deaktivieren, löschen oder für alle freigeben, aber nicht mehr ändern, testen, wiederherstellen oder verbessern lassen; persönliche Agenten werden nur noch verbessert, wenn ihr Besitzer es selbst anstößt.
- **Datenbank-Abfragen (Prozess-Isolation)**: Schlägt der Start des abgespaltenen Abfrageprozesses fehl, beendet er sich jetzt sofort und meldet „Abfrageprozess konnte nicht starten“. Zuvor konnte er in diesem seltenen Fall im Code des Hauptprozesses weiterlaufen und dessen Datenbankverbindung mitbenutzen.
- **Datenbank-Abfragen (Nachbesserung)**: Bei PostgreSQL zerlegt die App jede Abfrage mit dem echten PostgreSQL-Parser (neue Abhängigkeit: Gem `pg_query`, enthält libpg_query) und prüft den gesamten Syntaxbaum: genau eine SELECT-Anweisung (kein DML in CTEs, kein SELECT INTO, kein FOR UPDATE/SHARE, kein EXPLAIN/CALL), gesperrte Funktionen in jeder Schreibweise (auch `(wert).funktion`, in VALUES, LIMIT/OFFSET, Window-Frames, TABLESAMPLE, JSON_TABLE) und Systemsichten (u. a. `pg_locks`, `pg_prepared_xacts`, `pg_stat_*`). Die Anweisung wird exakt aus dem Parse-Ergebnis ausgeschnitten und mit `standard_conforming_strings = on` ausgeführt; die Transaktion endet immer mit ROLLBACK (kein NOTIFY o. Ä.). Syntax, die neuer ist als der eingebaute Parser (PostgreSQL 17), wird mit einer Syntaxfehler-Meldung abgelehnt, bis das Gem aktualisiert ist. Die frühere Regex-/Plan-Textprüfung ist entfallen: Legitime Abfragen mit Wörtern wie `Set`, `delete`, `Do`, `comment`, `;`, `--` oder `/*` in Texten werden nicht mehr abgelehnt oder verfälscht. Bei MySQL werden `#`-Kommentare entfernt, ein vorhandenes LIMIT wird gekappt statt gekapselt, ohne setzbaren Abfrage-Timeout (auch MariaDB) wird nicht ausgeführt, und das Zeilenlimit wird begrenzt. Empfehlung: Lesebenutzer ohne Large-Object-Rechte anlegen.
- **Datenbank-Abfragen (Härtung 2)**: Bei freigegebenen Tabellen (PostgreSQL) sind eigene Operatoren, eigene Typumwandlungen (Casts) und Domains mit CHECK-Constraint außerhalb von `pg_catalog` gesperrt, weil sie beliebige Funktionen aufrufen können; Funktionen, Operatoren und Typen unkritischer Erweiterungen (zum Beispiel citext, pgcrypto, unaccent, pg_trgm, hstore, uuid-ossp, pgvector) bleiben erlaubt – zuvor wurden dadurch auch `max`, `min`, `replace`, `gen_random_uuid` und `unaccent` abgelehnt. Mehrere Funktionen in FROM (zum Beispiel `unnest(a, b)`, `ROWS FROM`) werden gegen die erlaubten Mengenfunktionen geprüft statt pauschal abgelehnt; Spaltenzugriffe wie `k.status` zählen nur noch als Funktionsaufruf, wenn es eine Funktion mit einem Argument gibt. Weitere Server-Funktionen sind gesperrt (Kontrolldatei, geladene Module, WAL-Zusammenfassungen, Replikations-Slots kopieren, Statistik schreiben, Index-Wartung). Ergebnisse über 20 MB werden abgelehnt („Ergebnis zu groß“; die Daten werden zeilenweise gelesen und eine einzelne Zeile über der Grenze verlässt den Datenbankserver gar nicht erst), und Fehlermeldungen nennen keine lokalen Pfade mehr.
- **Datenbank-Tabellenfreigabe** wird bei PostgreSQL-Quellen erzwungen: Vor der Ausführung prüft die App die Tabellen im Syntaxbaum und den Ausführungsplan der Datenbank (EXPLAIN) und lehnt Abfragen ab, die eine nicht freigegebene Tabelle lesen – auch über Views, Unterabfragen, CTEs oder Joins. Bei Views zählt die Basistabelle; die View selbst muss ebenfalls in der Liste stehen. Bei MySQL ist die Freigabe eine Textprüfung nach bestem Bemühen (erkennt jetzt auch Backticks ohne Leerzeichen, `STRAIGHT_JOIN`, Index-Hinweise und Datenbankpräfixe); die echte Sperre sind die Rechte des Datenbank-Lesebenutzers. Einträge ohne Schema gelten nur in den eingestellten Schemas der Quelle. Bei freigegebenen Tabellen sind in FROM nur einfache Mengenfunktionen (`generate_series`, `unnest`, `json_each` u. a.) erlaubt, und jeder Funktionsname, der auch außerhalb von `pg_catalog` existiert (eigene Funktionen können beliebige Tabellen lesen), wird per Katalogabfrage erkannt und abgelehnt.
- **Sandbox-Dateien**: Dateien aus der Sandbox werden ohne Symlink-Auflösung (auch gegen Austausch von Zwischenverzeichnissen während des Schreibens abgesichert) geschrieben und ausgeliefert (kein Schreiben oder Lesen außerhalb des Arbeitsbereichs; Downloads aus geprüftem Dateihandle, Symlinks und FIFOs ergeben 404). HTML-, SVG- und XHTML-Ergebnisse und -Dokumente werden nur abgeschottet angezeigt (ohne Skripte); XML-, XSL- und JavaScript-Dateien werden immer heruntergeladen.
- **Internetabrufe** des Agenten verbinden sich zur geprüften IP-Adresse (Schutz vor DNS-Rebinding), auch bei Weiterleitungen; bei Ausfall einer Adressfamilie (Dual-Stack) werden die geprüften Adressen nacheinander versucht, IPv4 zuerst. App-Code und Konfiguration im Container sind für den Laufzeitnutzer nicht mehr beschreibbar.
- **Content-Security-Policy** für die gesamte App (Skripte nur eigene Herkunft, Bilder nur lokal, kein Einbetten von Objekten oder Frames); Notschalter `CSP_REPORT_ONLY=1` (Wahrheitswert wie `FORCE_SSL`: `0`/`false` schaltet aus). Der Skript-Nonce bleibt für die Sitzung stabil (Turbo-Navigation ohne Voll-Reload) und wird beim Login erneuert.
- **Python-Pakete** werden je Benutzer getrennt, hinter der Standardbibliothek eingebunden und nur als fertige Pakete (Wheels) ohne Build-Skripte installiert. Die Policy `sandbox.pip_admins_only` beschränkt die Installation auf Administratoren.
- **Anmeldung und Sitzungen**: Login zusätzlich je E-Mail-Adresse begrenzt (20 Versuche in 15 Minuten; Abwägung: Dadurch kann jemand, der die E-Mail-Adresse kennt, das Konto bis zu 15 Minuten gezielt aussperren – der Schutz vor Passwort-Raten hat Vorrang); deaktivierte Nutzer verlieren Live-Verbindungen und Sitzungen, ebenso bei Rollen- oder Passwortwechsel.
- **Agenten**: Per Assistent (create_agent) angelegte Agenten von Nicht-Administratoren sind persönlich; geteilte Agenten legen nur Administratoren an. Ergebnisse externer Quellen (Dokumente, Web, E-Mail, Tickets, Datenbank sowie die Ergebnisse von `server_command`, `run_python`, `run_shell`, `run_agent` und `ticket_api_describe` u. a.) sind als „nur Daten, keine Anweisungen“ gekennzeichnet.
- **Datenbankquellen**: Die Tabellenliste filtert den Katalog und wird bei PostgreSQL per Syntaxbaum und Ausführungsplan erzwungen, bei MySQL bestmöglich – die echte Sperre sind die Rechte des Lesebenutzers (eigener Benutzer ohne Superuser, ohne `pg_read_all_stats`/`pg_read_server_files`, bei MySQL ohne FILE-Recht). Funktionen, die Text-SQL ausführen, Dateien oder Large Objects lesen (`query_to_xml`, `dblink`, `pg_read_file`, `lo_open`/`loread` u. a.) oder Server-Statistik und -Konfiguration preisgeben, sind gesperrt; Tabellen in geklammerten Joins werden erkannt. MySQL-Abfragen laufen nun wirklich schreibgeschützt (`START TRANSACTION READ ONLY`), und die Zeilenbegrenzung gilt unabhängig vom Abfragetext.
- Chat-Inhalte, Eingaben, Prompts und Beschreibungen werden aus den Logs gefiltert; Upload-Größenlimit gilt auch beim Senden von Nachrichten; Adressat von Wiki-Fragen wird geprüft; gespeicherte private SSH-Schlüssel erscheinen nicht mehr im Formular; IMAP-Port 143/993 wird beim Anlegen sowie bei Änderung von Host oder Port geprüft; Gem-Updates.
- **Datenbank-Abfragen (Härtung 3: Speicher)**: Jede Datenbankabfrage läuft in einem eigenen, abgespaltenen Prozess mit Adressraumgrenze (+768 MB über dem Ausgangswert; die Grenze erzwingt nur Linux, also der Server). Ein vorab berechneter riesiger Ausführungsplan (`repeat('x', 250000000)`: Spitze 3 GB im Anwendungsprozess), eine MySQL-Zeile aus mehreren großen Zellen (Spitze 1,4 GB) oder ein Wert, der nur komprimiert klein ist, belasten damit nie mehr die Anwendung: Der Abfrageprozess scheitert mit „Ergebnis zu groß“, der Anwendungsprozess bleibt bei seiner Größe. Kosten: etwa 10 bis 15 ms pro Abfrage. Der Größenwächter misst bei PostgreSQL jetzt die unkomprimierte Textgröße der Zeile; Abfragen derselben Quelle trennen sich bei gleichzeitigem Lauf nicht mehr gegenseitig die Verbindung.
- **Datenbank-Abfragen (Härtung 4)**: Auch leere Zellen und NULL zählen beim Größenlimit (pauschal 16 Byte je Zelle, höchstens etwa 1,3 Mio. Zellen – genug für einen Export mit 20 000 Zeilen und bis zu 65 Spalten; sonst „Ergebnis hat zu viele Zellen“) – zuvor ließen sich mit sehr vielen leeren Spalten über 1 GB Speicher im Anwendungsprozess belegen. Ein Verbindungsabbruch (Datenbank-Neustart, MySQL `wait_timeout`) wird nicht mehr fälschlich als „Ergebnis zu groß“ gemeldet, sondern als „Verbindung zur Datenbank abgebrochen“; Fehlermeldungen der Datenbank werden nie umgedeutet. Pro Prozess laufen höchstens drei Datenbankabfragen gleichzeitig (`FIRMENKI_DB_MAX_CHILDREN`), weitere bitten um erneuten Versuch. Abfrageprozesse beenden sich selbst, wenn die Anwendung verschwindet oder ihre Frist abläuft, und werden auch bei abgebrochenen Anfragen sicher aufgeräumt; Antworten werden auf Form und Länge geprüft, Exit-Status ins Log geschrieben.
- **Datenbank-Abfragen (Härtung 4: Operatoren und Typen)**: Bei freigegebenen Tabellen werden auch implizit gewählte Vergleichsoperatoren (BETWEEN, IN, `CASE x WHEN`, `GREATEST`/`LEAST`, Zeilenvergleiche, Sortierung) auf eigenen Kundencode geprüft, ebenso Typumwandlungen in Funktionsschreibweise (`meine_domain('5')`) und die SQL/JSON-Konstruktoren (`JSON_ARRAY`, `JSON_OBJECT` u. a.). Ein eigener Operator zählt nur noch, wenn er im search_path erreichbar ist und nicht von einem gleich definierten Standardoperator verdeckt wird; die Ablehnung nennt Operator, Typen und Schema und beschreibt die Abhilfe. Der Katalog-SQL ist durchgehend mit `pg_catalog.` qualifiziert; Größen- und Definitionsfunktionen (`pg_relation_size`, `pg_get_viewdef` u. a.) melden „Server-Informationsfunktion … nicht erlaubt“; PostGIS-Statistikfunktionen (`ST_EstimatedExtent`, `_postgis_stats`) sind gesperrt.
- **Rückfrage im Chat**: Die Rückfrage hängt davon ab, was in der Unterhaltung gelesen wurde. Stammen Inhalte aus Quellen, die Dritte verfassen können (Websuche und Internetseiten, E-Mails und Mailarchiv, Tickets, ecoDMS, Wiki, Dokumentbibliothek, Ausgaben von Server-Befehlen; auch Ergebnisse von Unteragenten, die so etwas gelesen haben), führt der Assistent **jeden** Schritt mit Wirkung erst nach Ihrer Bestätigung aus. Hat er nur eigene Dateien, Rechenergebnisse oder Ihre Datenbank gelesen, fragt er nur bei Schritten, die nach außen gehen (E-Mail senden, Tickets schreiben oder löschen, im Archiv oder bei DATEV ablegen, Wiki-Frage, Server-Befehl, Paket-Installation, unbekannte Internetadresse) – und auch dann nicht, wenn Empfänger beziehungsweise Adresse wörtlich in Ihrer Nachricht stehen (E-Mail: auch Ihre eigene Adresse) – sowie bei dauerhaften Schritten (Aufgabe oder Agent anlegen, Wiki schreiben, Skill vorschlagen); „Merken“ fragt dann ebenfalls (die Karte zeigt den vollständigen Text), nur „Vergessen“ fragt nicht. Ohne gelesene Inhalte von außen gibt es keine Rückfrage. Eine Internetadresse gilt nur als bekannt, wenn sie als ganze Adresse in Ihrer Nachricht steht oder ein Ergebnis der Websuche ist (nicht die Suchanfrage, nicht Links aus abgerufenen Seiten). Die Karte „Bitte bestätigen“ zeigt genau, was passiert (zum Beispiel Empfänger, Betreff und Text einer E-Mail; unsichtbare oder umlenkende Zeichen erscheinen als <U+…> mit Warnzeile); mit **Ausführen** oder **Nicht ausführen** entscheiden Sie über genau diesen einen Schritt. Die Karte gilt einmalig und 30 Minuten, **Stopp** verwirft sie; wurde ein Anhang seit der Anfrage verändert oder der Agent inzwischen deaktiviert, wird nicht ausgeführt. Beim Ausprobieren im Agenten-Baukasten fragt der Assistent bei jedem solchen Schritt. Im Audit steht, ob ein Schritt bestätigt, abgelehnt oder abgelaufen ist. Aus Unterhaltungen mit Inhalten von Dritten werden keine Gedächtnis- oder Wiki-Einträge automatisch abgeleitet; nach gelesenen eigenen Dateien oder Rechenergebnissen entfällt das automatische Merken ebenfalls (das Wiki nicht). Automatische Aufgaben und Workflow-Schritte legen nach Inhalten von Dritten keine neuen Aufgaben, Agenten, Wiki-Einträge oder Skill-Vorschläge an und merken sich nichts (das Werkzeug meldet dem Assistenten, dass der Nutzer das im Chat selbst anstoßen kann; im Audit steht „nicht ausgeführt (automatischer Lauf nach fremden Inhalten)“); „Merken“ ist in automatischen Läufen auch nach eigenen Dateien gesperrt. Alle übrigen Schritte laufen dort weiter ohne Rückfrage, ebenso das Ausprobieren eines Workflows, das die Schritte echt ausführt. Die Warnzeile der Karte erkennt zusätzlich weitere unsichtbare Zeichen (Variation Selectors, Füllzeichen, Leerzeichen-Varianten).
- **Prüfungen und Testläufe ohne Wirkung**: Automatische Agenten-Prüfungen, Testfälle und Workflow-Testläufe führen Werkzeuge mit Wirkung (E-Mail senden, Tickets schreiben, Archivieren, DATEV-Upload, Wiki ändern, Gedächtnis, Aufgaben und Agenten anlegen, Server-Befehle, unbekannte Internetadressen) nicht mehr aus, sondern simulieren sie; im Audit stehen sie als „simuliert (Prüflauf)“. Lesende Werkzeuge laufen in Prüfläufen weiterhin echt.
- **Wiki-Pflege**: Die automatische Wiki-Pflege wertet nur noch Ihre Nachricht und die Antwort des Assistenten aus, nicht mehr die Ergebnisse von Werkzeugen (E-Mails, Dokumente, Datenbanken, Webseiten). Antworten, für die ein Postfach, das Mailarchiv oder DATEV genutzt wurde, werden gar nicht für das Wiki ausgewertet.
- **Server-Befehle**: In der Positivliste steht `*` nur noch für genau ein Argument ohne Leerzeichen; am Wortanfang darf es nicht mit `-` beginnen, sodass sich keine zusätzlichen Optionen einschleusen lassen. `..` im Befehl sowie bekannte Schreib- und Löschoptionen (zum Beispiel `--vacuum`, `--rotate`, `--flush`) sind immer gesperrt. `*` darf keine Shell-Platzhalter (`*`, `?`, `[`, `{`, `~`) einsetzen, und jedes Wort wird für die Ziel-Shell einzeln gequotet. Die Standardliste für neue Server enthält übliche Diagnosebefehle mit Optionen (zum Beispiel `docker ps -a`, `df -h -i`, `systemctl status * --no-pager`, `journalctl -u * -n * --no-pager`). Lehnt die Positivliste einen Befehl ab, erklärt die Meldung, dass Optionen im Muster stehen müssen; Administratoren sehen zusätzlich ein passendes Muster. Bereits gespeicherte Listen werden nicht verändert.
- **Sitzungen**: Eine Anmeldung endet nach 30 Tagen ohne Nutzung (bisher blieb sie dauerhaft bestehen); abgelaufene Sitzungen werden automatisch gelöscht. Der Live-Kanal für Administratoren prüft beim Verbinden die aktuelle Rolle.
- **Benutzerverwaltung**: Administratoren können sich nicht selbst deaktivieren oder löschen, und der letzte aktive Administrator kann weder herabgestuft noch deaktiviert noch gelöscht werden.
- **Weitere Härtungen**: Hinweis- und Fehlermeldungen werden nie als HTML ausgegeben; Formulare dürfen nur an die eigene Anwendung senden (Content-Security-Policy `form-action 'self'`). Die DATEV-Mandantennummer wird strikt geprüft. Dateien auf Netzlaufwerken (SMB) mit Semikolon, Anführungszeichen oder Steuerzeichen im Namen werden übersprungen. Wiki-Seiten endgültig löschen dürfen nur noch Administratoren. Das Limit „Dateien pro Unterhaltung“ (Standard 200) gilt auch für Uploads im Chat und Anhänge an Nachrichten. Die Ersteinrichtung ist gegen gleichzeitige Anfragen abgesichert.
- **Umgezogene Verbindungen bleiben „wartet auf Freigabe“**: Legt ein Technik-Administrator eine Verbindung an oder ändert er deren Ziel (auch bei einer inaktiven Verbindung), bleibt sie persistent als „wartet auf Freigabe“ markiert – in Liste und Bearbeitungsformular zusammen mit dem aktuellen Ziel – bis ein Administrator sie aktiviert; dabei werden Schreib- und Löschschalter zurückgesetzt. Aktive Verbindungen löschen nur noch Administratoren. Die Modell-Liste einer KI-Anbindung wird bei geändertem Ziel nicht mehr gespeichert; Pfad, Datenbank und Adresse im Systemprompt werden bereinigt. Neue Spalte: `awaiting_activation` an den Verbindungstabellen.
- **Technik-Administrator bereitet vor, Administrator schaltet frei**: Technik-Administratoren können KI-Modelle und alle Datenanbindungen (Dokumentquellen, Datenbanken, ecoDMS, MailStore, DATEV, Server, Ticketsysteme) anlegen (zunächst inaktiv, „wartet auf Freigabe durch einen Administrator“), Schlüssel, Modellliste und Grenzen ändern und die Verbindung testen. Aktivieren, als Standard setzen, als Anbindung für Embeddings wählen sowie Anbieter und Adresse einer bestehenden Anbindung ändern dürfen nur Administratoren; bei den Datenanbindungen darf ein Technik-Administrator das Ziel nur ändern, solange die Verbindung inaktiv bleibt (mit neu eingegebenem Passwort), und Deaktivieren bleibt jedem erlaubt. Inaktive Anbindungen werden nirgends verwendet. Die Beschreibung der Datenquellen (Dokumente, Datenbanken, ecoDMS, MailStore, Server, Ticketsysteme), die im Systemprompt steht, ändern ebenfalls nur Administratoren. Das Ziel des Mail-Versands (Versandart, SMTP-Server, Port, Benutzer, Verschlüsselung, Microsoft-365-Mandant und -Anwendungs-ID, Absender) und die Update-Quelle ändern nur Administratoren; ein Versuch eines Technik-Administrators wird mit Meldung abgelehnt, die Felder sind gesperrt. Passwort und Client-Secret dürfen sie für das unveränderte Ziel neu setzen.
- **Systemprompt gehärtet**: Namen von Verbindungen und Quellen sind auf 80 Zeichen begrenzt (bei Änderung des Namens) und dürfen keine Steuerzeichen oder Zeilenumbrüche enthalten. Werte aus Fremdsystemen, die im Systemprompt stehen (Ticket-Status und -Prioritäten, Ordner und Dokumentenarten, Ressourcen), werden von Steuerzeichen befreit, auf 40 Zeichen gekürzt und in der Anzahl begrenzt. Die Ergebnisse der Werkzeuge bleiben unverändert.
- Kalender: Termine mit anderer Vertraulichkeit als „normal“ (auch „persönlich“) werden ohne Betreff angezeigt; ist „Kalender lesen“ aus, wird die Kalender-Berechtigung bei der Token-Erneuerung nicht angefragt.
- Verliert ein Benutzer den Wiki-Zugriff oder wird Administrator, entfallen seine Freigaben für vertrauliche Wiki-Kunden; bei erneutem Wiki-Zugriff müssen sie neu vergeben werden.
- **Technik-Administrator kann gespeicherte Zugangsdaten nicht mehr umleiten**: Ändert ein Technik-Administrator das Ziel einer Verbindung (Server, Adresse, Port, Benutzer, Freigabe, Mandant, Zertifikat – bei KI-Modellen, Dokumentquellen, Datenbanken, ecoDMS, MailStore, DATEV, Servern, Ticketsystemen und Mail-Versand), muss er das Passwort, den Schlüssel oder das Token neu eingeben; das gilt auch für „Testen“. Befehlslisten der Server, Tabellen- und Schema-Listen der Datenbanken sowie Schreib- und Löschfreigaben (ecoDMS, DATEV, Ticketsysteme) ändern nur noch Administratoren.

### Hinweise zum Update
- Bisher global installierte Python-Pakete (`_pip_packages/`) werden nicht mehr eingebunden und müssen je Benutzer neu installiert werden; das alte Verzeichnis wird nicht gelöscht.
- Agenten ohne Tool-Auswahl bekommen nur noch lesende Standard-Tools. Schreibende oder ausführende Werkzeuge (E-Mail-Versand, Ticket schreiben/löschen, ecoDMS-Upload, Wiki schreiben, Server-Befehl, Paket-Installation, Skill-Vorschlag, DATEV-Upload) müssen ausdrücklich ausgewählt werden.
- „Freigegebene Tabellen“ einer Datenbankquelle wird bei PostgreSQL per Syntaxbaum und Ausführungsplan erzwungen, bei MySQL bestmöglich; eine echte Sperre gelingt dort nur über die Rechte des Lesebenutzers in der Datenbank (eigener Benutzer ohne Superuser-Rechte). Einträge ohne Schema gelten nur in den bei der Quelle eingestellten Schemas.
- HTML-Ergebnisse werden ohne Skripte angezeigt.
- Der IMAP-Port (143/993) wird nur beim Anlegen sowie bei Änderung von Host oder Port geprüft; bestehende Postfächer mit anderem Port bleiben nutzbar, das Einlesen der Ordner schlägt nicht mehr im Hintergrund fehl.
- Wiki-Fragen (`wiki_ask`) sind kein Standard-Werkzeug mehr und müssen für Agenten ausdrücklich ausgewählt werden; Namen der Standard-Agenten sind für persönliche Agenten reserviert (bestehende persönliche Agenten mit solchem Namen sollten umbenannt werden).
- Der Updater bricht bei einem fehlgeschlagenen Backup vor einer nicht rollback-sicheren Migration sauber ab und startet die bisherige Version genau einmal neu.
- Anmeldebegrenzung je E-Mail-Adresse: Wiederholte Fehlversuche sperren die Anmeldung für dieses Konto bis zu 15 Minuten, auch für den berechtigten Nutzer.
- Der Betrieb nutzt zwei zusätzliche Worker-Prozesse (je etwa 150–250 MB Arbeitsspeicher).
- Notschalter für die Content-Security-Policy: `CSP_REPORT_ONLY=1` (nur melden, nicht blockieren), z. B. über eine `compose.override.yml`.
- **Server-Befehle – Positivlisten prüfen**: `*` steht nur noch für ein einzelnes Argument. Ein Eintrag wie `systemctl status *` erlaubt `systemctl status nginx`, aber nicht mehr `systemctl status nginx --no-pager`. Befehle mit Optionen oder mehreren Argumenten müssen ausdrücklich als Muster in der Liste stehen (zum Beispiel `journalctl -n * -u *`); die Standardliste neuer Server enthält die üblichen Diagnosebefehle bereits. Bestehende Listen werden nicht automatisch umgeschrieben. `*` setzt außerdem keine Shell-Platzhalter (`*`, `?`, `[`, `{`, `~`) mehr ein. Bitte prüfen Sie nach dem Update die Positivlisten Ihrer Server unter Datenanbindung → Server.
- **Rückfrage im Chat**: Sobald eine Unterhaltung Inhalte von außen enthält, wartet der Assistent vor Schritten mit Wirkung auf Ihre Bestätigung (Karte „Bitte bestätigen“, Knopf **Ausführen**). Bei Inhalten, die Dritte verfassen können (Web, E-Mail, Tickets, Wiki, Dokumente, Server-Ausgaben), gilt das für jeden solchen Schritt; bei eigenen Dateien und Rechenergebnissen nur für Schritte nach außen, deren Ziel nicht in Ihrer Nachricht steht, und für dauerhafte Schritte. Beim Ausprobieren im Agenten-Baukasten fragt der Assistent bei jedem Schritt. Automatische Aufgaben und die Schritte echter Workflow-Läufe arbeiten wie bisher ohne Rückfrage; schreiben Sie danach selbst im Workflow-Chat weiter, gilt die normale Rückfrage.
- **Prüf- und Testläufe** (Agenten-Prüfung, Testfälle, Workflow-Testläufe) simulieren Werkzeuge mit Wirkung nur noch. Testfälle, deren Abnahmekriterien eine echte Wirkung voraussetzen (zum Beispiel eine tatsächlich angekommene E-Mail), bitte anpassen.
- **Sitzungen** enden nach 30 Tagen ohne Nutzung. Durch das Update wird niemand abgemeldet; die Frist beginnt für bestehende Anmeldungen mit dem Update.
- **Wiki-Pflege**: Wissen, das nur in Werkzeug-Ergebnissen stand (zum Beispiel in einer gelesenen E-Mail oder einem Dokument), gelangt nicht mehr automatisch ins Wiki. Bitten Sie den Assistenten bei Bedarf ausdrücklich, es einzutragen.
- **Wiki-Seiten** endgültig löschen können nur noch Administratoren.
- **Deaktivierte Benutzer und Agenten**: Ihre Aufgaben ruhen. Wer bisher ein Konto deaktiviert, dessen Aufgaben aber weiterlaufen lassen wollte, überträgt diese Aufgaben auf ein aktives Konto.
- **Datenbank**: Drei Migrationen laufen beim Update automatisch. Sie fügen nur zwei Spalten und eine Tabelle hinzu; bestehende Daten werden nicht verändert.
- **Farbe**: Die dunklere Standard-Primärfarbe gilt nur für neue Installationen; gespeicherte Farben bleiben unverändert.
- **Kein späterer Rückschritt auf eine ältere Version ohne Backup**: Die Migrationen dieses Releases fügen nur Spalten mit Standardwerten hinzu und laufen auch mit dem Vorgängercode; schlägt das Update fehl, genügt der automatische Rückschritt des Images (er geschieht unmittelbar nach der Migration, wenn es noch keine vertraulichen Kunden und Technik-Administratoren gibt). Wer **später von Hand** auf eine ältere Version zurückgeht, macht vertrauliche Wiki-Kunden wieder für alle Wiki-Benutzer sichtbar, verliert die Eigentümer-Ebene und die Technik-Administratoren werden zu gewöhnlichen Benutzern. Das darf nur zusammen mit dem Backup von vor dem Update geschehen.
- Beim Update wird der älteste aktive Administrator zum Eigentümer. Wer weitere Administratoren verwalten soll, braucht den Eigentümer-Status (Benutzer → Bearbeiten → Eigentümer, nur durch einen Eigentümer).
- Technik-Administratoren müssen beim Ändern des Ziels einer Verbindung das Passwort bzw. den Schlüssel neu eingeben; Administratoren sind davon nicht betroffen. Vorhandene Wiki-Kunden bleiben unverändert sichtbar, bis ein Administrator sie als „Vertraulich“ markiert.

## [1.8.0-beta.4] – 2026-11-11

### Neu
- **Outlook-Kalender lesen (Microsoft 365, nur lesend)**: Der Assistent kann Termine, Feiertage und Abwesenheiten aus dem eigenen Outlook-Kalender eines Benutzers lesen (Werkzeug `calendar_events`, Zeitraum bis 62 Tage; private und vertrauliche Termine nur mit Zeit, ohne Betreff). Die Funktion ist standardmäßig aus: Der Administrator aktiviert unter Einstellungen → Persönliche Postfächer „Kalender lesen“ und ergänzt in der Entra-App-Registrierung die delegierte Berechtigung `Calendars.Read`. Benutzer melden sich danach unter „Meine Postfächer“ einmal erneut mit Microsoft 365 an; bestehende Anmeldungen laufen unverändert weiter (nur Mail). Neue Spalten: `mailboxes.granted_scopes`, `app_settings.mailbox_calendar`.
- **Monatliche Aufgaben**: Automatische Aufgaben lassen sich jetzt auch monatlich an einem Tag im Monat planen (Aufgaben-Formular, Agenten-Baukasten und im Chat: „jeden Monat am 1. um 7 Uhr“). Gibt es den Tag in einem Monat nicht (z. B. der 31.), läuft die Aufgabe am letzten Tag dieses Monats. Neue Spalte: `scheduled_tasks.day_of_month`.
- **Vier Ebenen bei den Benutzern**: Eigentümer (Hauptadministrator), Administrator, Technik-Administrator (für einen externen IT-Dienstleister) und Benutzer. Der Technik-Administrator richtet KI-Modelle, Datenanbindungen, Updates, Status und die allgemeinen Einstellungen ein, sieht aber keine Inhalte (Dokumentsuche, Befehlsausgaben) und hat keinen Zugriff auf Benutzer, Skills, Agenten, Audit, Werkzeug-Richtlinien, Verbesserung, Postfächer/Kalender sowie Update-Kanal und Update-Adresse; Daten und Wiki nur über die Haken unter Benutzer → Datenzugriff. Administratoren verwalten nur Technik-Administratoren und Benutzer; Administratoren anlegen oder ändern und den Eigentümer-Status vergeben kann nur ein Eigentümer, und es bleibt immer mindestens ein aktiver Eigentümer. Neue Spalte: `users.owner`.
- **Vertrauliche Kunden im Wiki**: Ein Administrator kann einen Kunden im Kunden-Wiki als „Vertraulich“ markieren und Benutzer dafür freigeben. Ein vertraulicher Kunde samt Seiten, Fakten und KI-Fragen ist nur für Administratoren und die freigegebenen Benutzer sichtbar – in Liste, Suche, Lesen, Schreiben und für den Assistenten (auch in Unter-Agenten, Aufgaben und Workflows); für alle anderen ist er nicht auffindbar und wird auch nicht automatisch angelegt oder befüllt. Technik-Administratoren sehen ihn nur mit Freigabe. Standard ist „nicht vertraulich“: ohne markierte Kunden ändert sich nichts. Neue Spalte: `wiki_customers.restricted`.

### Sicherheit
- **Umgezogene Verbindungen bleiben „wartet auf Freigabe“**: Legt ein Technik-Administrator eine Verbindung an oder ändert er deren Ziel (auch bei einer inaktiven Verbindung), bleibt sie persistent als „wartet auf Freigabe“ markiert – in Liste und Bearbeitungsformular zusammen mit dem aktuellen Ziel – bis ein Administrator sie aktiviert; dabei werden Schreib- und Löschschalter zurückgesetzt. Aktive Verbindungen löschen nur noch Administratoren. Die Modell-Liste einer KI-Anbindung wird bei geändertem Ziel nicht mehr gespeichert; Pfad, Datenbank und Adresse im Systemprompt werden bereinigt. Neue Spalte: `awaiting_activation` an den Verbindungstabellen.
- **Technik-Administrator bereitet vor, Administrator schaltet frei**: Technik-Administratoren können KI-Modelle und alle Datenanbindungen (Dokumentquellen, Datenbanken, ecoDMS, MailStore, DATEV, Server, Ticketsysteme) anlegen (zunächst inaktiv, „wartet auf Freigabe durch einen Administrator“), Schlüssel, Modellliste und Grenzen ändern und die Verbindung testen. Aktivieren, als Standard setzen, als Anbindung für Embeddings wählen sowie Anbieter und Adresse einer bestehenden Anbindung ändern dürfen nur Administratoren; bei den Datenanbindungen darf ein Technik-Administrator das Ziel nur ändern, solange die Verbindung inaktiv bleibt (mit neu eingegebenem Passwort), und Deaktivieren bleibt jedem erlaubt. Inaktive Anbindungen werden nirgends verwendet. Die Beschreibung der Datenquellen (Dokumente, Datenbanken, ecoDMS, MailStore, Server, Ticketsysteme), die im Systemprompt steht, ändern ebenfalls nur Administratoren. Das Ziel des Mail-Versands (Versandart, SMTP-Server, Port, Benutzer, Verschlüsselung, Microsoft-365-Mandant und -Anwendungs-ID, Absender) und die Update-Quelle ändern nur Administratoren; ein Versuch eines Technik-Administrators wird mit Meldung abgelehnt, die Felder sind gesperrt. Passwort und Client-Secret dürfen sie für das unveränderte Ziel neu setzen.
- **Systemprompt gehärtet**: Namen von Verbindungen und Quellen sind auf 80 Zeichen begrenzt (bei Änderung des Namens) und dürfen keine Steuerzeichen oder Zeilenumbrüche enthalten. Werte aus Fremdsystemen, die im Systemprompt stehen (Ticket-Status und -Prioritäten, Ordner und Dokumentenarten, Ressourcen), werden von Steuerzeichen befreit, auf 40 Zeichen gekürzt und in der Anzahl begrenzt. Die Ergebnisse der Werkzeuge bleiben unverändert.
- Kalender: Termine mit anderer Vertraulichkeit als „normal“ (auch „persönlich“) werden ohne Betreff angezeigt; ist „Kalender lesen“ aus, wird die Kalender-Berechtigung bei der Token-Erneuerung nicht angefragt.
- Verliert ein Benutzer den Wiki-Zugriff oder wird Administrator, entfallen seine Freigaben für vertrauliche Wiki-Kunden; bei erneutem Wiki-Zugriff müssen sie neu vergeben werden.
- **Technik-Administrator kann gespeicherte Zugangsdaten nicht mehr umleiten**: Ändert ein Technik-Administrator das Ziel einer Verbindung (Server, Adresse, Port, Benutzer, Freigabe, Mandant, Zertifikat – bei KI-Modellen, Dokumentquellen, Datenbanken, ecoDMS, MailStore, DATEV, Servern, Ticketsystemen und Mail-Versand), muss er das Passwort, den Schlüssel oder das Token neu eingeben; das gilt auch für „Testen“. Befehlslisten der Server, Tabellen- und Schema-Listen der Datenbanken sowie Schreib- und Löschfreigaben (ecoDMS, DATEV, Ticketsysteme) ändern nur noch Administratoren.

### Hinweise zum Update
- **Kein späterer Rückschritt auf eine ältere Version ohne Backup**: Die Migrationen dieses Releases fügen nur Spalten mit Standardwerten hinzu und laufen auch mit dem Vorgängercode; schlägt das Update fehl, genügt der automatische Rückschritt des Images (er geschieht unmittelbar nach der Migration, wenn es noch keine vertraulichen Kunden und Technik-Administratoren gibt). Wer **später von Hand** auf eine ältere Version zurückgeht, macht vertrauliche Wiki-Kunden wieder für alle Wiki-Benutzer sichtbar, verliert die Eigentümer-Ebene und die Technik-Administratoren werden zu gewöhnlichen Benutzern. Das darf nur zusammen mit dem Backup von vor dem Update geschehen.
- Beim Update wird der älteste aktive Administrator zum Eigentümer. Wer weitere Administratoren verwalten soll, braucht den Eigentümer-Status (Benutzer → Bearbeiten → Eigentümer, nur durch einen Eigentümer).
- Technik-Administratoren müssen beim Ändern des Ziels einer Verbindung das Passwort bzw. den Schlüssel neu eingeben; Administratoren sind davon nicht betroffen. Vorhandene Wiki-Kunden bleiben unverändert sichtbar, bis ein Administrator sie als „Vertraulich“ markiert.

## [1.8.0-beta.3] – 2026-11-11

### Sicherheit
- **Datenbank-Abfragen (Prozess-Isolation)**: Schlägt der Start des abgespaltenen Abfrageprozesses fehl, beendet er sich jetzt sofort und meldet „Abfrageprozess konnte nicht starten“. Zuvor konnte er in diesem seltenen Fall im Code des Hauptprozesses weiterlaufen und dessen Datenbankverbindung mitbenutzen.
- **Datenbank-Abfragen (Nachbesserung)**: Bei PostgreSQL zerlegt die App jede Abfrage mit dem echten PostgreSQL-Parser (neue Abhängigkeit: Gem `pg_query`, enthält libpg_query) und prüft den gesamten Syntaxbaum: genau eine SELECT-Anweisung (kein DML in CTEs, kein SELECT INTO, kein FOR UPDATE/SHARE, kein EXPLAIN/CALL), gesperrte Funktionen in jeder Schreibweise (auch `(wert).funktion`, in VALUES, LIMIT/OFFSET, Window-Frames, TABLESAMPLE, JSON_TABLE) und Systemsichten (u. a. `pg_locks`, `pg_prepared_xacts`, `pg_stat_*`). Die Anweisung wird exakt aus dem Parse-Ergebnis ausgeschnitten und mit `standard_conforming_strings = on` ausgeführt; die Transaktion endet immer mit ROLLBACK (kein NOTIFY o. Ä.). Syntax, die neuer ist als der eingebaute Parser (PostgreSQL 17), wird mit einer Syntaxfehler-Meldung abgelehnt, bis das Gem aktualisiert ist. Die frühere Regex-/Plan-Textprüfung ist entfallen: Legitime Abfragen mit Wörtern wie `Set`, `delete`, `Do`, `comment`, `;`, `--` oder `/*` in Texten werden nicht mehr abgelehnt oder verfälscht. Bei MySQL werden `#`-Kommentare entfernt, ein vorhandenes LIMIT wird gekappt statt gekapselt, ohne setzbaren Abfrage-Timeout (auch MariaDB) wird nicht ausgeführt, und das Zeilenlimit wird begrenzt. Empfehlung: Lesebenutzer ohne Large-Object-Rechte anlegen.
- **Datenbank-Abfragen (Härtung 2)**: Bei freigegebenen Tabellen (PostgreSQL) sind eigene Operatoren, eigene Typumwandlungen (Casts) und Domains mit CHECK-Constraint außerhalb von `pg_catalog` gesperrt, weil sie beliebige Funktionen aufrufen können; Funktionen, Operatoren und Typen unkritischer Erweiterungen (zum Beispiel citext, pgcrypto, unaccent, pg_trgm, hstore, uuid-ossp, pgvector) bleiben erlaubt – zuvor wurden dadurch auch `max`, `min`, `replace`, `gen_random_uuid` und `unaccent` abgelehnt. Mehrere Funktionen in FROM (zum Beispiel `unnest(a, b)`, `ROWS FROM`) werden gegen die erlaubten Mengenfunktionen geprüft statt pauschal abgelehnt; Spaltenzugriffe wie `k.status` zählen nur noch als Funktionsaufruf, wenn es eine Funktion mit einem Argument gibt. Weitere Server-Funktionen sind gesperrt (Kontrolldatei, geladene Module, WAL-Zusammenfassungen, Replikations-Slots kopieren, Statistik schreiben, Index-Wartung). Ergebnisse über 20 MB werden abgelehnt („Ergebnis zu groß“; die Daten werden zeilenweise gelesen und eine einzelne Zeile über der Grenze verlässt den Datenbankserver gar nicht erst), und Fehlermeldungen nennen keine lokalen Pfade mehr.
- **Datenbank-Tabellenfreigabe** wird bei PostgreSQL-Quellen erzwungen: Vor der Ausführung prüft die App die Tabellen im Syntaxbaum und den Ausführungsplan der Datenbank (EXPLAIN) und lehnt Abfragen ab, die eine nicht freigegebene Tabelle lesen – auch über Views, Unterabfragen, CTEs oder Joins. Bei Views zählt die Basistabelle; die View selbst muss ebenfalls in der Liste stehen. Bei MySQL ist die Freigabe eine Textprüfung nach bestem Bemühen (erkennt jetzt auch Backticks ohne Leerzeichen, `STRAIGHT_JOIN`, Index-Hinweise und Datenbankpräfixe); die echte Sperre sind die Rechte des Datenbank-Lesebenutzers. Einträge ohne Schema gelten nur in den eingestellten Schemas der Quelle. Bei freigegebenen Tabellen sind in FROM nur einfache Mengenfunktionen (`generate_series`, `unnest`, `json_each` u. a.) erlaubt, und jeder Funktionsname, der auch außerhalb von `pg_catalog` existiert (eigene Funktionen können beliebige Tabellen lesen), wird per Katalogabfrage erkannt und abgelehnt.
- **Sandbox-Dateien**: Dateien aus der Sandbox werden ohne Symlink-Auflösung (auch gegen Austausch von Zwischenverzeichnissen während des Schreibens abgesichert) geschrieben und ausgeliefert (kein Schreiben oder Lesen außerhalb des Arbeitsbereichs; Downloads aus geprüftem Dateihandle, Symlinks und FIFOs ergeben 404). HTML-, SVG- und XHTML-Ergebnisse und -Dokumente werden nur abgeschottet angezeigt (ohne Skripte); XML-, XSL- und JavaScript-Dateien werden immer heruntergeladen.
- **Internetabrufe** des Agenten verbinden sich zur geprüften IP-Adresse (Schutz vor DNS-Rebinding), auch bei Weiterleitungen; bei Ausfall einer Adressfamilie (Dual-Stack) werden die geprüften Adressen nacheinander versucht, IPv4 zuerst. App-Code und Konfiguration im Container sind für den Laufzeitnutzer nicht mehr beschreibbar.
- **Content-Security-Policy** für die gesamte App (Skripte nur eigene Herkunft, Bilder nur lokal, kein Einbetten von Objekten oder Frames); Notschalter `CSP_REPORT_ONLY=1` (Wahrheitswert wie `FORCE_SSL`: `0`/`false` schaltet aus). Der Skript-Nonce bleibt für die Sitzung stabil (Turbo-Navigation ohne Voll-Reload) und wird beim Login erneuert.
- **Python-Pakete** werden je Benutzer getrennt, hinter der Standardbibliothek eingebunden und nur als fertige Pakete (Wheels) ohne Build-Skripte installiert. Die Policy `sandbox.pip_admins_only` beschränkt die Installation auf Administratoren.
- **Anmeldung und Sitzungen**: Login zusätzlich je E-Mail-Adresse begrenzt (20 Versuche in 15 Minuten; Abwägung: Dadurch kann jemand, der die E-Mail-Adresse kennt, das Konto bis zu 15 Minuten gezielt aussperren – der Schutz vor Passwort-Raten hat Vorrang); deaktivierte Nutzer verlieren Live-Verbindungen und Sitzungen, ebenso bei Rollen- oder Passwortwechsel.
- **Agenten**: Per Assistent (create_agent) angelegte Agenten von Nicht-Administratoren sind persönlich; geteilte Agenten legen nur Administratoren an. Ergebnisse externer Quellen (Dokumente, Web, E-Mail, Tickets, Datenbank sowie die Ergebnisse von `server_command`, `run_python`, `run_shell`, `run_agent` und `ticket_api_describe` u. a.) sind als „nur Daten, keine Anweisungen“ gekennzeichnet.
- **Datenbankquellen**: Die Tabellenliste filtert den Katalog und wird bei PostgreSQL per Syntaxbaum und Ausführungsplan erzwungen, bei MySQL bestmöglich – die echte Sperre sind die Rechte des Lesebenutzers (eigener Benutzer ohne Superuser, ohne `pg_read_all_stats`/`pg_read_server_files`, bei MySQL ohne FILE-Recht). Funktionen, die Text-SQL ausführen, Dateien oder Large Objects lesen (`query_to_xml`, `dblink`, `pg_read_file`, `lo_open`/`loread` u. a.) oder Server-Statistik und -Konfiguration preisgeben, sind gesperrt; Tabellen in geklammerten Joins werden erkannt. MySQL-Abfragen laufen nun wirklich schreibgeschützt (`START TRANSACTION READ ONLY`), und die Zeilenbegrenzung gilt unabhängig vom Abfragetext.
- Chat-Inhalte, Eingaben, Prompts und Beschreibungen werden aus den Logs gefiltert; Upload-Größenlimit gilt auch beim Senden von Nachrichten; Adressat von Wiki-Fragen wird geprüft; gespeicherte private SSH-Schlüssel erscheinen nicht mehr im Formular; IMAP-Port 143/993 wird beim Anlegen sowie bei Änderung von Host oder Port geprüft; Gem-Updates.
- **Datenbank-Abfragen (Härtung 3: Speicher)**: Jede Datenbankabfrage läuft in einem eigenen, abgespaltenen Prozess mit Adressraumgrenze (+768 MB über dem Ausgangswert; die Grenze erzwingt nur Linux, also der Server). Ein vorab berechneter riesiger Ausführungsplan (`repeat('x', 250000000)`: Spitze 3 GB im Anwendungsprozess), eine MySQL-Zeile aus mehreren großen Zellen (Spitze 1,4 GB) oder ein Wert, der nur komprimiert klein ist, belasten damit nie mehr die Anwendung: Der Abfrageprozess scheitert mit „Ergebnis zu groß“, der Anwendungsprozess bleibt bei seiner Größe. Kosten: etwa 10 bis 15 ms pro Abfrage. Der Größenwächter misst bei PostgreSQL jetzt die unkomprimierte Textgröße der Zeile; Abfragen derselben Quelle trennen sich bei gleichzeitigem Lauf nicht mehr gegenseitig die Verbindung.
- **Datenbank-Abfragen (Härtung 4)**: Auch leere Zellen und NULL zählen beim Größenlimit (pauschal 16 Byte je Zelle, höchstens etwa 1,3 Mio. Zellen – genug für einen Export mit 20 000 Zeilen und bis zu 65 Spalten; sonst „Ergebnis hat zu viele Zellen“) – zuvor ließen sich mit sehr vielen leeren Spalten über 1 GB Speicher im Anwendungsprozess belegen. Ein Verbindungsabbruch (Datenbank-Neustart, MySQL `wait_timeout`) wird nicht mehr fälschlich als „Ergebnis zu groß“ gemeldet, sondern als „Verbindung zur Datenbank abgebrochen“; Fehlermeldungen der Datenbank werden nie umgedeutet. Pro Prozess laufen höchstens drei Datenbankabfragen gleichzeitig (`FIRMENKI_DB_MAX_CHILDREN`), weitere bitten um erneuten Versuch. Abfrageprozesse beenden sich selbst, wenn die Anwendung verschwindet oder ihre Frist abläuft, und werden auch bei abgebrochenen Anfragen sicher aufgeräumt; Antworten werden auf Form und Länge geprüft, Exit-Status ins Log geschrieben.
- **Datenbank-Abfragen (Härtung 4: Operatoren und Typen)**: Bei freigegebenen Tabellen werden auch implizit gewählte Vergleichsoperatoren (BETWEEN, IN, `CASE x WHEN`, `GREATEST`/`LEAST`, Zeilenvergleiche, Sortierung) auf eigenen Kundencode geprüft, ebenso Typumwandlungen in Funktionsschreibweise (`meine_domain('5')`) und die SQL/JSON-Konstruktoren (`JSON_ARRAY`, `JSON_OBJECT` u. a.). Ein eigener Operator zählt nur noch, wenn er im search_path erreichbar ist und nicht von einem gleich definierten Standardoperator verdeckt wird; die Ablehnung nennt Operator, Typen und Schema und beschreibt die Abhilfe. Der Katalog-SQL ist durchgehend mit `pg_catalog.` qualifiziert; Größen- und Definitionsfunktionen (`pg_relation_size`, `pg_get_viewdef` u. a.) melden „Server-Informationsfunktion … nicht erlaubt“; PostGIS-Statistikfunktionen (`ST_EstimatedExtent`, `_postgis_stats`) sind gesperrt.
- **Rückfrage im Chat**: Die Rückfrage hängt davon ab, was in der Unterhaltung gelesen wurde. Stammen Inhalte aus Quellen, die Dritte verfassen können (Websuche und Internetseiten, E-Mails und Mailarchiv, Tickets, ecoDMS, Wiki, Dokumentbibliothek, Ausgaben von Server-Befehlen; auch Ergebnisse von Unteragenten, die so etwas gelesen haben), führt der Assistent **jeden** Schritt mit Wirkung erst nach Ihrer Bestätigung aus. Hat er nur eigene Dateien, Rechenergebnisse oder Ihre Datenbank gelesen, fragt er nur bei Schritten, die nach außen gehen (E-Mail senden, Tickets schreiben oder löschen, im Archiv oder bei DATEV ablegen, Wiki-Frage, Server-Befehl, Paket-Installation, unbekannte Internetadresse) – und auch dann nicht, wenn Empfänger beziehungsweise Adresse wörtlich in Ihrer Nachricht stehen (E-Mail: auch Ihre eigene Adresse) – sowie bei dauerhaften Schritten (Aufgabe oder Agent anlegen, Wiki schreiben, Skill vorschlagen); „Merken“ fragt dann ebenfalls (die Karte zeigt den vollständigen Text), nur „Vergessen“ fragt nicht. Ohne gelesene Inhalte von außen gibt es keine Rückfrage. Eine Internetadresse gilt nur als bekannt, wenn sie als ganze Adresse in Ihrer Nachricht steht oder ein Ergebnis der Websuche ist (nicht die Suchanfrage, nicht Links aus abgerufenen Seiten). Die Karte „Bitte bestätigen“ zeigt genau, was passiert (zum Beispiel Empfänger, Betreff und Text einer E-Mail; unsichtbare oder umlenkende Zeichen erscheinen als <U+…> mit Warnzeile); mit **Ausführen** oder **Nicht ausführen** entscheiden Sie über genau diesen einen Schritt. Die Karte gilt einmalig und 30 Minuten, **Stopp** verwirft sie; wurde ein Anhang seit der Anfrage verändert oder der Agent inzwischen deaktiviert, wird nicht ausgeführt. Beim Ausprobieren im Agenten-Baukasten fragt der Assistent bei jedem solchen Schritt. Im Audit steht, ob ein Schritt bestätigt, abgelehnt oder abgelaufen ist. Aus Unterhaltungen mit Inhalten von Dritten werden keine Gedächtnis- oder Wiki-Einträge automatisch abgeleitet; nach gelesenen eigenen Dateien oder Rechenergebnissen entfällt das automatische Merken ebenfalls (das Wiki nicht). Automatische Aufgaben und Workflow-Schritte legen nach Inhalten von Dritten keine neuen Aufgaben, Agenten, Wiki-Einträge oder Skill-Vorschläge an und merken sich nichts (das Werkzeug meldet dem Assistenten, dass der Nutzer das im Chat selbst anstoßen kann; im Audit steht „nicht ausgeführt (automatischer Lauf nach fremden Inhalten)“); „Merken“ ist in automatischen Läufen auch nach eigenen Dateien gesperrt. Alle übrigen Schritte laufen dort weiter ohne Rückfrage, ebenso das Ausprobieren eines Workflows, das die Schritte echt ausführt. Die Warnzeile der Karte erkennt zusätzlich weitere unsichtbare Zeichen (Variation Selectors, Füllzeichen, Leerzeichen-Varianten).
- **Prüfungen und Testläufe ohne Wirkung**: Automatische Agenten-Prüfungen, Testfälle und Workflow-Testläufe führen Werkzeuge mit Wirkung (E-Mail senden, Tickets schreiben, Archivieren, DATEV-Upload, Wiki ändern, Gedächtnis, Aufgaben und Agenten anlegen, Server-Befehle, unbekannte Internetadressen) nicht mehr aus, sondern simulieren sie; im Audit stehen sie als „simuliert (Prüflauf)“. Lesende Werkzeuge laufen in Prüfläufen weiterhin echt.
- **Wiki-Pflege**: Die automatische Wiki-Pflege wertet nur noch Ihre Nachricht und die Antwort des Assistenten aus, nicht mehr die Ergebnisse von Werkzeugen (E-Mails, Dokumente, Datenbanken, Webseiten). Antworten, für die ein Postfach, das Mailarchiv oder DATEV genutzt wurde, werden gar nicht für das Wiki ausgewertet.
- **Server-Befehle**: In der Positivliste steht `*` nur noch für genau ein Argument ohne Leerzeichen; am Wortanfang darf es nicht mit `-` beginnen, sodass sich keine zusätzlichen Optionen einschleusen lassen. `..` im Befehl sowie bekannte Schreib- und Löschoptionen (zum Beispiel `--vacuum`, `--rotate`, `--flush`) sind immer gesperrt. `*` darf keine Shell-Platzhalter (`*`, `?`, `[`, `{`, `~`) einsetzen, und jedes Wort wird für die Ziel-Shell einzeln gequotet. Die Standardliste für neue Server enthält übliche Diagnosebefehle mit Optionen (zum Beispiel `docker ps -a`, `df -h -i`, `systemctl status * --no-pager`, `journalctl -u * -n * --no-pager`). Lehnt die Positivliste einen Befehl ab, erklärt die Meldung, dass Optionen im Muster stehen müssen; Administratoren sehen zusätzlich ein passendes Muster. Bereits gespeicherte Listen werden nicht verändert.
- **Sitzungen**: Eine Anmeldung endet nach 30 Tagen ohne Nutzung (bisher blieb sie dauerhaft bestehen); abgelaufene Sitzungen werden automatisch gelöscht. Der Live-Kanal für Administratoren prüft beim Verbinden die aktuelle Rolle.
- **Benutzerverwaltung**: Administratoren können sich nicht selbst deaktivieren oder löschen, und der letzte aktive Administrator kann weder herabgestuft noch deaktiviert noch gelöscht werden.
- **Weitere Härtungen**: Hinweis- und Fehlermeldungen werden nie als HTML ausgegeben; Formulare dürfen nur an die eigene Anwendung senden (Content-Security-Policy `form-action 'self'`). Die DATEV-Mandantennummer wird strikt geprüft. Dateien auf Netzlaufwerken (SMB) mit Semikolon, Anführungszeichen oder Steuerzeichen im Namen werden übersprungen. Wiki-Seiten endgültig löschen dürfen nur noch Administratoren. Das Limit „Dateien pro Unterhaltung“ (Standard 200) gilt auch für Uploads im Chat und Anhänge an Nachrichten. Die Ersteinrichtung ist gegen gleichzeitige Anfragen abgesichert.

### Neu
- **MySQL und MariaDB als Datenbankquelle** laufen jetzt wirklich: Der Treiber (Gem `mysql2`, im Image mit `libmariadb`) war bisher nicht enthalten, jede MySQL-Anbindung scheiterte mit „mysql2 is not part of the bundle“. Gegen MySQL 8.4 und MariaDB 11.4 getestet (Timeout, Zeilenlimit, Nur-Lese-Transaktion, Tabellenfreigabe). Empfehlung: einen Lesebenutzer nur mit SELECT anlegen, ohne FILE, PROCESS, SUPER und ohne Rechte auf `mysql.*`, denn bei MySQL ist die Tabellenfreigabe eine Textprüfung und die Rechte des Benutzers sind die eigentliche Sperre. Neu abgelehnt bei MySQL: Versionskommentare (`/*! … */`), `--` ohne folgendes Leerzeichen, `FOR SHARE`, weitere Warte-/Sperrfunktionen; ein `;` im Text-Literal ist dagegen erlaubt.
- **OCR**: Gescannte PDF-Seiten ohne Textebene werden per OCR indexiert (höchstens 50 Seiten je Dokument; ist das Limit erreicht, steht ein Hinweis am Dokument). Dokumente ohne erkennbaren Text erhalten den Status „kein Text“ und werden nicht bei jedem Scan neu verarbeitet.
- **Chat**: Lange Unterhaltungen laden nur die letzten 40 Nachrichten, ältere über „Ältere Nachrichten laden“; die Ladezeit bleibt konstant. Mehrfachsenden per Enter wird verhindert, der Senden-Knopf zeigt den Ladezustand, nach dem Senden wird automatisch gescrollt.
- **Barrierefreiheit**: Nachrichtenliste als Live-Region, beschriftete Eingabefelder und Symbol-Knöpfe, höhere Kontraste, reduzierte Bewegung.
- **Passwort selbst ändern**: Jeder Benutzer ändert sein Passwort über das Schlüssel-Symbol unten in der Seitenleiste (aktuelles Passwort und neues Passwort mit mindestens 10 Zeichen). Danach sind alle anderen Geräte abgemeldet. Die Anmeldeseite weist bei vergessenem Passwort auf den Administrator hin.
- **Sprache vor der Anmeldung**: Auf der Anmeldeseite und bei der Ersteinrichtung wählen Sie die Sprache (DE, EN, FR). Meldungen erscheinen in dieser Sprache, und bei der ersten Anmeldung wird sie als Ihre Sprache übernommen.
- **Handy-Ansicht**: Auf kleinen Bildschirmen öffnet ein Menü-Knopf die Seitenleiste als Überlagerung, die Ergebnisspalte lässt sich einblenden, und Inhalte laufen nicht mehr über den Rand.
- **Verständliche Meldungen bei Problemen mit dem KI-Modell**: Ist das Modell nicht erreichbar, lehnt es die Anmeldung ab, wird es nicht gefunden, ist ein Limit erreicht oder antwortet es zu lange nicht, erscheint eine verständliche Meldung in Ihrer Sprache; Administratoren sehen zusätzlich die technische Ursache.
- **Start ohne KI-Modell**: Eine neue Unterhaltung zeigt einen Hinweis, solange kein KI-Modell angebunden ist (Administratoren mit Knopf „KI-Modell einrichten“); nach der Ersteinrichtung führt die Anwendung direkt zum Anlegen des Modells.
- **Fehlerseiten** (nicht gefunden, abgelehnt, Serverfehler) sind schlicht, dreisprachig und bieten einen Rückweg; ein nicht mehr vorhandenes Dokument ergibt eine verständliche Meldung statt einer leeren Seite.

### Geändert
- **Rückfrage im Chat auf dem Handy**: Solange eine Rückfrage offen ist, wird der schwebende Hilfe-Knopf ausgeblendet, damit er den Text der Karte nicht verdeckt; die Hilfe bleibt über „Hilfe & FAQ“ erreichbar.
- **Wiki-Fragen** (`wiki_ask`) sind kein Standard-Werkzeug mehr: Das Werkzeug legt eine Frage an die Wissensverantwortlichen an und muss deshalb für einen Agenten ausdrücklich ausgewählt werden; es steht nur aktiven Adressaten mit Wiki-Freigabe zur Verfügung.
- **Namen der Standard-Agenten** sind für persönliche Agenten reserviert (auch beim Anlegen per Assistent); die Meldung nennt den Grund.
- **Werkzeug-Limit** stoppt Antwortläufe hart: Der Abschlussaufruf erfolgt mit gesperrten Werkzeugen (`tool_choice none`); lehnt ein lokaler (nicht Anthropic) Server das ab oder ruft das Modell trotzdem Werkzeuge auf, folgt ein zweiter Versuch ohne Werkzeuge mit ausdrücklicher Aufforderung zur Zusammenfassung, sonst ein Hinweis statt Endlosschleife. Aufrufe von Unteragenten zählen im Budget der Anfrage mit, Agenten-Chats dürfen höchstens 40 Werkzeuge aufrufen. Sehr große Werkzeugergebnisse werden auf 30.000 Zeichen gekürzt, das Kontextfenster gilt auch während der Werkzeugrunden.
- **Wiederholungsbremse**: Der dritte identische Aufruf (Werkzeug und Parameter) in Folge wird abgewiesen, ebenso der vierte identische innerhalb der letzten acht Aufrufe; nach drei Abweisungen in Folge endet die Werkzeugrunde. Unbekannte Werkzeugnamen werden mitgezählt. Solche Abbrüche erscheinen im Aktivitätsfenster als Warnung.
- **Hilfsaufgaben** (Chat-Titel, Gedächtnis-/Wiki-Extraktion, Agenten-Prüfung und -Bewertung, Workflow-Prüfer) nutzen die Modell-Anbindung der Unterhaltung bzw. des Agenten statt der Standard-Anbindung; lokale Daten gehen nicht mehr an eine Cloud-Anbindung.
- **Systemprompt** ohne Dubletten und beim automatischen Routing deutlich kürzer (etwa 3 statt 18 KB); das Gedächtnis im Prompt ist auf 4000 Zeichen begrenzt, mit neuem Hinweis zu externen Inhalten. JSON-Antworten des Modells werden robuster ausgewertet. Anthropic-Anbindungen nutzen Prompt-Caching.
- **Chat-Streaming** schlanker: Klartext während der Antwort, Markdown am Ende; SweetAlert2 und Editor-Controller laden erst bei Bedarf.
- **Dokumentbibliothek**: Ein vom Massenlöschungsschutz blockierter oder wegen fehlendem Quellordner abgebrochener Scan läuft erst nach dem eingestellten Intervall erneut (nicht alle 10 Minuten). Schlägt die Neuindexierung fehl, bleiben die alten Abschnitte durchsuchbar. Bei Ausfall des Embedding-Servers liefert die Suche weiter Volltexttreffer (Timeout 15 s); Suchanfragen-Embeddings werden 10 Minuten zwischengespeichert.
- **Python-Paketindex** konfigurierbar über `FIRMENKI_PIP_INDEX_URL` (Standard `https://pypi.org/simple`, nur http(s)-URL ohne Zugangsdaten), z. B. für einen internen Mirror.
- **Betrieb**: Chat-Antworten und Hintergrundaufgaben (Dokumentscan, Verbindungsanalysen, Agentenprüfung, Verbesserung) laufen in eigenen Worker-Prozessen (Queues `chat` und `background`). Aufräumarbeiten laufen im Minutentakt-Job statt beim Aufruf von Central; die Statusseite speichert Prüfungen 30 Sekunden zwischen (`?refresh=1` erzwingt neu); neue Datenbank-Indizes; Updater 1.0.3 (Beta-Zähler im Versionsvergleich; bei nicht rollback-sicheren Updates startet die alte Version, wenn der Fehler vor der Migration auftritt, wieder); das Release-Skript pusht atomar.
- **Einheitliche Begriffe**: In der Seitenleiste heißen die Bereiche jetzt „Meine Agenten“ (bisher „Agenten bauen“) und „Agenten verwalten“; neue Agenten legen Sie mit „+ Neuer Agent“ an. Agenten erscheinen überall mit ihrer Bezeichnung statt mit dem technischen Namen. Die Oberfläche spricht Sie durchgehend mit „Sie“ an; Status, Rollen und Mehrzahlformen sind übersetzt.
- **Formulare und Meldungen**: Alle Formulare zeigen Fehler in einer einheitlichen Liste und markieren die betroffenen Felder rot; Pflichtfelder tragen ein Sternchen. Löschdialoge haben einen roten Knopf „Löschen“, Meldungen erscheinen unten links, und die Hilfe-Sprechblase lässt sich dauerhaft ausblenden.
- **Einstellungen**: Werkzeuge stehen mit lesbaren Namen in der Liste „Erlaubte Werkzeuge“ (Haken = erlaubt); die Abschnitte haben eigene Speichern-Knöpfe. Bei KI-Modell und Postfach stehen seltene Angaben unter „Erweiterte Einstellungen“.
- **Agenten-Baukasten und Workflows**: Gesperrte Bausteine nennen den Grund (Administratoren mit „Jetzt anbinden“), die Speichern-Leiste bleibt sichtbar. Ein Workflow ohne Auftrag und ohne Datei startet erst nach einer Rückfrage.
- **Deaktivierte Benutzer und Agenten**: Aufgaben und Workflow-Läufe deaktivierter Benutzer werden nicht mehr gestartet; nach dem Reaktivieren wird der nächste Termin neu geplant, Versäumtes wird nicht nachgeholt. Aufgaben mit deaktiviertem Agenten werden übersprungen (Hinweis im Verlauf). Ein deaktivierter Agent arbeitet auch in bestehenden Unterhaltungen nicht weiter: Die Unterhaltung wechselt mit einem Hinweis zum Standard-Assistenten.
- **Automatische Verbesserung**: Ein Verbesserungsvorschlag wird nicht übernommen, wenn Skill oder Agent seitdem geändert wurden; kürzlich fehlgeschlagene Kandidaten werden nicht sofort erneut versucht; nachgebesserte Agenten-Anweisungen werden von Code-Rahmen und Vorreden befreit, unbrauchbare verworfen.
- **Erscheinungsbild**: Seitentitel und Platzhalter verwenden den eingestellten Namen der Anwendung, das Symbol zeigt dessen Anfangsbuchstaben. Die Standard-Primärfarbe neuer Installationen ist etwas dunkler (besser lesbar). Texte automatischer Aufgaben erscheinen in der Sprache des Besitzers.
- **Datenanbindung**: Fällige Dokumentscans und Aufgaben werden nur noch einmal gestartet, auch wenn mehrere Prozesse gleichzeitig prüfen. SharePoint-Scans verwenden die Verbindung wieder, erneuern das Zugangstoken und warten bei Drosselung durch Microsoft die vorgegebene Zeit ab. Datenbankquellen prüfen das Aktualisierungsintervall (mindestens 15 Minuten) und den Port.

### Behoben
- **MySQL/MariaDB-Abfragen (Spaltennamen)**: Die Stichwortsperre ist auf echte Gefahren begrenzt (INTO, FOR UPDATE/FOR SHARE/LOCK IN SHARE MODE, Schreibbefehle nach WITH, gefährliche Funktionen). Spalten wie `comment`, `begin`, `import`, `reset`, `execute`, `refresh`, `prepare`, `copy`, `cluster`, `t.set` und Funktionen wie `insert('abc', 1, 1, 'x')` werden nicht mehr abgelehnt; die Meldung nennt das auslösende Wort und den Ausweg (Backticks).
- **MySQL/MariaDB-Abfragen**: Wörter wie „Set“, „do it“ oder „comment“ in Textwerten und in gequoteten Spaltennamen (`` `set` ``) lösen die Befehlssperre nicht mehr aus; `INTO OUTFILE`, `INTO @variable` und Schreibbefehle bleiben gesperrt.
- Hängende Updates sperren Chat und Aufgaben nicht mehr dauerhaft (Abgleich im Minutenlauf, beim Auto-Update und beim Status-Abruf; Höchstdauer 2 Stunden, solange der Updater nicht mehr läuft, 12 Stunden bei laufendem Updater); das Update-Overlay lädt nicht mehr in Schleife neu; abgestürzte Antworten (älter als 30 Minuten) blockieren Updates nicht mehr; hängende Agentenprüfungen und Aufgabenläufe werden nach 2 bzw. 3 Stunden beendet; scheitert das Einreihen bei Prüfung, Veröffentlichung oder Workflow-Freigabe, bleibt kein „läuft“-Zustand zurück; Fehler in Aufgabenläufen werden zuverlässig protokolliert und gemeldet.
- Die Dokumentbibliothek löscht bei fehlendem oder nicht lesbarem Quellordner keine Dokumente mehr: Der Abgleich bricht mit Fehlermeldung ab, ebenso wenn mehr als die Hälfte der Dokumente wegfiele („Trotzdem abgleichen“ hebt den Schutz auf). Unlesbare Unterordner werden gemeldet, ihre Dokumente bleiben. SharePoint meldet zu große Ordner und eine nicht lesbare Standardbibliothek als Fehler statt einer unvollständigen Liste.
- Agenten bekommen Datenquellen-, E-Mail- und Postfach-Werkzeuge nur, wenn eine Anbindung vorhanden und freigegeben ist; ein Stopp im Unterlauf beendet auch den übergeordneten Lauf; die Antwort eines Unterlaufs ist die letzte Antwort ohne Werkzeugaufruf; die zweite Kontext-Zusammenfassung enthält keine Doppelungen.
- Automatische Aufgaben starten keinen neuen Lauf, solange die Antwort auf den vorigen Lauf in derselben Unterhaltung noch läuft; der Termin wird als übersprungener Lauf (Status „Fehler“, Hinweis „Übersprungen“) festgehalten.
- Eine zweite Nachricht während einer laufenden Antwort wird mit Hinweis abgelehnt statt doppelt verarbeitet; die Aktivmarkierung der Seitenleiste bleibt nach einer Titeländerung erhalten.
- Updater: Erscheint ein Release genau zwischen dem Abruf von Manifest und Signatur, lädt der Updater beides einmal neu und prüft erneut, statt fälschlich „Signatur des Manifests ungültig“ zu melden. Ein manipuliertes Manifest wird weiterhin abgelehnt.
- **Stopp**: Nach „Stopp“ während eines Werkzeug-Schritts (zum Beispiel beim Delegieren an einen Agenten) bleibt die Unterhaltung benutzbar; bereits betroffene Unterhaltungen funktionieren wieder. Ein früh gedrückter Stopp wirkt, und „Stopp“ gibt eine nach Absturz oder Neustart hängende Unterhaltung sofort frei (bisher bis zu 30 Minuten gesperrt).
- **Fehler des KI-Modells**: Nach einem Fehler bleibt keine „Denkt …“-Anzeige stehen; leere oder fehlgeschlagene Antworten werden nicht mehr an das Modell zurückgegeben, eine leere Modellantwort erscheint als verständliche Meldung.
- **Geplante Aufgaben**: Die Uhrzeit täglicher und wöchentlicher Aufgaben lässt sich wieder ändern; eine pausiert angelegte Aufgabe führt nicht mehr zu einem Serverfehler; wöchentliche Aufgaben ohne Wochentag werden mit Meldung abgelehnt; „Jetzt ausführen“ bei pausierten Aufgaben und „Jetzt scannen“ bei inaktiven Quellen melden den Grund; ein unerwarteter Startfehler bei Workflow-Aufgaben beendet den Lauf mit Fehlerstatus.
- **Verbindungen**: Serververbindungen mit Passwort-Anmeldung funktionieren wieder. Bei DATEV bleibt das gespeicherte Passwort erhalten, wenn das Feld beim Bearbeiten leer bleibt. Die Testmail meldet abgebrochene SMTP-Verbindungen als Fehler statt mit einem Serverfehler.
- **Datenfreigaben** werden nur gespeichert, wenn das Speichern des Benutzers gelingt; beim Löschen einer Datenquelle werden ihre Freigaben mitgelöscht.
- **Kunden-Wiki**: Fakten werden nicht mehr wegen eines ähnlichen Namens dem falschen Kunden zugeordnet. Ein deaktivierter Kunde bleibt deaktiviert: Die automatische Wiki-Pflege überspringt ihn, und nur eine ausdrückliche Aktion eines Administrators aktiviert ihn wieder. Die Adresse `/wiki/seiten` führt zum Wiki.
- **Agenten und Skills**: Gleichzeitig angestoßene Agenten-Prüfungen laufen nacheinander, ein veraltetes Prüfergebnis wird verworfen. Skill-Vorschläge lassen sich nicht mehr doppelt freigeben, und eine Freigabe aktiviert einen deaktivierten Skill nicht wieder.
- **Kleinere Korrekturen**: Die Kontextanzeige berücksichtigt den Systemprompt; ein selbst vergebener Unterhaltungstitel bleibt erhalten; ein leerer oder zu langer Gedächtnis-Eintrag wird mit Meldung abgelehnt; die Modellauswahl zeigt nicht mehr „Standard (Standard (lokal))“; fehlende Übersetzungen sind ergänzt.

### Hinweise zum Update
- Bisher global installierte Python-Pakete (`_pip_packages/`) werden nicht mehr eingebunden und müssen je Benutzer neu installiert werden; das alte Verzeichnis wird nicht gelöscht.
- Agenten ohne Tool-Auswahl bekommen nur noch lesende Standard-Tools. Schreibende oder ausführende Werkzeuge (E-Mail-Versand, Ticket schreiben/löschen, ecoDMS-Upload, Wiki schreiben, Server-Befehl, Paket-Installation, Skill-Vorschlag, DATEV-Upload) müssen ausdrücklich ausgewählt werden.
- „Freigegebene Tabellen“ einer Datenbankquelle wird bei PostgreSQL per Syntaxbaum und Ausführungsplan erzwungen, bei MySQL bestmöglich; eine echte Sperre gelingt dort nur über die Rechte des Lesebenutzers in der Datenbank (eigener Benutzer ohne Superuser-Rechte). Einträge ohne Schema gelten nur in den bei der Quelle eingestellten Schemas.
- HTML-Ergebnisse werden ohne Skripte angezeigt.
- Der IMAP-Port (143/993) wird nur beim Anlegen sowie bei Änderung von Host oder Port geprüft; bestehende Postfächer mit anderem Port bleiben nutzbar, das Einlesen der Ordner schlägt nicht mehr im Hintergrund fehl.
- Wiki-Fragen (`wiki_ask`) sind kein Standard-Werkzeug mehr und müssen für Agenten ausdrücklich ausgewählt werden; Namen der Standard-Agenten sind für persönliche Agenten reserviert (bestehende persönliche Agenten mit solchem Namen sollten umbenannt werden).
- Der Updater bricht bei einem fehlgeschlagenen Backup vor einer nicht rollback-sicheren Migration sauber ab und startet die bisherige Version genau einmal neu.
- Anmeldebegrenzung je E-Mail-Adresse: Wiederholte Fehlversuche sperren die Anmeldung für dieses Konto bis zu 15 Minuten, auch für den berechtigten Nutzer.
- Der Betrieb nutzt zwei zusätzliche Worker-Prozesse (je etwa 150–250 MB Arbeitsspeicher).
- Notschalter für die Content-Security-Policy: `CSP_REPORT_ONLY=1` (nur melden, nicht blockieren), z. B. über eine `compose.override.yml`.
- **Server-Befehle – Positivlisten prüfen**: `*` steht nur noch für ein einzelnes Argument. Ein Eintrag wie `systemctl status *` erlaubt `systemctl status nginx`, aber nicht mehr `systemctl status nginx --no-pager`. Befehle mit Optionen oder mehreren Argumenten müssen ausdrücklich als Muster in der Liste stehen (zum Beispiel `journalctl -n * -u *`); die Standardliste neuer Server enthält die üblichen Diagnosebefehle bereits. Bestehende Listen werden nicht automatisch umgeschrieben. `*` setzt außerdem keine Shell-Platzhalter (`*`, `?`, `[`, `{`, `~`) mehr ein. Bitte prüfen Sie nach dem Update die Positivlisten Ihrer Server unter Datenanbindung → Server.
- **Rückfrage im Chat**: Sobald eine Unterhaltung Inhalte von außen enthält, wartet der Assistent vor Schritten mit Wirkung auf Ihre Bestätigung (Karte „Bitte bestätigen“, Knopf **Ausführen**). Bei Inhalten, die Dritte verfassen können (Web, E-Mail, Tickets, Wiki, Dokumente, Server-Ausgaben), gilt das für jeden solchen Schritt; bei eigenen Dateien und Rechenergebnissen nur für Schritte nach außen, deren Ziel nicht in Ihrer Nachricht steht, und für dauerhafte Schritte. Beim Ausprobieren im Agenten-Baukasten fragt der Assistent bei jedem Schritt. Automatische Aufgaben und die Schritte echter Workflow-Läufe arbeiten wie bisher ohne Rückfrage; schreiben Sie danach selbst im Workflow-Chat weiter, gilt die normale Rückfrage.
- **Prüf- und Testläufe** (Agenten-Prüfung, Testfälle, Workflow-Testläufe) simulieren Werkzeuge mit Wirkung nur noch. Testfälle, deren Abnahmekriterien eine echte Wirkung voraussetzen (zum Beispiel eine tatsächlich angekommene E-Mail), bitte anpassen.
- **Sitzungen** enden nach 30 Tagen ohne Nutzung. Durch das Update wird niemand abgemeldet; die Frist beginnt für bestehende Anmeldungen mit dem Update.
- **Wiki-Pflege**: Wissen, das nur in Werkzeug-Ergebnissen stand (zum Beispiel in einer gelesenen E-Mail oder einem Dokument), gelangt nicht mehr automatisch ins Wiki. Bitten Sie den Assistenten bei Bedarf ausdrücklich, es einzutragen.
- **Wiki-Seiten** endgültig löschen können nur noch Administratoren.
- **Deaktivierte Benutzer und Agenten**: Ihre Aufgaben ruhen. Wer bisher ein Konto deaktiviert, dessen Aufgaben aber weiterlaufen lassen wollte, überträgt diese Aufgaben auf ein aktives Konto.
- **Datenbank**: Drei Migrationen laufen beim Update automatisch. Sie fügen nur zwei Spalten und eine Tabelle hinzu; bestehende Daten werden nicht verändert.
- **Farbe**: Die dunklere Standard-Primärfarbe gilt nur für neue Installationen; gespeicherte Farben bleiben unverändert.

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
