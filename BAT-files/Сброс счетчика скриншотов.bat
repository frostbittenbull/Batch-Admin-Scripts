cls
@echo off
chcp 1251 >nul
title Сброс счетчика скриншотов

echo Выполняется сброс счетчика скриншотов:
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ScreenshotIndex" /t "REG_DWORD" /d "0x00000001" /f
echo.

pause