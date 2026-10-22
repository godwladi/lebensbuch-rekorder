# Einmalig: Ordner mit dem GitHub-Projekt verbinden und die erste Version hochladen.
# Vorher auf github.com das leere Projekt "lebensbuch-rekorder" anlegen (ohne README).
$ErrorActionPreference = 'Continue'
Set-Location (Split-Path $PSScriptRoot)
$repo = 'https://github.com/godwladi/lebensbuch-rekorder.git'
if (-not (Test-Path '.git')) { git init -b main | Out-Null }
git remote remove origin 2>$null
git remote add origin $repo
git add -A
git commit -m "Lebensbuch-Rekorder: erste Version" | Out-Null
git push -u origin main
if ($LASTEXITCODE -ne 0) {
  Write-Host ''
  Write-Host 'Hochladen hat nicht geklappt. Gibt es das Projekt lebensbuch-rekorder auf GitHub schon?'
  Write-Host 'https://github.com/new  ->  Name: lebensbuch-rekorder, Public, ohne README'
  exit 1
}
Write-Host ''
Write-Host 'Hochgeladen. Jetzt noch einmal GitHub Pages einschalten:'
Write-Host 'https://github.com/godwladi/lebensbuch-rekorder/settings/pages'
Write-Host '  Source: Deploy from a branch  ->  Branch: main, Ordner: / (root)  ->  Save'
Write-Host ''
Write-Host 'Nach 1-2 Minuten ist die App online: https://godwladi.github.io/lebensbuch-rekorder/'
Start-Process 'https://github.com/godwladi/lebensbuch-rekorder/settings/pages'
