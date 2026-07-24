cls
@echo off
chcp 1251 >nul
title Очистка сетей

echo Выполняется удаление лишних сетей:
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Profiles" /f
echo.

pause