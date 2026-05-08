cls
@echo off
chcp 1251 >nul
title Настройка контекстного меню на рабочем столе

echo Выполняется добавление нужных пунктов в контекстное меню Рабочего стола:
reg delete "HKEY_CLASSES_ROOT\DesktopBackground\Shell\instruments" /f
echo.

echo Выполняется добавление подпункта "Инструменты":
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\instruments" /v "MUIVerb" /t "REG_SZ" /d "Инструменты" /f
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\instruments" /v "SubCommands" /t "REG_SZ" /f
echo.

echo Выполняется добавление подпункта "Экранная клавиатура":
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\instruments\shell\1.screenkeyboard" /v "Icon" /t "REG_SZ" /d "osk.exe" /f
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\instruments\shell\1.screenkeyboard" /v "MUIVerb" /t "REG_SZ" /d "Экранная клавиатура" /f
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\instruments\shell\1.screenkeyboard\command" /ve /t "REG_EXPAND_SZ" /d "osk.exe" /f
echo.

echo Выполняется добавление подпункта "Удалить временные файлы":
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\instruments\shell\2.cleartemp" /v "Icon" /t "REG_SZ" /d "cleanmgr.exe" /f
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\instruments\shell\2.cleartemp" /v "MUIVerb" /t "REG_SZ" /d "Удалить временные файлы" /f
reg add "HKCR\DesktopBackground\Shell\instruments\shell\2.cleartemp\command" ^
/ve /t REG_EXPAND_SZ ^
/d "cmd.exe /c rd /s /q \"%%SystemRoot%%\Temp\" & rd /s /q \"%%UserProfile%%\AppData\Local\Temp\" & rd /s /q \"%%UserProfile%%\Local Settings\Temp\" & rd /s /q \"%%UserProfile%%\AppData\Local\Microsoft\Windows\INetCache\" & rd /s /q \"%%ProgramData%%\Microsoft\Windows\Start Menu\Programs\Startup\" & rd /s /q \"%%UserProfile%%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\" & rd /s /q \"%%ProgramData%%\Microsoft\Windows Defender\Scans\History\" & rd /s /q \"%%SystemRoot%%\Prefetch\" & reg add \"HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\" /v \"ScreenshotIndex\" /t \"REG_DWORD\" /d \"0x00000001\" /f" ^
/f
echo.

echo Выполняется добавление подпункта "Сетевые подключения":
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\instruments\shell\3.networkconnections" /v "Icon" /t "REG_SZ" /d "ncpa.cpl" /f
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\instruments\shell\3.networkconnections" /v "MUIVerb" /t "REG_SZ" /d "Сетевые подключения" /f
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\instruments\shell\3.networkconnections\command" /ve /t "REG_EXPAND_SZ" /d "control.exe ncpa.cpl" /f
echo.

echo Выполняется добавление подпункта "Open Connect":
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\instruments\shell\4.openconnect" /v "Icon" /t "REG_SZ" /d "%%ProgramFiles(x86)%%\OpenConnect-GUI\openconnect-gui.exe" /f
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\instruments\shell\4.openconnect" /v "MUIVerb" /t "REG_SZ" /d "Open Connect" /f
::reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\instruments\shell\4.openconnect\command" /ve /t "REG_EXPAND_SZ" /d "%%ProgramFiles(x86)%%\OpenConnect-GUI\openconnect-gui.exe" /f
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\instruments\shell\4.openconnect\command" /ve /t REG_EXPAND_SZ /d "explorer.exe \"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\OpenConnect.lnk\"" /f
echo.

echo Выполняется добавление подпункта "Заблокировать ПК":
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\instruments\shell\5.blockpc" /v "Icon" /t "REG_SZ" /d "imageres.dll,54" /f
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\instruments\shell\5.blockpc" /v "MUIVerb" /t "REG_SZ" /d "Заблокировать ПК" /f
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\instruments\shell\5.blockpc\command" /ve /t "REG_EXPAND_SZ" /d "rundll32.exe user32.dll,LockWorkStation" /f
echo.

echo Выполняется добавление подпункта "Спящий режим":
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\instruments\shell\6.sleep" /v "Icon" /t "REG_SZ" /d "shell32.dll,27" /f
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\instruments\shell\6.sleep" /v "MUIVerb" /t "REG_SZ" /d "Спящий режим" /f
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\instruments\shell\6.sleep\command" /ve /t "REG_EXPAND_SZ" /d "rundll32.exe powrprof.dll,SetSuspendState Sleep" /f
echo.

echo Выполняется добавление подпункта "Командная строка" в контекстное меню фона папки:
::reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\1.cmd" /ve /t "REG_SZ" /d "Командная строка" /f
::::reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\1.cmd" /v "Icon" /t "REG_SZ" /d "imageres.dll,311" /f
::::reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\1.cmd" /v "Position" /t "REG_SZ" /d "bottom" /f
::reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\1.cmd" /v "Position" /t "REG_SZ" /d "top" /f
::reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\1.cmd\command" /ve /t "REG_SZ" /d "cmd.exe /k cd /d %%V" /f
echo.

pause