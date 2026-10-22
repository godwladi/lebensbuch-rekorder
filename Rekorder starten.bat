@echo off
rem Startet den Rekorder am PC als eigenes Fenster (Edge-App-Modus).
rem Fuer die Live-Mitschrift lieber die Online-Adresse nutzen: https://godwladi.github.io/lebensbuch-rekorder/
set "APP=%~dp0index.html"
set "PROFILE=%LOCALAPPDATA%\Lebensbuch-Rekorder"
if exist "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" (
  start "" "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" --app="file:///%APP:\=/%" --user-data-dir="%PROFILE%" --window-size=520,900
) else if exist "%ProgramFiles%\Microsoft\Edge\Application\msedge.exe" (
  start "" "%ProgramFiles%\Microsoft\Edge\Application\msedge.exe" --app="file:///%APP:\=/%" --user-data-dir="%PROFILE%" --window-size=520,900
) else (
  start "" "%APP%"
)
