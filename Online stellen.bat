@echo off
rem Neue Version des Rekorders auf GitHub Pages online stellen
cd /d "%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -File "tools\online-stellen.ps1"
pause
