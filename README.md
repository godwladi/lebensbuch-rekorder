# Lebensbuch-Rekorder

Diktiergerät für die Gespräche mit Mama. Nimmt auf, schreibt auf Deutsch, Englisch und Russisch mit, unterscheidet „Mama“ und „Ich“ und packt alles als ZIP fürs Lebensbuch. Die App selbst lässt sich auf Deutsch, Englisch oder Russisch umstellen.

Aufgebaut wie die Schnurrkanone: eine Web-App auf GitHub Pages, die auf dem iPhone über „Zum Home-Bildschirm“ wie eine App läuft.

## Einmalig einrichten

1. Auf https://github.com/new ein Projekt anlegen: Name **lebensbuch-rekorder**, **Public**, ohne README.
2. Doppelklick auf **`Einrichten (einmalig).bat`**. Das lädt die erste Version hoch und öffnet die Pages-Einstellungen.
3. Dort: Source **Deploy from a branch**, Branch **main**, Ordner **/ (root)**, **Save**.
4. Nach 1–2 Minuten ist die App online: **https://godwladi.github.io/lebensbuch-rekorder/**
5. Auf dem iPhone die Adresse in **Safari** öffnen → Teilen → **„Zum Home-Bildschirm“**.

## Neue Version online stellen

Doppelklick auf **`Online stellen.bat`**. Das Skript zählt die Cache-Version in `sw.js` hoch, committet und lädt hoch. Auf dem iPhone die App ganz schließen und **zweimal** starten. Neue Dateien in `sw.js` unter `FILES` eintragen.

## Gut zu wissen

- **Live-Mitschrift auf dem iPhone:** geht nur, wenn die Adresse direkt in Safari offen ist. Vom Home-Bildschirm aus lässt iOS keine Spracherkennung zu (WebKit-Bug 225298). Aufnehmen geht in beiden Fällen. Siri bzw. Diktierfunktion muss an sein.
- **Display an lassen:** Sperrt das iPhone oder wechselt man die App, wird die Aufnahme sofort gespeichert. Danach einfach weiter aufnehmen.
- **Aufnahmen liegen nur auf dem Gerät.** Regelmäßig unter „Aufnahmen“ → „ZIP erstellen und sichern“ exportieren (z. B. „In Dateien sichern“ → iCloud Drive) und im Lebensbuch unter „Aufnahmen“ hochladen.
- **Am PC:** `Rekorder starten.bat` öffnet ein eigenes Fenster. Für die Live-Mitschrift besser die Online-Adresse in Edge oder Chrome nutzen.
- **Dateinamen** wie `lebensbuch__kindheit-3__20261022-1130.webm` verraten dem Lebensbuch, zu welcher Frage die Aufnahme gehört. Bitte nicht umbenennen.

## Dateien

- `index.html` – die ganze App (Fragen in 3 Sprachen, Aufnahme, Mitschrift, Export)
- `manifest.webmanifest`, `sw.js`, `icons/` – Home-Bildschirm und Offline-Betrieb
- `tools/` – Skripte für Einrichten und Online stellen
