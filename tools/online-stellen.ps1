# Stellt die aktuelle Version auf GitHub Pages online (https://godwladi.github.io/lebensbuch-rekorder/).
# Setzt vorher die Cache-Version im Service Worker hoch, damit die iPhone-App das Update erkennt.
param([string]$Message = '')
$ErrorActionPreference = 'Continue'
Set-Location (Split-Path $PSScriptRoot)
$stamp = Get-Date -Format 'yyyyMMdd-HHmm'
$enc = New-Object System.Text.UTF8Encoding($false)
function Set-Text($file, $pattern, $repl) {
  $t = [IO.File]::ReadAllText((Resolve-Path $file))
  [IO.File]::WriteAllText((Resolve-Path $file), [regex]::Replace($t, $pattern, $repl), $enc)
}
git add -A
git diff --cached --quiet
if ($LASTEXITCODE -eq 0) { Write-Host 'Keine Aenderungen - nichts zu tun.'; exit 0 }
Set-Text 'sw.js' "const CACHE = '[^']*';" "const CACHE = 'lebensbuch-rekorder-$stamp';"
git add -A
if (-not $Message) { $Message = "Neue Version $stamp" }
$msgFile = Join-Path $env:TEMP 'rekorder-commit.txt'
[IO.File]::WriteAllText($msgFile, $Message, $enc)
git commit -F $msgFile
Remove-Item $msgFile
if ($LASTEXITCODE -ne 0) { throw 'Commit fehlgeschlagen' }
git push
if ($LASTEXITCODE -ne 0) { throw 'Hochladen fehlgeschlagen - Internet/GitHub-Anmeldung pruefen' }
Write-Host ''
Write-Host "Version $stamp hochgeladen. In ca. 1 Minute online:"
Write-Host 'https://godwladi.github.io/lebensbuch-rekorder/'
Write-Host 'iPhone: App schliessen, zweimal neu starten.'
