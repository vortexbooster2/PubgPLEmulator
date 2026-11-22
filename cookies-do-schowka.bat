@echo off
chcp 65001 >nul
cd /d "%~dp0"
if not exist cookies.txt (
  echo Nie ma pliku cookies.txt w tym folderze.
  pause
  exit /b 1
)
powershell -NoProfile -Command "[Convert]::ToBase64String([IO.File]::ReadAllBytes((Join-Path (Get-Location) 'cookies.txt'))) | Set-Clipboard"
if errorlevel 1 (
  echo Nie udalo sie skopiowac.
) else (
  echo Skopiowano do schowka. Wklej to na Render jako YOUTUBE_COOKIES_BASE64.
)
pause
