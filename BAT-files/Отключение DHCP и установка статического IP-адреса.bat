cls
@echo off
chcp 1251 >nul
title Отключение DHCP и установка статического IP-адреса

echo Выполняется отключение APIPA:
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "IPAutoconfigurationEnabled" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение службы "DHCP Client":
sc stop Dhcp
sc config Dhcp start=disabled
echo.

echo Выполняется отключение экономии питания сетевого адаптера:
powershell -Command "Get-NetAdapter | ForEach-Object { $pnpid = $_.InterfaceDescription; Get-CimInstance -Namespace root\wmi -ClassName MSPower_DeviceEnable -Filter \"InstanceName LIKE '%$pnpid%'\" | ForEach-Object { $_.Enable = $false; Set-CimInstance -InputObject $_ } }"
echo.

echo Выполняется настройка ожидангие сети Windows при старте:
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "SyncForegroundPolicy" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется настройка статического IP-адреса:
echo Список сетевых интерфейсов:
netsh interface show interface
set /p IFNAME="Введите имя интерфейса как указано выше (interface Name): "
set /p IP="Введите нужный IP-адрес (например, 192.168.1.100): "
set /p MASK="Введите маску подсети (например, 255.255.255.0): "
set /p GW="Введите шлюз (или оставь пустым): "

if "%GW%"=="" (
    netsh interface ip set address name="%IFNAME%" static %IP% %MASK%
) else (
    netsh interface ip set address name="%IFNAME%" static %IP% %MASK% %GW%
)
echo.

echo Выполняется проверка настройки статического IP-адреса:
if %errorlevel%==0 (
    echo.
    echo ✅ IP-адрес успешно установлен на %IFNAME%
    echo IP: %IP%
    echo Маска: %MASK%
    if not "%GW%"=="" echo Шлюз: %GW%
) else (
    echo.
    echo ❌ Ошибка при установке IP! Проверьте имя интерфейса и параметры.
)
echo.

pause