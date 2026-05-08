cls
@echo off
chcp 1251 >nul
title Скрытие локального диска "C:\" с "Этот Компьютер"

echo Выполняется скрытие локального диска "C:\" с "Этот Клмпьютер":
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDrives" /t "REG_DWORD" /d "0x00000004" /f
taskkill /f /im explorer.exe
start explorer.exe
echo.

pause