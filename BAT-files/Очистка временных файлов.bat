cls
@echo off
chcp 1251 >nul
title Очистка папок временных файлов

echo Выполняется минимальная очистка папок временных файлов:

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

echo Выполняется очистка папки кэша видеокарты NVIDIA:
rd /s /q "%UserProfile%\AppData\Local\NVIDIA\GLCache\"
echo.

echo Выполняется очистка папок "Автозапуск":
rd /s /q "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Startup\"
rd /s /q "%UserProfile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"
echo.

echo Выполняется очистка папки кэша "Защитника Windows":
rd /s /q "%ProgramData%\Microsoft\Windows Defender\Scans\History\"
echo.

echo Выполняется очистка папки ускорения загрузки Windows:
rd /s /q "%SystemRoot%\Prefetch\"
echo.

echo Выполняется сброс счетчика скриншотов:
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ScreenshotIndex" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Далее будет произведена максимальная очистка папок временных файлов.
echo Если вам это не нужно, закройте BAT-файл (окно "Командной строки").
echo Если вам это нужно, нажмите клавишу "Enter".
echo.

>nul pause

echo Выполняется максимальная очистка папок временных файлов:

echo Выполняется очистка кэша Windows:
net stop wuauserv
net stop cryptSvc
net stop bits
net stop msiserver

echo Выполняется очистка папки кэша установок ПО:
rd /s /q "%SystemRoot%\Installer\"
mkdir "%SystemRoot%\Installer\"
echo.

echo Выполняется очистка папки загруженных обновлений Windows:
rd /s /q "%SystemRoot%\SoftwareDistribution\Download\"
echo.

echo Выполняется очистка папки кэша обновлений Windows:
rd /s /q "%SystemRoot%\System32\catroot2\"
echo.

echo Выполняется очистка папки журнала состояния ядра Windows:
rd /s /q "%SystemRoot%\LiveKernelReports\"
echo.

echo Выполняется очистка папки кэша установок Windows:
rd /s /q "%SystemRoot%\Downloaded Program Files\"
echo.

net start wuauserv
net start cryptSvc
net start bits
net start msiserver
echo.

echo Выполняется очистка системных журналов Windows:
for /f "tokens=*" %%1 in ('wevtutil.exe el') DO wevtutil.exe cl "%%1"
echo.

pause