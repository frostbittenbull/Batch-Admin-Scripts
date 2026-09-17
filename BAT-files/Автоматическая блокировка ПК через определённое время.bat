cls
@echo off
chcp 1251 >nul
title Атоматическая блокировка ПК

echo Выполняется установка автоматической блокировки ПК:
set /p timeout="Введите время неактивности в секундах: "
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "InactivityTimeoutSecs" /t "REG_DWORD" /d %timeout% /f
echo Таймаут установлен на %timeout% секунд.
echo.

pause