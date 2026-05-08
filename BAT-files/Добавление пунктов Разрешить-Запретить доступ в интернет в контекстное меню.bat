cls
@echo off
chcp 1251 >nul
title Добавление пунктов "Разрешить/Запретить доступ в интернет" в контекстное меню исполняемых файлов (EXE-файлов)

echo Выполняется добавление родительского пункта "Доступ в интернет":
reg add "HKEY_CLASSES_ROOT\exefile\shell\firewall" /v "MUIVerb" /t "REG_SZ" /d "Доступ в интернет" /f
reg add "HKEY_CLASSES_ROOT\exefile\shell\firewall" /v "SubCommands" /t "REG_SZ" /f
echo.

echo Выполняется добавление подпункта "Разрешить доступ в интернет":
reg add "HKEY_CLASSES_ROOT\exefile\shell\firewall\shell\firewall_allow" /v "MUIVerb" /t "REG_SZ" /d "Разрешить доступ в интернет" /f
reg add "HKEY_CLASSES_ROOT\exefile\shell\firewall\shell\firewall_allow" /v "Icon" /t "REG_SZ" /d "netcenter.dll,10" /f
reg add "HKEY_CLASSES_ROOT\exefile\shell\firewall\shell\firewall_allow\command" /t "REG_SZ" /d "netsh advfirewall firewall delete rule name=\"%%1\"" /f
echo.

echo Выполняется добавление подпункта "Запретить доступ в интернет":
reg add "HKEY_CLASSES_ROOT\exefile\shell\firewall\shell\firewall_block" /v "MUIVerb" /t "REG_SZ" /d "Запретить доступ в интернет" /f
reg add "HKEY_CLASSES_ROOT\exefile\shell\firewall\shell\firewall_block" /v "Icon" /t "REG_SZ" /d "netcenter.dll,5" /f
echo Windows Registry Editor Version 5.00 > "%SystemRoot%\Temp\firewall_block.reg"
echo. >> "%SystemRoot%\Temp\firewall_block.reg"
echo [HKEY_CLASSES_ROOT\exefile\shell\firewall\shell\firewall_block\command] >> "%SystemRoot%\Temp\firewall_block.reg"
echo @="cmd /d /c \"netsh advfirewall firewall add rule name=\"%%1\" dir=in action=block program=\"%%1\" ^& netsh advfirewall firewall add rule name=\"%%1\" dir=out action=block program=\"%%1\"\"" >> "%SystemRoot%\Temp\firewall_block.reg"
reg import "%SystemRoot%\Temp\firewall_block.reg"
del /f /q "%SystemRoot%\Temp\firewall_block.reg"
echo.

pause