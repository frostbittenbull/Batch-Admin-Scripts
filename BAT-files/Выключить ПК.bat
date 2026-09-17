cls
@echo off
chcp 1251 >nul
title Выключение компьютера

echo Выполняется включение таймаута выключения компьютера:
set /p seconds="Введите время до выключения в секундах (3600 секунд = 60 минут): "
shutdown /s /t %seconds%
echo Компьютер выключится через %seconds% секунд.
echo.

pause