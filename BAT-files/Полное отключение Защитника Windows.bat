cls
@echo off
chcp 1251 >nul
title Полное отключение "Защитника Windows"

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo %red%Пожалуйста, запустите данный BAT-файл от имени Администратора.%reset%
    pause
    exit /b
)

echo Выполняется отключение "Защитника Windows" (Windows Defender) и его служб:

echo Выполняется глубокое отключение через PowerShell (Сетевая защита, проверки скриптов, папки):
powershell -Command "Set-MpPreference -DisableArchiveScanning $true -DisableBlockAtFirstSeen $true -DisableCatchupFullScan $true -DisableCatchupQuickScan $true -DisableIntrusionPreventionSystem $true -DisableIOAVProtection $true -DisablePrivacyMode $true -DisableRemovableDriveScanning $true -DisableRestorePoint $true -DisableScanningMappedNetworkDrivesForFullScan $true -DisableScanningNetworkFiles $true -DisableScriptScanning $true -EnableControlledFolderAccess Disabled -EnableNetworkProtection Disabled -SubmitSamplesConsent NeverSend" >nul 2>&1
echo.

echo Выполняется отключение проверки "Защиты от подделки" (Tamper Protection):
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Features" /v "TamperProtection" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение "Защитника Windows" (Windows Defender):
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение драйвера "Защитника Windows":
sc stop WdBoot
sc config WdBoot start=disabled
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdBoot" /v "Start" /t "REG_DWORD" /d "0x00000004" /f
echo.

echo Выполняется отключение запуска службы защиты от вредоносных программ:
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft" /v "AllowFastServiceStartup" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft" /v "AllowServiceStartup" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "AllowFastServiceStartup" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "AllowServiceStartup" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение постоянной работу службы:
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "AllowPersistentService" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft" /v "AllowPersistentService" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение защиты в реальном времени:
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение проверки загружаемых файлов:
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Policy Manager" /v "DisableIOAVProtection" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение отправки образцов «MAPS»
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "DisableBlockAtFirstSeen" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "LocalSettingOverrideSpynetReporting" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SpynetReporting" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t "REG_DWORD" /d "0x00000002" /f
echo.

echo Выполняется отключение службы инспекции сети:
sc stop WdNisSvc
sc config WdNisSvc start=disabled
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdNisSvc" /v "Start" /t "REG_DWORD" /d "0x00000004" /f
echo.

echo Выполняется отключение службы "Антивирусная программа Защитника Windows":
sc stop WinDefend
sc config WinDefend start=disabled
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinDefend" /v "Start" /t "REG_DWORD" /d "0x00000004" /f
echo.

echo Выполняется отключение "Exploit Guard" и "Network Protection":
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection" /v "EnableNetworkProtection" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access" /v "EnableControlledFolderAccess" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR" /v "ExploitGuard_EnableASR" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение автоматических действий и обновлений "Защитника Windows":
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates" /v "ForceUpdateFromMU" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates" /v "UpdateOnStartUp" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение Центра безопасности (Security Center):
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center" /v "AntiVirusDisableNotify" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center" /v "UpdatesDisableNotify" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center" /v "UacDisableNotify" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется блокировка запуска интерфейса "Защитника Windows" (AppLocker/DisallowRun):
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisallowRun" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /v "1" /t "REG_SZ" /d "SecHealthUI.exe" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /v "2" /t "REG_SZ" /d "MSASCuiL.exe" /f
echo.

echo Выполняется скрытие страницы "Защитника Windows" в Параметрах Windows 10/11:
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Systray" /v "HideSystray" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Account protection" /v "UILockdown" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\App and Browser protection" /v "UILockdown" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Device security" /v "UILockdown" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Family options" /v "UILockdown" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Firewall and network protection" /v "UILockdown" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Virus and threat protection" /v "UILockdown" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется блокировка запуска исполняемых файлов "Защитника Windows" через "IFEO" (Image File Execution Options):
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MsMpEng.exe" /v "Debugger" /t "REG_SZ" /d "%windir%\System32\rundll32.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MpCmdRun.exe" /v "Debugger" /t "REG_SZ" /d "%windir%\System32\rundll32.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\NisSrv.exe" /v "Debugger" /t "REG_SZ" /d "%windir%\System32\rundll32.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SecHealthUI.exe" /v "Debugger" /t "REG_SZ" /d "%windir%\System32\rundll32.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\smartscreen.exe" /v "Debugger" /t "REG_SZ" /d "%windir%\System32\rundll32.exe" /f
echo.

echo Выполняется отключение служб "Defender ATP", "System Guard" и скрытых сетевых драйверов:
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Sense" /v "Start" /t "REG_DWORD" /d "0x00000004" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SgrmBroker" /v "Start" /t "REG_DWORD" /d "0x00000004" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Advanced Threat Protection" /v "ForceDefenderPassiveMode" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение службы "Windows Defender Network Inspection System":
sc stop WdNisDrv
sc config WdNisDrv start=disabled
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdNisDrv" /v "Start" /t "REG_DWORD" /d "0x00000004" /f
echo.

echo Выполняется смена папок "Защитника Windows":
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v "InstallLocation" /t "REG_SZ" /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v "ProductAppDataPath" /t "REG_SZ" /d "1" /f
echo.

echo Выполняется отключение уведомлений "Защитника Windows":
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\UX Configuration" /v "Notification_Suppress" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение службы "Брандмауэр Защитника Windows" (если вы не используете Брандмауэр Windows):
netsh advfirewall set allprofiles state off
sc stop mpssvc
sc config mpssvc start=disabled
echo.

echo Выполняется отключение службы "Центр обеспечения безопасности" (если вы не используете Брандмауэр Windows):
sc stop wscsvc
sc config wscsvc start=disabled
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wscsvc" /v "AllowTelemetry" /t "REG_DWORD" /d "0x00000004" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wscsvc" /v "Start" /t "REG_DWORD" /d "0x00000004" /f
echo.

echo Выполняется удаление заданий планировщика "Защитника Windows":
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Verification" /Disable
echo.

echo Выполняется отключение журналов событий "Защитника Windows" (Event Log):
wevtutil sl "Microsoft-Windows-Windows Defender/Operational" /e:false
wevtutil sl "Microsoft-Windows-Windows Defender/WHC" /e:false
echo.

echo Выполняется отключение изоляции ядра (VBS):
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t "REG_DWORD" /d "0x00000000" /f

echo Выполняется отключение "Интеллектуального управления приложениями" (Smart App Control):
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI\Policy" /v "VerifiedAndReputablePolicyState" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется выгрузка драйвера мини-фильтра Защитника из оперативной памяти:
fltmc unload WdFilter
echo.

echo Выполняется отключение драйвера фильтра файловой системы (Облачная защита/WdFilter):
sc stop WdFilter
sc config WdFilter start=disabled
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdFilter" /v "Start" /t "REG_DWORD" /d "0x00000004" /f
echo.

echo Выполняется отключение службы "Security Health Service":
sc stop SecurityHealthService
sc config SecurityHealthService start=disabled
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t "REG_DWORD" /d "0x00000004" /f
echo.

echo Выполняется отключение автоматического обновления подписей:
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates" /v "ASuSUpdateOrder" /t "REG_SZ" /d "" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates" /v "DefinitionUpdateFileSharesSources" /t "REG_SZ" /d "" /f
echo.

echo Выполняется отключение контролируемого доступа к папкам:
powershell -Command "Set-MpPreference -EnableControlledFolderAccess Disabled"
echo.

echo Выполняется отключение анти-фишинга в поиске (Windows Search):
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "SafeSearch" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется подавление интерфейса первого запуска безопасности(First Run Customization):
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\SecondaryUX" /v "DisableSecondaryUX" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение "Службы отчетов об ошибках" (Windows Error Reporting):
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение фильтра "SmartScreen" "Защитника Windows" (Windows Defender):
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t "REG_SZ" /d "Off" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SmartScreenEnabled" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение фильтра "SmartScreen" для приложений из Store (AppX):
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableBHO" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\PhishingFilter" /v "EnabledV9" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение надоедливого предупреждения при запуске исполняемых файлов скачанных с интернета (запуск программ и небезопасных файлов):
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение надоедливого предупреждения при запуске определенных типов файлов скачанных с интернета (запуск программ и небезопасных файлов):
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\0" /v "1806" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1806" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1806" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\0" /v "1806" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Security" /v "DisableSecuritySettingsCheck" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется удаление пункта "Сканировать с помощью Windows Defender" из контекстного меню:
reg delete "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\EPP" /f
reg delete "HKEY_CLASSES_ROOT\Directory\shellex\ContextMenuHandlers\EPP" /f
reg delete "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\EPP" /f
reg delete "HKEY_CLASSES_ROOT\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}" /f
echo.

echo Выполняется отключение значка "Защитника Windows" (Windows Defender) из системного трея:
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Systray" /v "HideSystray" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется завершение активных процессов интерфейса безопасности:
taskkill /f /im MSASCuiL.exe /t >nul 2>&1
taskkill /f /im SecHealthUI.exe /t >nul 2>&1
taskkill /f /im smartscreen.exe /t >nul 2>&1
taskkill /f /im SecurityHealthSystray.exe /t >nul 2>&1
echo.

echo Выполняется удаление Центра безопасности из автозагрузки (Startup):
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "SecurityHealth" /f >nul 2>&1
echo.

echo Выполняется отключение службы Телеметрии (Connected User Experiences and Telemetry):
sc stop DiagTrack
sc config DiagTrack start=disabled
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется очистка временных папок "Защитника Windows":
del /q /s "%ProgramData%\Microsoft\Windows Defender\Scans\*"
del /q /s "%ProgramData%\Microsoft\Windows Defender\Network Inspection System\*"
echo.

echo Выполняется принудительное обновление групповых политик:
gpupdate /force
echo.

echo Выполняется перезагрузка компьютера:
shutdown /r /t 0
echo.

pause