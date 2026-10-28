cls
@echo off
chcp 1251 >nul
title Разблокировка иконок на панели "Ссылки" от SmartScreen

echo Выполняется разблокировка иконок на панели "Ссылки" от SmartScreen:
cd /d "%UserProfile%\Favorites\Ссылки"
icacls *.lnk /t /l /SetIntegrityLevel m
echo.

pause