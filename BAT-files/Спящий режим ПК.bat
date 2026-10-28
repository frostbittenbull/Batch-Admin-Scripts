cls
@echo off
chcp 1251 >nul
title Перевод компьютера в спящий режим

echo Выполняется перевод компьютера в спящий режим после окончания таймаута:
set /p seconds="Введите время до спящего режима в секундах (3600 секунд = 60 минут): "
timeout.exe /t %seconds% /nobreak
rundll32.exe powrprof.dll SetSuspendState Sleep
echo.

exit