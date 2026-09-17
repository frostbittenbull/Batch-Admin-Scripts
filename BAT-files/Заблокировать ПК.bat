cls
@echo off
chcp 1251 >nul
title Блокировка компьютера

echo Выполняется блокировка компьютера после окончания таймаута:
set /p seconds="Введите время до блокировки в секундах (3600 секунд = 60 минут): "
timeout.exe /t %seconds% /nobreak
rundll32.exe user32.dll LockWorkStation
echo.

exit