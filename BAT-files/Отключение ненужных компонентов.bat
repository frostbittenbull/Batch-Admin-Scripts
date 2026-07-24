cls
@echo off
chcp 1251 >nul
title Включение нужных и отключение ненужных компонентов Windows:

echo Выполняется включение нужных компонентов Windows:

echo Выполняется включение компонента "Клиент Telnet":
dism /online /enable-feature /featurename:TelnetClient /norestart
echo.

echo Выполняется отключение ненужных компонентов Windows:

echo Выполняется отключение компонента "Internet Explorer 11":
dism /online /disable-feature /featurename:Internet-Explorer-Optional-amd64 /norestart
echo.

echo Выполняется отключение компонента "Hyper V":
dism /online /disable-feature /featurename:Microsoft-Hyper-V-All /norestart
dism /online /disable-feature /featurename:Microsoft-Hyper-V-Hypervisor /norestart
echo.

echo Выполняется отключение компонента "Печать в PDF (Майкрософт)":
dism /online /disable-feature /featurename:Printing-PrintToPDFServices-Features /norestart
echo.

echo Выполняется отключение компонента "Проигрыватель Windows Media Player":
dism /online /disable-feature /featurename:WindowsMediaPlayer /norestart
echo.

pause