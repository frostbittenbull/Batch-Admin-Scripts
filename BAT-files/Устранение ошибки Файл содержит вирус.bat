cls
@echo off
chcp 1251 >nul
title Устранение ошибки "Файл содержит вирус""

echo Выполняется устранение распространенной ошибки "Операция не была успешно завершена, так как файл содержит вирус":
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "ScanWithAntiVirus" /t "REG_DWORD" /d "0x00000001" /f
echo.

pause