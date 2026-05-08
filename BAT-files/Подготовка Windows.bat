cls
@echo off
chcp 1251
title Подготовка Windows (применение твиков после установки Windows)
mode con:cols=150 lines=35
color 0a

echo Выполняется отключение ненужных служб:

echo Выполняется удаление встроенного браузера "Microsoft Edge":
for /f "delims=" %%i in ('dir /b /ad "C:\Program Files (x86)\Microsoft\Edge\Application" ^| findstr "^[0-9]"') do (
"C:\Program Files (x86)\Microsoft\Edge\Application\%%i\Installer\setup.exe" --uninstall --system-level --verbose-logging --force-uninstall
)
echo.

echo Выполняется отключение служб "Центра обновлений Windows" и автообновлений Windows (если вы не собираетесь в дальшейшем обновлять Windows):

echo Выполняется отключение службы "Служба Medic центра обновления Windows":
::sc stop WaaSMedicSvc
::sc config WaaSMedicSvc start=disabled
::reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WaaSMedicSv" /v "Start" /t "REG_DWORD" /d "0x00000004" /f
echo.

echo Выполняется отключение службы "Служба Центр обновления Windows":
::sc stop wuauserv
::sc config wuauserv start=disabled
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableWindowsUpdateAccess" /t "REG_DWORD" /d "0x00000001" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t "REG_DWORD" /d "0x00000001" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoWindowsUpdate" /t "REG_DWORD" /d "0x00000001" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v "AUOptions" /t "REG_DWORD" /d "0x00000001" /f
::reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv" /v "Start" /t "Start" /d "0x00000004" /f
::reg add "HKEY_LOCAL_MACHINE\SYSTEM\Internet Communication Management\Internet Communication" /v "DisableWindowsUpdateAccess" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение "Защитника Windows" (Windows Defender) и его служб:

echo Выполняется отключение "Защитника Windows" (Windows Defender):
::powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t "REG_DWORD" /d "0x00000001" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение запуска службы защиты от вредоносных программ:
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft" /v "AllowFastServiceStartup" /t "REG_DWORD" /d "0x00000000" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft" /v "AllowServiceStartup" /t "REG_DWORD" /d "0x00000000" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "AllowFastServiceStartup" /t "REG_DWORD" /d "0x00000000" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "AllowServiceStartup" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение постоянной работу службы:
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "AllowPersistentService" /t "REG_DWORD" /d "0x00000000" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft" /v "AllowPersistentService" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение защиты в реальном времени:
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t "REG_DWORD" /d "0x00000001" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t "REG_DWORD" /d "0x00000001" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t "REG_DWORD" /d "0x00000001" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение проверки загружаемых файлов:
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /t "REG_DWORD" /d "0x00000001" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Policy Manager" /v "DisableIOAVProtection" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение отправки образцов «MAPS»
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "DisableBlockAtFirstSeen" /t "REG_DWORD" /d "0x00000001" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "LocalSettingOverrideSpynetReporting" /t "REG_DWORD" /d "0x00000000" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SpynetReporting" /t "REG_DWORD" /d "0x00000000" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t "REG_DWORD" /d "0x00000002" /f
echo.

echo Выполняется отключение службы "Служба антивирусной программы Microsoft Defender"
::sc stop WinDefend
::sc config WinDefend start=disabled
::reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t "REG_DWORD" /d "0x00000004" /f
::reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinDefend" /v "Start" /t "REG_DWORD" /d "0x00000004" /f
::reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wscsvc" /v "AllowTelemetry" /t "REG_DWORD" /d "0x00000004" /f
::reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wscsvc" /v "Start" /t "REG_DWORD" /d "0x00000004" /f
echo.

echo Выполняется смена папок "Защитника Windows"
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v "InstallLocation" /t "REG_SZ" /d "1" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v "ProductAppDataPath" /t "REG_SZ" /d "1" /f
echo.

echo Выполняется отключение уведомлений "Защитника Windows"
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\UX Configuration" /v "Notification_Suppress" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение службы "Брандмауэр Защитника Windows" (если вы не используете Брандмауэр Windows):
::sc stop mpssvc
::sc config mpssvc start=disabled
echo.

echo Выполняется отключение службы "Центр обеспечения безопасности" (если вы не используете Брандмауэр Windows):
::sc stop wscsvc
::sc config wscsvc start=disabled
echo.

echo Выполняется отключение фильтра "SmartScreen" "Защитника Windows" (Windows Defender):
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t "REG_SZ" /d "Off" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение надоедливого предупреждения при запуске исполняемых файлов скачанных с интернета (запуск программ и небезопасных файлов):
::reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение надоедливого предупреждения при запуске определенных типов файлов скачанных с интернета (запуск программ и небезопасных файлов):
::reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\0" /v "1806" /t "REG_DWORD" /d "0x00000000" /f
::reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1806" /t "REG_DWORD" /d "0x00000000" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1806" /t "REG_DWORD" /d "0x00000000" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Lockdown_Zones\0" /v "1806" /t "REG_DWORD" /d "0x00000000" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Security" /v "DisableSecuritySettingsCheck" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение значка "Защитника Windows" (Windows Defender) из системного трея:
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Systray" /v "HideSystray" /t "REG_DWORD" /d "0x00000001" /f
echo.

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

echo Выполняется отключение служб "BitLocker":

echo Выполняется отключение автоматического шифрования конкретных томов дисков:
manage-bde -off C:
manage-bde -off D:
manage-bde -off E:
echo.

echo Выполняется отключение службы "Служба шифрования дисков BitLocker":
sc stop BDESVC
sc config BDESVC start=disabled
echo.

echo Выполняется отключение автоматического шифрования дисков "BitLocker" при установке Windows:
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\BitLocker" /v "PreventDeviceEncryption" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется удаление пунктов "BitLocker" из контекстного меню запоминающих устройств:
reg delete "HKEY_CLASSES_ROOT\Drive\shell\encrypt-bde" /f
reg delete "HKEY_CLASSES_ROOT\Drive\shell\encrypt-bde-elev" /f
reg delete "HKEY_CLASSES_ROOT\Drive\shell\manage-bde" /f
reg delete "HKEY_CLASSES_ROOT\Drive\shell\resume-bde" /f
reg delete "HKEY_CLASSES_ROOT\Drive\shell\resume-bde-elev" /f
reg delete "HKEY_CLASSES_ROOT\Drive\shell\unlock-bde" /f
echo.

echo Выполняется отключение служб "Hyper-V":

echo Выполняется отключение компонента "Hyper-V"
dism /online /disable-feature /featurename:Microsoft-Hyper-V-All /norestart
dism /online /disable-feature /featurename:Microsoft-Hyper-V-Hypervisor /norestart
bcdedit /set hypervisorlaunchtype off

echo Выполняется отключение службы "Служба виртуализации удаленных рабочих столов Hyper-V":
sc stop vmicrdv
sc config vmicrdv start=disabled
echo.

echo Выполняется отключение службы "Служба завершения работы в качестве гостя (Hyper-V)":
sc stop vmicshutdown
sc config vmicshutdown start=disabled
echo.

echo Выполняется отключение службы "Служба обмена данными (Hyper-V)":
sc stop vmickvpexchange
sc config vmickvpexchange start=disabled
echo.

echo Выполняется отключение службы "Служба пульса (Hyper-V)":
sc stop vmicheartbeat
sc config vmicheartbeat start=disabled
echo.

echo Выполняется отключение службы "Служба сеансов виртуальных машин Hyper-V":
sc stop vmms
sc config vmms start=disabled
echo.

echo Выполняется отключение службы "Служба синхронизации времени Hyper-V":
sc stop vmictimesync
sc config vmictimesync start=disabled
echo.

echo Выполняется отключение остальных ненужных служб:

echo Выполняется отключение службы "SysMain" (бывший Superfetch):
sc stop SysMain
sc config SysMain start=disabled
echo.

echo Выполняется отключение службы "Xbox Accessory Management Service":
::sc stop XboxGipSvc
::sc config XboxGipSvc start=disabled
echo.

echo Выполняется отключение службы "Windows Search" (служба индексирования файлов):
sc stop WSearch
sc config WSearch start=disabled
echo.

echo Выполняется отключение службы "Биометрическая служба Windows" (если вы не используете отпечаток пальца для входа в систему):
sc stop WbioSrvc
sc config WbioSrvc start=disabled
echo.

echo Выполняется отключение службы "Браузер компьютеров":
sc stop Browser
sc config Browser start=disabled
echo.

echo Выполняется отключение службы "Вспомогательная служба IP (IP Helper)" (если вы не используете IPv6):
sc stop iphlpsvc
sc config iphlpsvc start=disabled
echo.

echo Выполняется отключение службы "Вторичный вход в систему" (если вы его не используете):
sc stop seclogon
sc config seclogon start=disabled
echo.

echo Выполняется отключение службы "Диспетчер печати" (если вы не используете функции печати, в том числе встроенную в Windows 10 печать в PDF):
::sc stop Spooler
::sc config Spooler start=disabled
echo.

echo Выполняется отключение службы "Диспетчер скачанных карт":
sc stop MapsBroker
sc config MapsBroker start=disabled
echo.

echo Выполняется отключение службы "Клиент отслеживания изменившихся связей":
sc stop TrkWks
sc config TrkWks start=disabled
echo.

echo Выполняется отключение службы "Модуль поддержки NetBIOS через TCP/IP":
sc stop lmhosts
sc config lmhosts start=disabled
echo.

echo Выполняется отключение службы "Общий доступ к подключению к Интернету (ICS)" (если вы не используете функции общего доступа к Интернету, например, для раздачи Wi-Fi с ноутбука/Мобильный хот-спот):
::sc stop SharedAccess
::sc config SharedAccess start=disabled
echo.

echo Выполняется отключение службы "Рабочие папки":
sc stop workfolderssvc
sc config workfolderssvc start=disabled
echo.

echo Выполняется отключение службы "Родительский контроль":
sc stop WpcMonSvc
sc config WpcMonSvc start=disabled
echo.

echo Выполняется отключение службы "Сетевая служба Xbox Live":
::sc stop XboxNetApiSvc
::sc config XboxNetApiSvc start=disabled
echo.

echo Выполняется отключение службы "Сетевой вход в систему" (если компьютер не подключён к доменной сети):
sc stop Netlogon
sc config Netlogon start=disabled
echo.

echo Выполняется отключение службы "Служба географического положения":
sc stop lfsvc
sc config lfsvc start=disabled
echo.

echo Выполняется отключение службы "Служба данных датчиков":
sc stop SensorDataService
sc config SensorDataService start=disabled
echo.

echo Выполняется отключение службы "Служба датчиков":
sc stop SensorService
sc config SensorService start=disabled
echo.

echo Выполняется отключение службы "Служба загрузки изображений Windows (WIA)" (если у вас нет сканера):
sc stop stisvc
sc config stisvc start=disabled
echo.

echo Выполняется отключение службы "Служба лицензий клиента (ClipSVC)" (после отключения могут неправильно работать приложения магазина Windows 10):
::sc stop ClipSVC
::sc config ClipSVC start=disabled
echo.

echo Выполняется отключение службы "Служба маршрутизатора AllJoyn":
sc stop AJRouter
sc config AJRouter start=disabled
echo.

echo Выполняется отключение службы "Служба наблюдения за датчиками":
sc stop SensrSvc
sc config SensrSvc start=disabled
echo.

echo Выполняется отключение службы "Служба общего доступа к портам Net.Tcp":
sc stop NetTcpPortSharing
sc config NetTcpPortSharing start=disabled
echo.

echo Выполняется отключение службы "Служба поддержки Bluetooth" (если вы не используете Bluetooth):
::sc stop bthserv
::sc config bthserv start=disabled
echo.

echo Выполняется отключение службы "Служба политики диагностики" (имейте в виду, что перестанет показывать процент нагрузки на сеть в "Диспетчере задач"):
::sc stop DPS
::sc config DPS start=disabled
echo.

echo Выполняется отключение службы "Служба помощника по совместимости программ":
sc stop PcaSvc
sc config PcaSvc start=disabled
echo.

echo Выполняется отключение службы "Служба сенсорной клавиатуры и панели рукописного ввода" (если вы не используете сенсорную клавиатуру):
::sc stop TabletInputService
::sc config TabletInputService start=disabled
echo.

echo Выполняется отключение службы "Удаленный реестр":
sc stop RemoteRegistry
sc config RemoteRegistry start=disabled
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RemoteRegistry" /v "Start" /t "REG_DWORD" /d "0x00000004" /f
echo.

echo Выполняется отключение службы "Удостоверение приложения":
sc stop AppIDSvc
sc config AppIDSvc start=disabled
echo.

echo Выполняется отключение службы "Факс":
sc stop Fax
sc config Fax start=disabled
echo.

echo Выполняется включение нужных компонентов Windows:

echo Выполняется включение компонента "Клиент Telnet":
::dism /online /enable-feature /featurename:TelnetClient /norestart
echo.

echo Выполняется отключение ненужных компонентов Windows:

echo Выполняется отключение компонента "Internet Explorer 11":
dism /online /disable-feature /featurename:Internet-Explorer-Optional-amd64 /norestart
echo.

echo Выполняется отключение компонента "Печать в PDF (Майкрософт)":
dism /online /disable-feature /featurename:Printing-PrintToPDFServices-Features /norestart
echo.

echo Выполняется отключение компонента "Проигрыватель Windows Media Player":
dism /online /disable-feature /featurename:WindowsMediaPlayer /norestart
echo.

echo Выполняется настройка производительности:

echo Выполняется отключение потокового ЦП:
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\kernel" /v "ThreadDpcEnable" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение состояния простоя ЦП (для тех, у кого компьютер работает круглосуточно):
::powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR IdleDisable 1
::powercfg /setactive SCHEME_CURRENT
::powercfg -attributes SUB_PROCESSOR 06cadf0e-64ed-448a-8927-ce7bf90eb35d -ATTRIB_HIDE
::powercfg -attributes SUB_PROCESSOR 12a0ab44-fe28-4fa9-b3bd-4b64f44960a6 -ATTRIB_HIDE
::powercfg -attributes SUB_PROCESSOR 0cc5b647-c1df-4637-891a-dec35c318583 -ATTRIB_HIDE
::powercfg -attributes SUB_PROCESSOR ea062031-0e34-4ff1-9b6d-eb1059334028 -ATTRIB_HIDE
::powercfg -attributes SUB_PROCESSOR 3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb -ATTRIB_HIDE
::powercfg -attributes SUB_PROCESSOR 465e1f50-b610-473a-ab58-00d1077dc418 -ATTRIB_HIDE
::powercfg -attributes SUB_PROCESSOR 40fbefc7-2e9d-4d25-a185-0cfd8574bac6 -ATTRIB_HIDE
::powercfg -attributes SUB_PROCESSOR 447235c7-6a8d-4cc0-8e24-9eaf70b96e2b -ATTRIB_HIDE
::powercfg -attributes SUB_PROCESSOR 45bcc044-d885-43e2-8605-ee0ec6e96b59 -ATTRIB_HIDE
::powercfg -attributes SUB_PROCESSOR 4b92d758-5a24-4851-a470-815d78aee119 -ATTRIB_HIDE
::powercfg -attributes SUB_PROCESSOR 619b7505-003b-4e82-b7a6-4dd29c300971 -ATTRIB_HIDE
::powercfg -attributes SUB_PROCESSOR c7be0679-2817-4d69-9d02-519a537ed0c6 -ATTRIB_HIDE
::powercfg -attributes SUB_PROCESSOR 7b224883-b3cc-4d79-819f-8374152cbe7c -ATTRIB_HIDE
::powercfg -attributes SUB_PROCESSOR be337238-0d82-4146-a960-4f3749d470c7 -ATTRIB_HIDE
::powercfg -attributes SUB_PROCESSOR e0007330-f589-42ed-a401-5ddb10e785d3 -ATTRIB_HIDE
::powercfg -attributes SUB_PROCESSOR 5d76a2ca-e8c0-402f-a133-2158492d58ad -ATTRIB_HIDE
echo.

echo Выполняется отключение автопоиска сетевых принтеров:
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RemoteComputer\NameSpace\{863aa9fd-42df-457b-8e4d-0de1b8015c60}" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\NcdAutoSetup\Private" /v "AutoSetup" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение службы "Superfetch":
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableBootTrace " /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher " /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch " /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение службы регулирования мощности (Power Throttling):
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение службы мультимедийного планировщика классов (Network Throttling Index):
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t "REG_DWORD" /d "0xffffffff" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение шкалы времени, которая записывает всю активность и все действия на компьютере:
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется настройка службы прерывания таймера системных часов:
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ8Priority" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется настройка службы прерывания таймера событий (HPET):
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "GlobalTimerResolutionRequests" /t "REG_DWORD" /d "0x00000001" /f
bcdedit /set disabledynamictick yes
bcdedit /set useplatformtick yes
bcdedit /set useplatformclock false
bcdedit /deletevalue useplatformclock
echo.

echo Выполняется настройка службы "Time Broker" (может повлиять на службу "Поиск"/исходное значение "0x00000003"):
::reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TimeBrokerSvc" /v "Start" /t "REG_DWORD" /d "0x00000004" /f
echo.

echo Выполняется отключение службы логирования "User Assist" и трассировки компонентов системы:
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\Settings" /v "NoLog" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\Settings" /v "Active" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется включение уменьшения времени ожидания отклика приложений при зависании:
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "AutoEndTasks" /t "REG_SZ" /d "1" /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "HungAppTimeout" /t "REG_SZ" /d "2000" /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t "REG_SZ" /d "2000" /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "WaitToKillServiceTimeout" /t "REG_SZ" /d "2000" /f
echo.

echo Выполняется настройка ускорения процесса завершения работы Windows:
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "AutoEndTasks" /t "REG_SZ" /d "2000" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "HungAppTimeout" /t "REG_SZ" /d "2000" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillAppTimeout" /t "REG_SZ" /d "2000" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t "REG_SZ" /d "2000" /f
echo.

echo Выполняется включение очищения файла подкачки при выключении компьютера (не включать если у вас SSD):
::reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение шифрования файловой системы:
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisableEncryption" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение сжатия файловой системы:
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisableCompression" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется включение повышения производительности NTFS (не включать если у вас SSD):
::reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisableLastAccessUpdate" /t "REG_DWORD" /d "0x00000001" /f
::reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisable8dot3NameCreation" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется включение выгрузки из памяти неиспользуемых DLL-библиотек (не включать если у вас ОЗУ более 2ГБ):
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "AlwaysUnloadDll" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется включение выгрузки из оперативной памяти коды ядра и драйверов (не включать если у вас ОЗУ более 2ГБ):
::reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t "REG_DWORD" /d "0x00000001" /f
::reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t "REG_DWORD" /d "0x00000001" /f
::reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "HeapDeCommitFreeBlockThreshold" /t "REG_DWORD" /d "0x00040000" /f
::reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /t "REG_DWORD" /d "0x80000000" /f\
echo.

echo Выполняется включение повышения приоритета активным приложениям (не включать если у вас ОЗУ более 2ГБ):
::reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t "REG_DWORD" /d "0x000000028" /f
echo.

echo Выполняется включение асинхронного применения групповой политики в целях ускорения загрузки Windows:
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "SynchronousUserGroupPolicy" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение фикса "Meltdown" и "Spectre":
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t "REG_DWORD" /d "0x00000003" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t "REG_DWORD" /d "0x00000003" /f
echo.

echo Выполняется включение планирования графического процессора с аппаратным ускорением в Windows:
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t "REG_DWORD" /d "0x00000002" /f
echo.

echo Выполняется настройка оптимизации во весь экран в играх:
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t "REG_DWORD" /d "0x00000000" /f
::reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t "REG_DWORD" /d "0x00000000" /f
::reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t "REG_DWORD" /d "0x00000000" /f
::reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_Enabled" /t "REG_DWORD" /d "0x00000000" /f
::reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t "REG_DWORD" /d "0x00000002" /f
::reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется настройка производительности в играх:
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t "REG_DWORD" /d "0x00000008" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t "REG_DWORD" /d "0x00000006" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t "REG_SZ" /d "High" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t "REG_SZ" /d "High" /f
echo.

echo Выполняется настройка параметров электропитания:

echo Выполняется настройка схемы управления питанием (Сбалансированная):
powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e
echo.

echo Выполняется включение пунктов "Минимальное состояние процессора" и "Максимальное состояние процессора" в дополнительных настройках схемы электропитания:
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c" /v "Attributes" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec" /v "Attributes" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется включение пункта "Время ожидания до отключения экрана блокировки консоли" в дополнительных настройках схемы электропитания:
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\8EC4B3A5-6868-48c2-BE75-4F3044BE88A7" /v "Attributes" /t "REG_DWORD" /d "0x00000002" /f
echo.

echo Выполняется настройка отключения экрана при питании от сети (5 минут):
powercfg /change monitor-timeout-ac 5
echo.

echo Выполняется настройка отключения экрана при питании от батареи (для тех, у кого ноутбук/5 минут):
::powercfg /change monitor-timeout-dc 5
echo.

echo Выполняется настройка перехода в спящий режим при питании от сети (никогда):
powercfg /change standby-timeout-ac 0
echo.

echo Выполняется настройка перехода в спящий режим при питании от батареи (для тех, у кого ноутбук/никогда):
::powercfg /change standby-timeout-dc 0
echo.

echo Выполняется отключение заставки:
reg delete "HKEY_CURRENT_USER\Control Panel\Desktop" /v "SCRNSAVE.EXE" /f
echo.

echo Выполняется настройка интервала заставки (5 минут):
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "ScreenSaveTimeOut" /t "REG_SZ" /d "300" /f
echo.

echo Выполняется включение требования входа в систуму при выходе из заставки:
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "ScreenSaverIsSecure" /t "REG_SZ" /d "1" /f
echo.

echo Выполняется настройка параметров быстродействия (Визуальные эффекты):

echo Выполняется отключение всех функций визуальных эффектов:
::reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t "REG_DWORD" /d "0x00000002" /f
echo.

echo Выполняется отключение всех функций визуальных эффектов кроме "Вывод эскизов вместо значков" и "Сглаживание неровностей экранных шрифтов":
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t "REG_DWORD" /d "0x00000003" /f
echo.

echo Выполняется отключение функции "Анимация на панели задач":
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение функции "Анимация окон при свертывании и развертывании":
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t "REG_SZ" /d "0" /f
echo.

echo Выполняется отключение функции "Анимированные элементы управления и элементы внутри окна" (9efe078012000000-9efe078010000000):
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /t "REG_BINARY" /d "9efe078010000000" /f
echo.

echo Выполняется отключение функции "Включение Peek":
reg add "Компьютер\Компьютер\HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется включение функции "Вывод эскизов вместо значков":
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение функции "Гладкое прокручивание списков" (9efe078012000000-96fe078012000000):
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /t "REG_BINARY" /d "96fe078010000000" /f
echo.

echo Выполняется отключение функции "Затухание меню после вызова команды" (9efe078012000000-9efa078012000000):
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /t "REG_BINARY" /d "96fa078010000000" /f
echo.

echo Выполняется отключение функции "Отбрасывание теней значками на рабочем столе":
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение функции "Отображение прозрачного прямоугольника выделения":
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение функции "Отображения содержимого окна при перетаскивании":
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "DragFullWindows" /t "REG_SZ" /d "0" /f
echo.

echo Выполняется отключение функции "Отображение теней, отбрасываемых окнами" (9efe078012000000-9efe038012000000):
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /t "REG_BINARY" /d "96fa038010000000" /f
echo.

echo Выполняется отключение функции "Отображение тени под указателем мыши" (9efe078012000000-9ede078012000000):
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /t "REG_BINARY" /d "96da038010000000" /f
echo.

echo Выполняется включение функции "Сглаживание неровностей экранных шрифтов":
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "FontSmoothing" /t "REG_SZ" /d "2" /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "FontSmoothingGamma" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "FontSmoothingOrientation" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "FontSmoothingType" /t "REG_DWORD" /d "0x00000002" /f
::reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "CTTuneMakeSettingsDefault" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение функции "Скольжение при раскрытии списков" (9efe078012000000-9afe078012000000):
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /t "REG_BINARY" /d "92da038010000000" /f
echo.

echo Выполняется отключение функции "Сохранение вида эскизов панели задач":
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\DWM" /v "AlwaysHibernateThumbnails" /t "REG_DWORD" /d "0x00000001" /f
::reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LastActiveClick" /t "REG_DWORD" /d "0x00000001" /f
::reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisablePreviewDesktop" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение функции "Эффекты затухания или скольжения при обращении к меню" (9efe078012000000-9cfe078012000000):
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /t "REG_BINARY" /d "90da038010000000" /f
echo.

echo Выполняется отключение функции "Эффекты затухания или скольжения при появлении подсказок" (9efe078012000000-9ef6078012000000):
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /t "REG_BINARY" /d "90d2038010000000" /f
echo.

echo Выполняется корректировка системных настроек Windows:

echo Выполняется отключение гибернации и режима однократной гибернации:
powercfg -h off
del /q C:\hiberfil.sys
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение контроля учетных записей (UAC):
::reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "EnableLUA" /t "REG_DWORD" /d "0x00000001" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableVirtualization" /t "REG_DWORD" /d "0x00000000" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t "REG_DWORD" /d "0x00000000" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t "REG_DWORD" /d "0x00000000" /f
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorUser" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение автоматического поиска и установки драйверов при подключении нового устройства:
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется включение "SMB протокола" и сервера "Lanman" (для тех, кто не может получить доступ к папке с общим доступом):
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "AllowInsecureGuestAuth" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation" /v "AllowInsecureGuestAuth" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется устранение проблем с раздачей принтеров (распространенная ошибка "0x0000011b"):
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print" /v "RpcAuthnLevelPrivacyEnabled" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint" /v "RestrictDriverInstallationToAdministrators" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется устранение распространенной ошибки "Операция не была успешно завершена, так как файл содержит вирус":
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "ScanWithAntiVirus" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется включение пункта "Фоновые приложения" в параметрах конфиденциальности Windows:
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется включение автоматической директории "Рабочий стол" у командной строки:
::reg add "HKEY_CURRENT_USER\Software\Microsoft\Command Processor" /v "AutoRun" /t "REG_EXPAND_SZ" /d "cd /d %UserProfile%\Desktop" /f
echo.

echo Выполняется отключение истории поиска "Проводника Windows":
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение залипания клавиш:
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\StickyKeys" /v "Flags" /t "REG_SZ" /d "506" /f
reg add "HKEY_USERS\.DEFAULT\Control Panel\Accessibility\StickyKeys" /v "Flags" /t "REG_SZ" /d "506" /f
echo.

echo Выполняется снятие ограничения Windows на длину пути (260 символов, заданные в MAX_PATH):
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется автоматическое включение "NumLock" при загрузке Windows:
reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t "REG_SZ" /d "80000002" /f
echo.

echo Выполняется автоматическое включение "NumLock" при загрузке Windows (альтернативный метод для Windows 7, 8 и первых версий 10/если первый не помог):
::reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t "REG_SZ" /d "2147483650" /f
echo.

echo Выполняется отключение открытия окна "Сообщество службы поддержки Microsoft" при нажатии клавижу "F1":
reg add "HKEY_CURRENT_USER\Software\Classes\TypeLib\{8cec5860-07a1-11d9-b15e-000d56bfe6ee}\1.0\0\win32" /ve /t "REG_SZ" /f
reg add "HKEY_CURRENT_USER\Software\Classes\TypeLib\{8cec5860-07a1-11d9-b15e-000d56bfe6ee}\1.0\0\win64" /ve /t "REG_SZ" /f
echo.

echo Выполняется отключение сообщений о нехватке места на дисках:
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoLowDiscSpaceChecks" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется исправление отображения кириллицы:
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Nls\CodePage" /v "ACP" /t "REG_SZ" /d "1251" /f
echo.

echo Выполняется исправление отображения кириллицы (альтернативный метод/если первый не помог):
::reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Nls\CodePage" /v "1252" /t "REG_SZ" /d "c_1251.nls" /f
echo.

echo Выполняется отключение требования ввода пароля пользователя при включении компьютера:
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PasswordLess\Device" /v "DevicePasswordLessBuildVersion" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение автозапуска для CD/DVD дисков:
::reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\cdrom" /v "AutoRun" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется удаление виртуальных принтеров созданных при установке Windows:
::wmic printer get name
printui.exe /dl /n "Microsoft XPS Document Writer"
printui.exe /dl /n "Microsoft Print to PDF"
printui.exe /dl /n "Fax"
echo.

echo Выполняется настройка персонализации Windows:

echo Выполняется перемещение папки "Загрузки" на локальный диск "D":
::reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t "REG_SZ" /d "D:\Downloads" /f
::reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t "REG_SZ" /d "D:\Downloads" /f
::reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{7D83EE9B-2244-4E70-B1F5-5393042AF1E4}" /t "REG_SZ" /d "D:\Downloads" /f
echo.

echo Выполняется перемещение папки "Музыка" на локальный диск "D":
::reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Music" /t "REG_SZ" /d "D:\Music" /f
::reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Music" /t "REG_SZ" /d "D:\Music" /f
echo.

echo Выполняется применение темного цвета Windows (для тех, кто использует темную тему Windows):
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется смена главного темного цвета (для тех, кто использует темную тему Windows):
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v "AlwaysHibernateThumbnails" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v "ColorizationAfterglow" /t "REG_DWORD" /d "0xc4000000" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v "ColorizationAfterglowBalance" /t "REG_DWORD" /d "0x0000000a" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v "ColorizationBlurBalance" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v "ColorizationColor" /t "REG_DWORD" /d "0xc4000000" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v "ColorizationColorBalance" /t "REG_DWORD" /d "0x00000059" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v "ColorizationGlassAttribute" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v "Composition" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется применение нормального темного цвета в активных и неактивных заголовках окон (для тех, кто использует темную тему Windows):
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t "REG_DWORD" /d "0xff000000" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v "AccentColor" /t "REG_DWORD" /d "0xff000000" /f
::reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v "AccentColor" /t "REG_DWORD" /d "0x00191919" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v "AccentColorInactive" /t "REG_DWORD" /d "0x00545454" /f
echo.

echo Выполняется включение отображения цвета в заголовках и границах окон:
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v "ColorPrevalence" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v "EnableWindowColorization" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется изменение цвета выделения из стандартного синего (#0078d7) в приятный серый (#626262):
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "Hilight" /t "REG_SZ" /d "98 98 98" /f
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v "HotTrackingColor" /t "REG_SZ" /d "98 98 98" /f
echo.

echo Выполняется применение нормального размера значков на рабочем столе:
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\Bags\1\Desktop" /v "IconSize" /t "REG_DWORD" /d "0x00000020" /f
echo.

echo Выполняется добавление значка "Этот компьютер" на рабочий стол вместо ярлыка:
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется удаление префикса "Ярлык для…" и постфикса "…— Ярлык":
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "link" /t "REG_BINARY" /d "00000000" /f
echo.

echo Выполняется удаление префикса "Ярлык для…" и постфикса "…— Ярлык" (альтернативный метод/если первый не помог):
::reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates" /v "ShortcutNameTemplate" /t "REG_SZ" /d "\"%%s.lnk\"" /f
echo.

echo Выполняется удаление стрелок с ярлыков (имейте в виду, что перестанет открываться "Управление" из контекстного меню "Этот компьютер"):
::reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\lnkfile" /v "IsShortcut" /f
echo.

echo Выполняется удаление стрелок с ярлыков (альтернативный метод/если первый не помог):
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v "29" /t "REG_SZ" /d "%%WinDir%%\System32\shell32.dll,-50" /f
echo.

echo Выполняется удаление стрелок с ярлыков (альтернативный метод/если второй не помог):
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v "29" /t "REG_SZ" /d "%%WinDir%%\System32\imageres.dll,-17" /f
echo.

echo Выполняется отключение всплывающих подсказок для элементов рабочего стола:
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowInfoTip" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowInfoTip" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется применение короткой продолжительности показа всплывающих уведомлений в "Центре уведомлений Windows" (по умолчанию 5 секунд):
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility" /v "MessageDuration" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение миниатюр со значков папок/эскизов на значках папок:
::reg add "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v "Logo" /t "REG_SZ" /d "0" /f
::cd /d %LocalAppData%\
::attrib -h iconcache*.db
::attrib -h thumbcache*.db
::del /f iconcache*
::del /f thumbcache*
::cd /d %LocalAppData%\Microsoft\Windows\Explorer
::attrib -h iconcache*.db
::attrib -h thumbcache*.db
::del /f iconcache*
::del /f thumbcache*
echo.

echo Выполняется отключение "Lock Screen" (при блокировке будет отображаться только экран входа):
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v "NoLockScreen" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение обоев на экране входа (остается сплошной черный фон):
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "DisableLogonBackgroundImage" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение кэширования изображений:
::reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisableThumbailCache" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется настройка региональных стандартов, даты и времени:

echo Выполняются настройки часового пояса:
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" /v "ActiveTimeBias" /t "REG_DWORD" /d "0xfffffed4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" /v "Bias" /t "REG_DWORD" /d "0xfffffed4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" /v "DaylightBias" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" /v "DaylightName" /t "REG_SZ" /d "@tzres.dll,-481" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" /v "StandardName" /t "REG_SZ" /d "@tzres.dll,-482" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" /v "TimeZoneKeyName" /t "REG_SZ" /d "West Asia Standard Time" /f
echo.

echo Выполняется включение автоматической установки времени:
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\Parameters" /v "Type" /t "REG_SZ" /d "NTP" /f
echo.

echo Выполняется настройка краткого времени:
reg add "HKEY_CURRENT_USER\Control Panel\International" /v "sShortTime" /t "REG_SZ" /d "h:mm tt" /f
echo.

echo Выполняется настройка полного времени:
reg add "HKEY_CURRENT_USER\Control Panel\International" /v "sTimeFormat" /t "REG_SZ" /d "h:mm:ss" /f
echo.

echo Выполняется настройка обозначения времени до/после полудня:
reg add "HKEY_CURRENT_USER\Control Panel\International" /v "s1159" /t "REG_SZ" /d "AM" /f
reg add "HKEY_CURRENT_USER\Control Panel\International" /v "s2359" /t "REG_SZ" /d "PM" /f
echo.

echo Выполняется настройка меню "Пуск" и панели задач:

echo Выполняется отключение приложений-плиток (ярлыки на "Начальном экране"):
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoTileApplicationNotification" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется включение ускорения открытия меню "Пуск" и выпада подменю в контекстном меню:
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "MenuShowDelay" /t "REG_SZ" /d "0" /f
reg add "HKEY_USERS\S-1-5-19\Control Panel\Desktop" /v "MenuShowDelay" /t "REG_SZ" /d "0" /f
echo.

echo Выполняется отключение эффектов прозрачности меню "Пуск" и панели задач:
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t "REG_DWORD" /d "0x00000000" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "UseOLEDTaskbarTransparency" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Taskbar_Transparency" /f
echo.

echo Выполняется применение полностью прозрачной панели задач:
::reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t "REG_DWORD" /d "0x00000002" /f
::reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorPrevalence" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется применение закрепления панели задач:
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSizeMove" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется применение использования маленьких кнопок панели задач:
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSmallIcons" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение замены командной строки на "PowerShell":
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DontUsePowerShellOnWinX" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется скрытия строки поиска на панели задач:
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется скрытия кнопки "Просмотра задач" на панели задач:
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется скрытия панели "Люди" на панели задач:
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "HidePeopleBar" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется скрытия панели "Windows Ink Workspace" на "Панели задач:
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace" /v "AllowWindowsInkWorkspace" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение отображения цвета элементов в меню "Пуск", на панели задач и в центре уведомлений:
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorPrevalence" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется настройка "Проводника Windows":

echo Выполняется удаление лишних пунктов из панели навигации "Проводника Windows":

echo Выполняется удаление пункта "Библиотеки" из панели навигации "Проводника Windows":
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{031E4825-7B94-4dc3-B131-E946B44C8DD5}" /f
echo.

echo Выполняется удаление пункта "Сеть" из панели навигации "Проводника Windows":
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" /v "System.IsPinnedToNameSpaceTree" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder" /v "Attributes" /t "REG_DWORD" /d "0xb0940064" /f
reg add "HKEY_CLASSES_ROOT\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder" /v "Attributes" /t "REG_DWORD" /d "0xb0940064" /f
echo.

echo Выполняется удаление пункта "Быстрый доступ" из панели навигации "Проводника Windows":
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "HubMode" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется удаление вкладки "Доступ" в свойствах папок и файлов (помешает открыть "Общий доступ…", если компьютер доступен нежелательным лицам)
::reg delete "HKEY_CLASSES_ROOT\Directory\shellex\PropertySheetHandlers\Sharing" /f
echo.

echo Выполняется применение нормального размера и расположения окон "Проводника Windows" (для тех, у кого разрешение 1920x1080):
reg add "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v "WinPos1920x1080x96(1).bottom" /t "REG_DWORD" /d "0x00000325" /f
reg add "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v "WinPos1920x1080x96(1).left" /t "REG_DWORD" /d "0x00000055" /f
reg add "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v "WinPos1920x1080x96(1).right" /t "REG_DWORD" /d "0x0000068b" /f
reg add "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v "WinPos1920x1080x96(1).top" /t "REG_DWORD" /d "0x00000055" /f
echo.

echo Выполняется включение открытия "Этот компьютер" вместо "Быстрый доступ" при открытии "Проводника Windows":
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется уменьшение размера кнопок управления окном (свернуть, развернуть и закрыть):
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v "CaptionHeight" /t "REG_SZ" /d "-270" /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v "CaptionWidth" /t "REG_SZ" /d "-270" /f
echo.

echo Выполняется уменьшение скролл-бара (полосы прокрутки) в окнах "Проводника Windows":
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v "ScrollHeight" /t "REG_SZ" /d "-210" /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v "ScrollWidth" /t "REG_SZ" /d "-210" /f
echo.

echo Выполняется применение типа "Общие элементы" для всех папок в системе:
::reg add "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v "FolderType" /t "REG_SZ" /d "NotSpecified" /f
echo.

echo Выполняется удаление папок из "Этот компьютер":

echo Выполняется удаление папки "Объемные объекты":
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f
echo.

echo Выполняется удаление папки "Рабочий стол":
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /f
echo.

echo Выполняется удаление папки "Документы":
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" /f
echo.

echo Выполняется удаление папки "Загрузки":
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}" /f
echo.

echo Выполняется удаление папки "Музыка":
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" /f
echo.

echo Выполняется удаление папки "Изображения":
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" /f
echo.

echo Выполняется удаление папки "Видео":
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /f
echo.

echo Выполняется удаление лишних пунктов из контекстного меню:

echo Выполняется удаление щита из контекстного меню "Запуск от имени Администратора":
reg delete "HKEY_CLASSES_ROOT\batfile\shell\runas" /v "HasLUAShield" /f
reg delete "HKEY_CLASSES_ROOT\cmdfile\shell\runas" /v "HasLUAShield" /f
reg delete "HKEY_CLASSES_ROOT\cplfile\shell\runas" /v "HasLUAShield" /f
reg delete "HKEY_CLASSES_ROOT\exefile\shell\runas" /v "HasLUAShield" /f
reg delete "HKEY_CLASSES_ROOT\mscfile\shell\runas" /v "HasLUAShield"  /f
echo.

echo Выполняется удаление пункта "Сделать фоновым изображением рабочего стола":
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.bmp\Shell\setdesktopwallpaper" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.dib\Shell\setdesktopwallpaper" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.gif\Shell\setdesktopwallpaper" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.jfif\Shell\setdesktopwallpaper" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.jpe\Shell\setdesktopwallpaper" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.jpeg\Shell\setdesktopwallpaper" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.jpg\Shell\setdesktopwallpaper" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.png\Shell\setdesktopwallpaper" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.tif\Shell\setdesktopwallpaper" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.tiff\Shell\setdesktopwallpaper" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.wdp\Shell\setdesktopwallpaper" /f
echo.

echo Выполняется удаление пункта "Повернуть вправо/влево":
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.bmp\Shell\setdesktopwallpaper" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.bmp\ShellEx\ContextMenuHandlers\ShellImagePreview" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.dib\ShellEx\ContextMenuHandlers\ShellImagePreview" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.gif\ShellEx\ContextMenuHandlers\ShellImagePreview" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.jfif\ShellEx\ContextMenuHandlers\ShellImagePreview" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.jpe\ShellEx\ContextMenuHandlers\ShellImagePreview" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.jpeg\ShellEx\ContextMenuHandlers\ShellImagePreview" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.jpg\ShellEx\ContextMenuHandlers\ShellImagePreview" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.png\ShellEx\ContextMenuHandlers\ShellImagePreview" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.tif\ShellEx\ContextMenuHandlers\ShellImagePreview" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.tiff\ShellEx\ContextMenuHandlers\ShellImagePreview" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.wdp\ShellEx\ContextMenuHandlers\ShellImagePreview" /f
echo.

echo Выполняется удаление пункта "Устранение неполадок совместимости":
reg delete "HKEY_CLASSES_ROOT\exefile\shellex\ContextMenuHandlers\Compatibility" /f
reg delete "HKEY_CLASSES_ROOT\lnkfile\shellex\ContextMenuHandlers\Compatibility" /f
echo.

echo Выполняется удаление пункта "Открыть в новом окне" (имейте в виду, что перестанет открываться "Проводник Windows" из панели задач и по горячим клавишам "Win+E"):
::reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Folder\shell\opennewwindow" /f
echo.

echo Выполняется удаление пункта "Закрепить на панели быстрого доступа":
reg delete "HKEY_CLASSES_ROOT\Folder\shell\pintohome" /f
echo.

echo Выполняется удаление пункта "Закрепить на панели задач":
reg delete "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\{90AA3A4E-1CBA-4233-B8BB-535773D48449}" /f
echo.

echo Выполняется удаление пункта "Закрепить в пеню "Пуск"":
reg delete "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\{a2a9545d-a0c2-42b4-9708-a0b2badd77c8}" /f
echo.

echo Выполняется удаление пункта "Добавить в список воспроизведения проигрывателя Windows Media":
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\audio\shell\Enqueue" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\Directory.Audio\shell\Enqueue" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\Directory.Image\shell\Enqueue" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\Directory.Video\shell\Enqueue" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\video\shell\Enqueue" /f
echo.

echo Выполняется удаление пункта "Воспроизвести с помощью проигрывателя Windows Media":
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\audio\shell\Play" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\Directory.Audio\shell\Play" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\Directory.Image\shell\Play" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\Directory.Video\shell\Play" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\video\shell\Play" /f
echo.

echo Выполняется удаление пункта "Передать на устройство/Воспроизвести на устройстве":
::reg delete "HKEY_CLASSES_ROOT\CLSID\{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f
::reg delete "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f
echo.

echo Выполняется удаление пункта "Передать на устройство/Воспроизвести на устройстве" (альтернативный метод/если первый не помог):
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /t "REG_SZ" /f
echo.

echo Выполняется удаление пункта "Проверка с использованием Windows Defender…":
reg delete "HKEY_CLASSES_ROOT\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}" /f
reg delete "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\EPP" /f
reg delete "HKEY_CLASSES_ROOT\Directory\shellex\ContextMenuHandlers\EPP" /f
echo.

echo Выполняется удаление нового пункта "Отправить":
reg delete "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\ModernSharing" /f
echo.

echo Выполняется удаление пункта "Предоставить доступ":
reg delete "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\Sharing" /f
reg delete "HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers\Sharing" /f
reg delete "HKEY_CLASSES_ROOT\Directory\shellex\ContextMenuHandlers\Sharing" /f
reg delete "HKEY_CLASSES_ROOT\Directory\shellex\CopyHookHandlers\Sharing" /f
reg delete "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\Sharing" /f
reg delete "HKEY_CLASSES_ROOT\Drive\shellex\PropertySheetHandlers\Sharing" /f
reg delete "HKEY_CLASSES_ROOT\LibraryFolder\background\shellex\ContextMenuHandlers\Sharing" /f
reg delete "HKEY_CLASSES_ROOT\UserLibraryFolder\shellex\ContextMenuHandlers\Sharing" /f
echo.

echo Выполняется удаление пункта "Восстановить прежнюю версию":
reg delete "HKEY_CLASSES_ROOT\Directory\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
reg delete "HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
reg delete "HKEY_CLASSES_ROOT\CLSID\{450D8FBA-AD25-11D0-98A8-0800361B1103}\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
reg delete "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
echo.

echo Выполняется удаление пункта "Добавить в библиотеку":
reg delete "HKEY_CLASSES_ROOT\Folder\ShellEx\ContextMenuHandlers\Library Location" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Folder\ShellEx\ContextMenuHandlers\Library Location" /f
echo.

echo Выполняется удаление пункта "Закрепить на начальном экране":
reg delete "HKEY_CLASSES_ROOT\*\shell\pintostartscreen" /f
reg delete "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\PintoStartScreen" /f
reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\PintoStartScreen" /f
reg delete "HKEY_CLASSES_ROOT\Folder\shell\pintostartscreen" /f
reg delete "HKEY_CLASSES_ROOT\exefile\shellex\ContextMenuHandlers\PintoStartScreen" /f
reg delete "HKEY_CLASSES_ROOT\exefile\shell\pintostartscreen" /f
reg delete "HKEY_CLASSES_ROOT\Microsoft.Website\ShellEx\ContextMenuHandlers\PintoStartScreen" /f
reg delete "HKEY_CLASSES_ROOT\mscfile\shellex\ContextMenuHandlers\PintoStartScreen" /f
reg delete "HKEY_CLASSES_ROOT\mscfile\shell\pintostartscreen" /f
echo.

echo Выполняется удаление пункта "Изменить с помощью Paint 3D":
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\SystemFileAssociations\.bmp\Shell\3D Edit" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\SystemFileAssociations\.jpeg\Shell\3D Edit" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\SystemFileAssociations\.jpe\Shell\3D Edit" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\SystemFileAssociations\.jpg\Shell\3D Edit" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\SystemFileAssociations\.png\Shell\3D Edit" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\SystemFileAssociations\.gif\Shell\3D Edit" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\SystemFileAssociations\.tif\Shell\3D Edit" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\SystemFileAssociations\.tiff\Shell\3D Edit" /f
echo.

echo Выполняется удаление пункта "Изменить с помощью приложения "Фотографии"":
reg add "HKEY_CLASSES_ROOT\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit" /v "ProgrammaticAccessOnly" /t "REG_SZ" /f
echo.

echo Выполняется удаление старого пункта "Отправить":
::reg delete "HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\SendTo" /f
::reg delete "HKEY_CLASSES_ROOT\UserLibraryFolder\shellex\ContextMenuHandlers\SendTo" /f
echo.

echo Выполняется удаление лишних подпунктов из старого пункта "Отправить":
reg delete "HKEY_CURRENT_USER\SOFTWARE\Classes\CLSID\{888DCA60-FC0A-11CF-8F0F-00C04FD7D062}" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Classes\CLSID\{9E56BE60-C50F-11CF-9A2C-00A0C90A90CE}" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Classes\CLSID\{ECF03A32-103D-11d2-854D-006008059367}" /f
del /f /q "%UserProfile%\AppData\Roaming\Microsoft\Windows\SendTo\Compressed (zipped) Folder.ZFSendToTarget"
del /f /q "%UserProfile%\AppData\Roaming\Microsoft\Windows\SendTo\Fax Recipient.lnk"
del /f /q "%UserProfile%\AppData\Roaming\Microsoft\Windows\SendTo\Mail Recipient.MAPIMail"
del /f /q "%UserProfile%\AppData\Roaming\Microsoft\Windows\SendTo\Документы.mydocs"
echo.

echo Выполняется удаление лишних подпунктов из пункта "Создать":
reg delete "HKEY_CLASSES_ROOT\.bmp\ShellNew" /f
reg delete "HKEY_CLASSES_ROOT\.cdr\ShellNew" /f
reg delete "HKEY_CLASSES_ROOT\.contact\ShellNew" /f
reg delete "HKEY_CLASSES_ROOT\.lnk\ShellNew" /f
reg delete "HKEY_CLASSES_ROOT\.psd\ShellNew" /f
reg delete "HKEY_CLASSES_ROOT\.rar\ShellNew" /f
reg delete "HKEY_CLASSES_ROOT\.rtf\ShellNew" /f
reg delete "HKEY_CLASSES_ROOT\.zip\ShellNew" /f
echo.

echo Выполняется удаление пунктов видеодрайверов ("AMD Catalyst Control Center", "Настройки графики Intel®" и "Панель управления NVIDIA"):
::reg delete "HKEY_CLASSES_ROOT\Directory\background\shellex\ContextMenuHandlers\ACE" /v "{5E2121EE-0300-11D4-8D3B-444553540000}" /f
::reg delete "HKEY_CLASSES_ROOT\Directory\background\shellex\ContextMenuHandlers" /v "igfxcui" /f
::reg delete "HKEY_CLASSES_ROOT\Directory\background\shellex\ContextMenuHandlers" /v "igfxDTCM" /f
::reg delete "HKEY_CLASSES_ROOT\Directory\background\shellex\ContextMenuHandlers" /v "NvCplDesctopConext" /f
echo.

echo Выполняется удаление пунктов Kaspersky (нужно предварительно выключить самозащиту в антивирусе "Kaspersky" и директорию "Kaspersky 20.16" поменять на свою версию, например, "Kaspersky 21.18"):
::regsvr32 /u "C:\Program Files (x86)\Kaspersky Lab\Kaspersky 20.16\x64\shellex.dll"
::regsvr32 /u "C:\Program Files (x86)\Kaspersky Lab\Kaspersky 20.16\shellex.dll"
echo.

echo Выполняется настройка клавиатуры:

echo Выполняется настройка задержки перед началом повтора:
reg add "HKEY_CURRENT_USER\Control Panel\Keyboard" /v "KeyboardDelay" /t "REG_SZ" /d "0" /f
echo.

echo Выполняется настройка скорости повтора:
reg add "HKEY_CURRENT_USER\Control Panel\Keyboard" /v "KeyboardSpeed" /t "REG_SZ" /d "31" /f
echo.

echo Выполняется настройка частоты мерцания повтора:
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "CursorBlinkRate" /t "REG_SZ" /d "200" /f
echo.

echo Выполняется настройка ширины курсора ввода (1 пиксель):
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "CaretWidth" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется настройка мыши:

echo Выполняется отключение смены назначения кнопок:
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "SwapMouseButtons" /t "REG_SZ" /d "0" /f
echo.

echo Выполняется настройка скорости выполнения двойного щелчка:
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "DoubleClickSpeed" /t "REG_SZ" /d "550" /f
echo.

echo Выполняется отключение залипания (9efe078012000000-9e7e078012000000):
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /t "REG_BINARY" /d "9052038010000000" /f
echo.

echo Выполняется настройка скорости движения указателя:
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseSensitivity" /t "REG_SZ" /d "10" /f
echo.

echo Выполняется включение повышения точности указателя:
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseSpeed" /t "REG_SZ" /d "1" /f
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseThreshold1" /t "REG_SZ" /d "6" /f
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseThreshold2" /t "REG_SZ" /d "10" /f
echo.

echo Выполняется отключение исходного положения в диалоговом окне:
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "SnapToDefaultButton" /t "REG_SZ" /d "0" /f
echo.

echo Выполняется отключение следа указателя мыши:
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseTrails" /t "REG_SZ" /d "0" /f
echo.

echo Выполняется отключение скрытия указателя во время ввода с клавиатуры (9efe078012000000-9efe068012000000):
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /t "REG_BINARY" /d "9052028010000000" /f
echo.

echo Выполняется отключение обозначения расположения указателя при нажатии "CTRL" (9efe078012000000-9ebe078012000000):
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /t "REG_BINARY" /d "9012028010000000" /f
echo.

echo Выполняется настройка вертикальной прокрутки:
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "WheelScrollLines" /t "REG_SZ" /d "3" /f
echo.

echo Выполняется настройка горизонтальной прокрутки:
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "WheelScrollChars" /t "REG_SZ" /d "3" /f
echo.

echo Выполняется применение инверсной схемы указателя мыши (для тех, кто использует темную тему Windows):
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /ve /t "REG_SZ" /d "Инверсная" /f

reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "AppStarting" /t "REG_SZ" /d "%%SystemRoot%%\cursors\wait_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Arrow" /t "REG_SZ" /d "%%SystemRoot%%\cursors\arrow_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Crosshair" /t "REG_SZ" /d "%%SystemRoot%%\cursors\cross_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Hand" /t "REG_SZ" /d "%%SystemRoot%%\cursors\aero_link_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Help" /t "REG_SZ" /d "%%SystemRoot%%\cursors\help_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "IBeam" /t "REG_SZ" /d "%%SystemRoot%%\cursors\beam_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "No" /t "REG_SZ" /d "%%SystemRoot%%\cursors\no_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "NWPen" /t "REG_SZ" /d "%%SystemRoot%%\cursors\pen_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Person" /t "REG_SZ" /d "%%SystemRoot%%\cursors\person_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Pin" /t "REG_SZ" /d "%%SystemRoot%%\cursors\pin_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "SizeAll" /t "REG_SZ" /d "%%SystemRoot%%\cursors\move_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "SizeNESW" /t "REG_SZ" /d "%%SystemRoot%%\cursors\size1_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "SizeNS" /t "REG_SZ" /d "%%SystemRoot%%\cursors\size4_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "SizeNWSE" /t "REG_SZ" /d "%%SystemRoot%%\cursors\size2_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "SizeWE" /t "REG_SZ" /d "%%SystemRoot%%\cursors\size3_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "UpArrow" /t "REG_SZ" /d "%%SystemRoot%%\cursors\up_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Wait" /t "REG_SZ" /d "%%SystemRoot%%\cursors\busy_i.cur" /f

reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "ContactVisualization" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "CursorBaseSize" /t "REG_DWORD" /d "0x00000020" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "GestureVisualization" /t "REG_DWORD" /d "0x0000001f" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Scheme Source" /t "REG_DWORD" /d "0x00000002" /f
echo.

echo Выполняется настройка дополнительных настроек:

echo Выполняется установка пароля для учетной записи:
net user Instinct 56525
echo.

echo Выполняется переименование устройства/компьютера:
wmic computersystem where name="%ComputerName%" call rename name="Instinct"
echo.

echo Выполняется переименование локальных дисков:
label C: Системный
label D: Архивый
label E: Игровой
echo.

echo Выполняется отключение пункта "Изменить пароль" в меню "Ctrl+Alt+Delete":
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableChangePassword" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение пункта "Диспетчер задач" в меню "Ctrl+Alt+Delete":
::reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableTaskMgr" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение уведомлений от "My Kaspersky" (нужно предварительно выключить самозащиту в антивирусе "Kaspersky" и раздел "AVP20.16" поменять на свою версию, например, "AVP21.18"):
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\KasperskyLab\AVP20.16\Data\UCPRegistrationAlert" /v "state" /t "REG_DWORD" /d "0x00000002" /f
echo.

echo Выполняется отключение проверки обновлений и уведомлений об обновлениях "KMPlayer x64":
reg add "HKEY_CURRENT_USER\Software\KMPlayer 64X\KMPlayer 64X\Settings" /v "UpOpenLastTime" /t "REG_BINARY" /d "de34696b2f37eb40" /f
echo.

echo Выполняется очистка папок временных файлов и остального мусора:

echo Выполняется удаление ненужных пользователей:
net user "1" /delete
net user "defaultuser0" /delete
echo.

echo Выполняется очистка основной папки временных файлов:
rd /s /q "%SystemRoot%\Temp\"
echo.

echo Выполняется очистка первой пользовательской папки временных файлов:
rd /s /q "%UserProfile%\AppData\Local\Temp\"
echo.

echo Выполняется очистка второй пользовательской папки временных файлов:
rd /s /q "%UserProfile%\Local Settings\Temp\"
echo.

echo Выполняется очистка папки кэша "Internet Explorer/Edge (WebView)":
rd /s /q "%UserProfile%\AppData\Local\Microsoft\Windows\INetCache\"
echo.

echo Выполняется очистка папки ускорения загрузки Windows:
rd /s /q "%SystemRoot%\Prefetch\"
echo.

echo Выполняется очистка папки загруженных обновлений Windows:
rd /s /q "%SystemRoot%\SoftwareDistribution\Download\"
echo.

echo Выполняется очистка папки кэша обновлений Windows:
rd /s /q "%SystemRoot%\System32\catroot2\"
echo.

echo Выполняется очистка папки кэша установок ПО:
rd /s /q "%SystemRoot%\Installer\"
mkdir "%SystemRoot%\Installer\"
echo.

echo Выполняется очистка кэша "Защитника Windows":
rd /s /q "%ProgramData%\Microsoft\Windows Defender\Scans\History\"
echo.

echo Выполняется очистка кэша видеокарты NVIDIA:
rd /s /q "%UserProfile%\AppData\Local\NVIDIA\GLCache\"
echo.

echo Выполняется очистка папок "Автозапуск":
rd /s /q "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Startup\"
rd /s /q "%UserProfile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"
echo.

echo Выполняется удаление ненужных папок и файлов созданных при установки Windows:
rd /s /q "C:\PerfLogs\"
rd /s /q "C:\Users\1\"
rd /s /q "C:\Users\Default\"
rd /s /q "C:\Users\defaultuser0\"
del /s /q "%UserProfile%\Favorites\Bing.url"
del /s /q "%UserProfile%\Links\Downloads.lnk"
del /s /q "%UserProfile%\Links\Desktop.lnk"
echo.

echo Выполняется перезагрузка проводника Windows чтобы твики вступили в силу:
rundll32.exe user32.dll,UpdatePerUserSystemParameters
taskkill /f /im explorer.exe
ie4uinit.exe -ClearIconCache
start explorer.exe
echo.

echo Следующие твики реестра работают исключительно на Windows 11.
echo Если у вас Windows 10, закройте BAT-файл (окно "Командной строки") и перезагрузите компьютер.
echo Если у вас Windows 11, нажмите клавишу "Enter" (в конце компьютер сам перезагрузится).
echo.

>nul pause

echo Выполняется удаление лишних пунктов из контекстного меню:

echo Выполняется удаление пункта "Отправить":
reg delete "HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\ModernSharing" /f
echo.

echo Выполняется удаление пункта "Открыть в Терминале Windows":
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{9F156763-7844-4DC4-B2B1-901F640F5155}" /t "REG_SZ" /f
echo.

echo Выполняется уменьшение панели задач:
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSi" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется уменьшение панели задач (альтернативный метод/если первый не помог):
::reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "TaskbarHeight" /t "REG_SZ" /d "50" /f
echo.

echo Выполняется возврат старого меню "Пуск" (как на Windows 10/работает исключительно до накопительного обновления KB5004745):
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_ShowClassicMode" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется применение привычной ленты в "Проводник Windows":
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{e2bf9676-5f8f-435c-97eb-11607a5bedf7}" /t "REG_SZ" /f
echo.

echo Выполняется возврат старого контекстного меню (как на Windows 10):
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f
echo.

echo Выполняется отключение водяного знака о пробной копии в Windows 11:
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "PaintDesktopVersion" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется перезагрузка проводника Windows чтобы твики вступили в силу:
rundll32.exe user32.dll,UpdatePerUserSystemParameters
ie4uinit.exe -ClearIconCache
taskkill /f /im explorer.exe
start explorer.exe
echo.

echo Далее будет произведена перезагрузка компьютера.
echo Если вам это не нужно, закройте BAT-файл (окно "Командной строки").
echo Если вам это нужно, нажмите клавишу "Enter".
echo.

>nul pause

echo Выполняется перезагрузка компьютера:
shutdown /r /t 0
echo.

pause