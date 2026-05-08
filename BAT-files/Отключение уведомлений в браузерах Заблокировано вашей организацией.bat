cls
@echo off
chcp 1251 >nul
title Отключение уведомлений в браузерах "Заблокировано вашей организацией"

echo Выполняется настройка политики безопасности браузера:
powershell -Command "$paths = 'HKEY_LOCAL_MACHINE:\SOFTWARE\Policies', 'HKEY_CURRENT_USER:\SOFTWARE\Policies'; foreach ($path in $paths) { if (Test-Path $path) { Get-ChildItem -Path $path -Recurse -ErrorAction SilentlyContinue | ForEach-Object { if (Get-ItemProperty -Path $_.PSPath -Name 'DownloadRestrictions' -ErrorAction SilentlyContinue) { Write-Host 'Удаление из: ' $_.PSPath; Remove-ItemProperty -Path $_.PSPath -Name 'DownloadRestrictions' -Force } } } }"
echo.

echo Выполняется настройка безопасности для зоны "Интернет":
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1803" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1806" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2200" /t "REG_DWORD" /d "0x00000003" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1803" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1806" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "2200" /t "REG_DWORD" /d "0x00000003" /f
echo.

echo Выполняется отключение уведомлений "Этот файл получен с другого компьютера и, возможно, был заблокирован с целью защиты компьютера.":
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t "REG_DWORD" /d "0x00000001" /f
echo.

pause