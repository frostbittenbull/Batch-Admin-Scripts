cls
@echo off
setlocal EnableDelayedExpansion
chcp 1251 >nul
title Создание BAT-файла на рабочем столе для запуска Adobe-приложения с временной блокировкой доступа в интернет

:MainMenu
cls
echo Выберите приложение Adobe, которому нужно блокировать интернет:
echo.
echo 1 - After Effects
echo 2 - Character Animator
echo 3 - Illustrator
echo 4 - InCopy
echo 5 - InDesign
echo 6 - Photoshop
echo 7 - Photoshop Lightroom Classic
echo 8 - Premiere Pro
echo 9 - XD
echo.
echo 0 - Выход
echo.

choice /c 1234567890 /n /m "Выберите пункт: "
if errorlevel 10 goto :eof
if errorlevel 9  set "appCode=SPRK" & set "appReg=SPRK" & set "appName=XD"                 & set "psExe=XD.exe"                                         & goto AskYear
if errorlevel 8  set "appCode=PPRO" & set "appReg=PPRO" & set "appName=Premiere Pro"       & set "psExe=Adobe Premiere Pro.exe"                         & goto AskYear
if errorlevel 7  set "appCode=LTRM" & set "appReg=LTRM" & set "appName=Lightroom Classic"  & set "psExe=Lightroom.exe"                                  & goto AskYear
if errorlevel 6  set "appCode=PHSP" & set "appReg=PHSP" & set "appName=Photoshop"          & set "psExe=Photoshop.exe"                                  & goto AskYear
if errorlevel 5  set "appCode=IDSN" & set "appReg=IDSN" & set "appName=InDesign"           & set "psExe=InDesign.exe"                                   & goto AskYear
if errorlevel 4  set "appCode=AICY" & set "appReg=AICY" & set "appName=InCopy"             & set "psExe=InCopy.exe"                                     & goto AskYear
if errorlevel 3  set "appCode=ILST" & set "appReg=ILST" & set "appName=Illustrator"        & set "psExe=Support Files\Contents\Windows\Illustrator.exe" & goto AskYear
if errorlevel 2  set "appCode=CHAR" & set "appReg=CHAR" & set "appName=Character Animator" & set "psExe=Support Files\Character Animator.exe"           & goto AskYear
if errorlevel 1  set "appCode=AEFT" & set "appReg=AEFT" & set "appName=After Effects"      & set "psExe=Support Files\AfterFX.exe"                      & goto AskYear

:AskYear
cls
set "vernum="
set /p year="Введи год вашей версии Adobe %appName% (например, 2025): "

if /i "%appCode%"=="AEFT" (
    if "%year%"=="2025" set "vernum=25"
    if "%year%"=="2024" set "vernum=24"
    if "%year%"=="2023" set "vernum=23"
    if "%year%"=="2022" set "vernum=22"
    if "%year%"=="2021" set "vernum=21"
    if "%year%"=="2020" set "vernum=20"
)
if /i "%appCode%"=="CHAR" (
    if "%year%"=="2025" set "vernum=25"
    if "%year%"=="2024" set "vernum=24"
    if "%year%"=="2023" set "vernum=23"
    if "%year%"=="2022" set "vernum=22"
    if "%year%"=="2021" set "vernum=21"
    if "%year%"=="2020" set "vernum=20"
)
if /i "%appCode%"=="ILST" (
    if "%year%"=="2025" set "vernum=29"
    if "%year%"=="2024" set "vernum=28"
    if "%year%"=="2023" set "vernum=27"
    if "%year%"=="2022" set "vernum=26"
    if "%year%"=="2021" set "vernum=25"
    if "%year%"=="2020" set "vernum=24"
)
if /i "%appCode%"=="AICY" (
    if "%year%"=="2025" set "vernum=20"
    if "%year%"=="2024" set "vernum=19"
    if "%year%"=="2023" set "vernum=18"
    if "%year%"=="2022" set "vernum=17"
    if "%year%"=="2021" set "vernum=16"
    if "%year%"=="2020" set "vernum=15"
)
if /i "%appCode%"=="IDSN" (
    if "%year%"=="2025" set "vernum=20"
    if "%year%"=="2024" set "vernum=19"
    if "%year%"=="2023" set "vernum=18"
    if "%year%"=="2022" set "vernum=17"
    if "%year%"=="2021" set "vernum=16"
    if "%year%"=="2020" set "vernum=15"
)
if /i "%appCode%"=="PHSP" (
    if "%year%"=="2025" set "vernum=26"
    if "%year%"=="2024" set "vernum=25"
    if "%year%"=="2023" set "vernum=24"
    if "%year%"=="2022" set "vernum=23"
    if "%year%"=="2021" set "vernum=22"
    if "%year%"=="2020" set "vernum=21"
)
if /i "%appCode%"=="LTRM" (
    if "%year%"=="2025" set "vernum=14"
    if "%year%"=="2024" set "vernum=13"
    if "%year%"=="2023" set "vernum=12"
    if "%year%"=="2022" set "vernum=11"
    if "%year%"=="2021" set "vernum=10"
    if "%year%"=="2020" set "vernum=9"
)
if /i "%appCode%"=="PPRO" (
    if "%year%"=="2025" set "vernum=25"
    if "%year%"=="2024" set "vernum=24"
    if "%year%"=="2023" set "vernum=23"
    if "%year%"=="2022" set "vernum=22"
    if "%year%"=="2021" set "vernum=21"
    if "%year%"=="2020" set "vernum=20"
)
if /i "%appCode%"=="SPRK" (
    if "%year%"=="2025" set "vernum=59"
    if "%year%"=="2024" set "vernum=58"
    if "%year%"=="2023" set "vernum=57"
    if "%year%"=="2022" set "vernum=56"
    if "%year%"=="2021" set "vernum=55"
    if "%year%"=="2020" set "vernum=54"
)

if not defined vernum (
    echo Неизвестное соответствие для %appName% %year%.
    pause
    goto MainMenu
)

set "psdir="
set "subkey="
for /f "delims=" %%K in ('
    reg query "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s /f "%appReg%_%vernum%_" /k 2^>nul ^| findstr /i "%appReg%_%vernum%_"
') do (
    set "subkey=%%K"
    goto :GotSubkey
)

:GotSubkey
if not defined subkey (
    echo.
    echo Не удалось найти %appName% %year%.
    pause
    goto MainMenu
)

for /f "tokens=1,2,*" %%A in ('
    reg query "!subkey!" /v InstallLocation 2^>nul ^| findstr /i "InstallLocation"
') do (
    set "psdir=%%C"
)

if not defined psdir (
    echo.
    echo Не удалось найти разположение исполняемого файла от %appName% %year%.
    pause
    goto MainMenu
)

if "!psdir:~-1!"=="\" set "psdir=!psdir:~0,-1!"

set "pspath=!psdir!\%psExe%"
call :TryBuildFromSubfolder "!psdir!" "%appName%" "%year%" "%psExe%" "%psExeAlt%"

if not exist "!pspath!" (
    echo.
    echo Файл "!pspath!" не найден.
    echo Попробуйте вручную проверить разположение исполняемого файла от %appName% %year%.
    pause
    goto MainMenu
)

set "batfile=!psdir!\Start %appName% %year%.bat"
set "fwName=%appName: =_%"

set /p delay="На сколько секунд блокировать интернет (например, 20): "

(
echo @echo off
echo chcp 1251 ^>nul
echo title Запуск Adobe %appName% %year%
echo(
echo echo Выполняется блокировка доступа в интернет программному обеспечению Adobe %appName%:
echo netsh advfirewall firewall delete rule name="Block%fwName%In" ^>nul 2^>^&1
echo netsh advfirewall firewall delete rule name="Block%fwName%Out" ^>nul 2^>^&1
echo netsh advfirewall firewall add rule name="Block%fwName%In" dir=in action=block program="!pspath!"
echo netsh advfirewall firewall add rule name="Block%fwName%Out" dir=out action=block program="!pspath!"
echo(
echo echo Выполняется запуск программного обеспечения Adobe %appName%:
echo start "" "!pspath!"
echo(
echo echo Выполняется разблокировка доступа в интернет программному обеспечению Adobe %appName% ^(через %delay% секунд^):
echo timeout.exe /t %delay% /nobreak
echo netsh advfirewall firewall delete rule name="Block%fwName%In"
echo netsh advfirewall firewall delete rule name="Block%fwName%Out"
echo(
echo exit
) > "!batfile!"

for /f "usebackq delims=" %%S in (`powershell -nologo -command ^
    "$desktop = [Environment]::GetFolderPath('Desktop');" ^
    "$shortcut = Join-Path $desktop '%appName% %year% (с блокировкой интернета).lnk';" ^
    "$s = (New-Object -ComObject WScript.Shell).CreateShortcut($shortcut);" ^
    "$s.TargetPath = '%batfile%';" ^
    "$s.WorkingDirectory = '%psdir%';" ^
    "$s.IconLocation = '!pspath!';" ^
    "$s.Save();" ^
    "Write-Output $shortcut"`) do set "shortcut=%%S"

echo.
echo BAT-файл успешно создан: "!batfile!"
echo Ярлык от него на рабочем столе успешно создан: "!shortcut!"
pause
goto MainMenu

:TryBuildFromSubfolder
if /i "%~2"=="Premiere Pro" set "pspath=%~1\Adobe Premiere Pro %~3\%~4"
if /i "%~2"=="After Effects" set "pspath=%~1\Adobe After Effects %~3\%~4"
goto :eof