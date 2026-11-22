@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo [1/3] Instaluje zaleznosci...
echo === npm install === > bot-log.txt
call npm install >> bot-log.txt 2>&1
echo [2/3] Rejestruje komendy...
echo === npm run register === >> bot-log.txt
call npm run register >> bot-log.txt 2>&1
echo [3/3] Bot uruchomiony. NIE ZAMYKAJ tego okna. Log: bot-log.txt
echo === npm start === >> bot-log.txt
call node src/bot.js >> bot-log.txt 2>&1
echo Bot sie zatrzymal. Sprawdz bot-log.txt
pause
