cls
@echo off
chcp 1251 >nul
title Создание BAT-файла на рабочем столе для запуска Photoshop с блокировкой интернета

:: Ввод года
set /p year="Введи год вашей версии Adobe Photoshop (например, 2025): "

:: Ввод времени блокировки
set /p delay="На сколько секунд блокировать интернет (например, 20): "

:: Пути
set "psdir=C:\Program Files\Adobe\Adobe Photoshop %year%"
set "pspath=%psdir%\Photoshop.exe"
set "batfile=%psdir%\Запуск Photoshop %year%.bat"
set "shortcut=%UserProfile%\Desktop\Photoshop %year% (с блокировкой интернета).lnk"

:: Создание BAT-файла рядом с Photoshop.exe
(
echo @echo off
echo chcp 1251 ^>nul
echo title Запуск Adobe Photoshop %year%
echo(
echo echo Выполняется блокировка доступа в интернет программному обеспечению Adobe Photoshop:
echo netsh advfirewall firewall add rule name="BlockPhotoshopIn" dir=in action=block program="%pspath%"
echo netsh advfirewall firewall add rule name="BlockPhotoshopOut" dir=out action=block program="%pspath%"
echo(
echo echo Выполняется запуск программного обеспечения Adobe Photoshop:
echo start "" "%pspath%"
echo(
echo echo Выполняется разблокировка доступа в интернет программному обеспечению Adobe Photoshop ^(через %delay% секунд^):
echo timeout.exe /t %delay% /nobreak
echo netsh advfirewall firewall delete rule name="BlockPhotoshopIn"
echo netsh advfirewall firewall delete rule name="BlockPhotoshopOut"
echo(
echo exit
) > "%batfile%"

:: Создание ярлыка через PowerShell (без ^!)
powershell -nologo -command "$s = (New-Object -ComObject WScript.Shell).CreateShortcut('%shortcut%'); $s.TargetPath = '%batfile%'; $s.WorkingDirectory = '%psdir%'; $s.IconLocation = '%pspath%'; $s.Save()"

echo(
echo BAT-файл успешно создан: "%batfile%"
echo Ярлык от него на рабочем столе успешно создан: "%shortcut%"

pause