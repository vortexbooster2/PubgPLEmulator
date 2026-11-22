@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo Wysylam poprawki na GitHub (Render sam je pobierze)...
echo === git === > wyslij-log.txt
git add src/musicPlayer.js setup.ps1 .gitignore >> wyslij-log.txt 2>&1
git commit -m "Naprawa odtwarzania muzyki z YouTube" -m "Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>" -m "Claude-Session: https://claude.ai/code/session_01VTjToPuQWpz6azDKd2bwA2" >> wyslij-log.txt 2>&1
git push origin main >> wyslij-log.txt 2>&1
git status -sb >> wyslij-log.txt 2>&1
git log --oneline -3 >> wyslij-log.txt 2>&1
type wyslij-log.txt
echo.
echo Gotowe. Mozesz zamknac to okno.
pause
