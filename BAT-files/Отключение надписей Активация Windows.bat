cls
@echo off
chcp 1251 >nul
title Отключение надписей "Активация Windows"

echo Выполняется отключение надписей "Активация Windows. Чтобы активировать Windows перейдите в раздел "Параметры"." и "Для персонализации компьютера нужно активировать Windows" даже если Windows не активирована:

echo Выполняется отключение службы "Быстрая проверка":
sc stop svsvc
sc config svsvc start=disabled
echo.

echo Выполняется отключение надписей "Активация Windows":
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform\Activation" /v "ActivationInterval" /t "REG_DWORD" /d "0x000dbba0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform\Activation" /v "Manual" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform\Activation" /v "NotificationDisabled" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform\Activation" /v "DownlevelActivation" /t "REG_DWORD" /d "0x00000002" /f
echo.

pause