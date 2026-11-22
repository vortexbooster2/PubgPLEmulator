@echo off
chcp 65001 >nul
cd /d "%~dp0"
set "SRC=%~dp0"
set "OUT=%TEMP%\pubgplemulator-vortex"
set "LOG=%~dp0wyslij-vortex-log.txt"
echo Kopiuje projekt bez .env, node_modules, logow i starej historii...
if exist "%OUT%" rmdir /s /q "%OUT%"
robocopy "%SRC%." "%OUT%" /E /XD .git node_modules /XF .env .env.local cookies.txt *.log bot-log.txt wyslij-log.txt wyslij-vortex-log.txt > "%LOG%" 2>&1
if errorlevel 8 (
  echo Kopiowanie nie powiodlo sie. Sprawdz wyslij-vortex-log.txt
  pause
  exit /b 1
)
cd /d "%OUT%"
if exist .env echo BLAD: .env trafil do kopii, przerywam.& pause & exit /b 1
echo === git === >> "%LOG%"
git init -b main >> "%LOG%" 2>&1
git add -A >> "%LOG%" 2>&1
git commit -m "PubgPLEmulator - pierwsza wersja" >> "%LOG%" 2>&1
git remote add origin https://vortexbooster2@github.com/vortexbooster2/PubgPLEmulator.git >> "%LOG%" 2>&1
echo Wysylam na github.com/vortexbooster2/PubgPLEmulator ...
echo Jesli pojawi sie okno logowania GitHub, zaloguj sie jako vortexbooster2.
git push -u origin main >> "%LOG%" 2>&1
echo === pliki w repozytorium === >> "%LOG%"
git ls-files >> "%LOG%" 2>&1
git log --oneline -1 >> "%LOG%" 2>&1
cd /d "%SRC%"
type "%LOG%" | findstr /i "main -> error fatal rejected"
echo.
echo Gotowe. Pelny log: wyslij-vortex-log.txt
pause
