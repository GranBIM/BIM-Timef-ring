# ═══════════════════════════════════════════════════════════════
#  push-til-github-BIM.ps1
#  Kjør dette scriptet fra BIM-Timefører-mappen for å laste
#  opp endringer til GitHub.
# ═══════════════════════════════════════════════════════════════

# Gå til mappen der scriptet ligger (samme som repo-roten)
Set-Location $PSScriptRoot

# Vis hvilke filer som er nye/endret
Write-Host ""
Write-Host "Følgende filer lastes opp:" -ForegroundColor Cyan
git status --short

# Spør om bekreftelse
Write-Host ""
$bekreft = Read-Host "Fortsett? (j/n)"
if ($bekreft -ne "j") {
    Write-Host "Avbrutt." -ForegroundColor Yellow
    exit
}

# Spør om commit-melding
Write-Host ""
$melding = Read-Host "Beskriv hva du laster opp (f.eks. 'Uke 11 - 2026-03-13')"
if ([string]::IsNullOrWhiteSpace($melding)) {
    $melding = "Oppdatering $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
}

# Legg til alle filer, commit og push
Write-Host ""
Write-Host "Laster opp..." -ForegroundColor Cyan

git add .
git commit -m "$melding"
git push

Write-Host ""
Write-Host "✅ Ferdig! Endringene er pushet til GitHub." -ForegroundColor Green
Write-Host "   https://github.com/GranBIM/BIM-Timef-ring" -ForegroundColor Green
Write-Host ""
