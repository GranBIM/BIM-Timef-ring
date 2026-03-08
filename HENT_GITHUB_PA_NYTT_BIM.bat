@echo off
title Hent GitHub pa nytt - BIM-Timeforing

echo.
echo  Dette scriptet overskriver lokale filer med GitHub-versjonen.
echo  Alle filer som allerede er pushet til GitHub er trygge.
echo.

set /p bekreft=Fortsett? (j/n): 
if /i not "%bekreft%"=="j" (
    echo Avbrutt.
    pause
    exit /b
)

cd /d "G:\GITHUB\GranBIM\BIM-Timef-ring"
if %errorlevel% neq 0 (
    echo FEIL: Fant ikke mappen. Sjekk stien i scriptet.
    pause
    exit /b
)

echo.
echo Henter fra GitHub...
git fetch origin
if %errorlevel% neq 0 (
    echo FEIL: git fetch feilet. Er git installert og i PATH?
    pause
    exit /b
)

echo.
echo Tilbakestiller til GitHub-versjon...
git reset --hard origin/main

echo.
echo Ferdig! Lokale filer er na identiske med GitHub.
echo.
pause
