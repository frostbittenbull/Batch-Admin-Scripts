cls
@echo off
chcp 1251 >nul
title Отключение телеметрии

echo Выполняется полное отключение телеметрии:

echo Выполняется блокировка основной телеметрии:
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение рекламного идентификатора (Advertising ID):
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение телеметрии приложений (AIT) и сборщика инвентаря:
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение сбора данных о рукописном вводе и печати:
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "AllowInputPersonalization" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется тключение отчетов об ошибках Windows (WER):
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение служб телеметрии:

echo Выполняется отключение службы "Функциональные возможности для подключенных пользователей и телеметрия" (это один из пунктов, чтобы отключить слежку Windows 10):
sc stop DiagTrack
sc config DiagTrack start=disabled
echo.

echo Выполняется отключение службы "Служба маршрутизации push-сообщений WAP (Wireless Application Protocol/Dmwappushservice)":
sc stop dmwappushsvc
sc config dmwappushsvc start=disabled
echo.

echo Выполняется отключение службы "Служба регистрации ошибок Windows":
sc stop WerSvc
sc config WerSvc start=disabled
echo.

echo Отключение задач сбора данных в планировщике

echo Выполняется отключение задач "Application Experience":
schtasks /change /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable
schtasks /change /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /disable
schtasks /change /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /disable
echo.

echo Выполняется отключение задач "Customer Experience Improvement Program (CEIP)":
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /disable
echo.

echo Выполняется отключение задач диагностики дисков и памяти (отправка отчетов):
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /disable
schtasks /change /tn "\Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents" /disable
echo.

pause