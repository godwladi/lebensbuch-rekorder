@echo off
rem Verbindet den Ordner einmalig mit dem GitHub-Projekt godwladi/lebensbuch-rekorder
cd /d "%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -File "tools\einrichten.ps1"
pause
