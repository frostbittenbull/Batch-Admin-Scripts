cls
@echo off
chcp 1251 >nul
title Отключение уведомлений от "My Kaspersky"

echo Выполняется отключение уведомлений от "My Kaspersky" (нужно предварительно выключить самозащиту в антивирусе "Kaspersky"):
set /p version="Введите версию своего Kaspersky (например, 21.24): "
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\KasperskyLab\AVP%version%\Data\UCPRegistrationAlert" /v "state" /t "REG_DWORD" /d "0x00000002" /f
echo.

pause