cls
@echo off
chcp 1251 >nul
title Отключение "Центра обновлений Windows"

echo Выполняется отключение "Центра обновлений Windows" и автообновлений Windows:

echo Выполняется отключение службы "Служба Medic центра обновления Windows":
sc stop WaaSMedicSvc
sc config WaaSMedicSvc start=disabled
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WaaSMedicSv" /v "Start" /t "REG_DWORD" /d "0x00000004" /f
echo.

echo Выполняется отключение службы "Служба Центр обновления Windows":
sc stop wuauserv
sc config wuauserv start=disabled
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableWindowsUpdateAccess" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoWindowsUpdate" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v "AUOptions" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv" /v "Start" /t "Start" /d "0x00000004" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Internet Communication Management\Internet Communication" /v "DisableWindowsUpdateAccess" /t "REG_DWORD" /d "0x00000001" /f
echo.

pause