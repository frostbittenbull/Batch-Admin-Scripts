cls
@echo off
chcp 1251 >nul
title Запуск Adobe Photoshop

echo Выполняется блокировка доступа в интернет программному обеспечению Adobe Photoshop:
netsh advfirewall firewall add rule name="BlockPhotoshopIn" dir=in action=block program="C:\Program Files\Adobe\Adobe Photoshop 2025\Photoshop.exe"
netsh advfirewall firewall add rule name="BlockPhotoshopOut" dir=out action=block program="C:\Program Files\Adobe\Adobe Photoshop 2025\Photoshop.exe"
echo.

echo Выполняется запуск программного обеспечения Adobe Photoshop:
::start /d "C:\Program Files\Adobe\Adobe Photoshop 2025" Photoshop.exe
start "" "C:\Program Files\Adobe\Adobe Photoshop 2025\Photoshop.exe"
echo.

echo Выполняется разблокировка доступа в интернет программному обеспечению Adobe Photoshop (через 20 секунд):
timeout.exe /t 20 /nobreak
netsh advfirewall firewall delete rule name="BlockPhotoshopIn"
netsh advfirewall firewall delete rule name="BlockPhotoshopOut"
echo.

exit