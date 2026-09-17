cls
@echo off
chcp 1251 >nul
title Включение секунд на часах в "Панели уведомлений"

echo Выполняется включение секунд на часах в "Панели уведомлений":
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSecondsInSystemClock" /t "REG_DWORD" /d "0x000000001" /f
taskkill /f /im explorer.exe
start explorer.exe
echo.

pause