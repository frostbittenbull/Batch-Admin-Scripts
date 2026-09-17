cls
@echo off
chcp 1251 >nul
title Смена автоматической директории командной строки

echo Выполняется включение автоматической директории "Рабочий стол" у командной строки:
reg add "HKEY_CURRENT_USER\Software\Microsoft\Command Processor" /v "AutoRun" /t "REG_EXPAND_SZ" /d "cd /d %UserProfile%\Desktop" /f
echo.

pause