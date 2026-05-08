cls
@echo off
chcp 1251 >nul
title Добавление пункта "Запуск от имени Администратора"" в контекстное меню

echo Выполняется добавление пункта "Запуск от имени Администратора" в контекстное меню:
reg add "HKEY_CLASSES_ROOT\batfile\shell\runas" /v "HasLUAShield" /t "REG_SZ" /f
reg add "HKEY_CLASSES_ROOT\batfile\shell\runas\command" /ve /t REG_SZ /d "%%SystemRoot%%\System32\cmd.exe /C \"%%1\" %%*\"" /f
reg add "HKEY_CLASSES_ROOT\cmdfile\shell\runas" /v "HasLUAShield" /t "REG_SZ" /f
reg add "HKEY_CLASSES_ROOT\cmdfile\shell\runas\command" /ve /t REG_SZ /d "%%SystemRoot%%\System32\cmd.exe /C \"%%1\" %%*\"" /f
reg add "HKEY_CLASSES_ROOT\cplfile\shell\runas" /v "HasLUAShield" /t "REG_SZ" /f
reg add "HKEY_CLASSES_ROOT\cplfile\shell\runas\command" /ve /t REG_SZ /d "%%SystemRoot%%\System32\rundll32.exe shell32.dll,Control_RunDLLAsUser \"%%1\",%%* /C \"%%1\" %%*" /f
reg add "HKEY_CLASSES_ROOT\exefile\shell\runas" /v "HasLUAShield" /t "REG_SZ" /f
reg add "HKEY_CLASSES_ROOT\exefile\shell\runas\command" /ve /t "REG_SZ" /d "\"%%1\" %%*\"" /f
reg add "HKEY_CLASSES_ROOT\exefile\shell\runas\command" /v "IsolatedCommand" /t "REG_SZ" /d "\"%%1\" %%*\"" /f
reg add "HKEY_CLASSES_ROOT\mscfile\shell\runas" /v "HasLUAShield" /t "REG_SZ" /f
reg add "HKEY_CLASSES_ROOT\mscfile\shell\runas\command" /t "REG_SZ" /d "%%SystemRoot%%\system32\mmc.exe \"%%1\" %%*\"" /f
echo.

pause