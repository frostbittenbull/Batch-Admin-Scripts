cls
@echo off
chcp 1251 >nul
title Удаление щита из контекстного меню

echo Выполняется удаление щита из контекстного меню "Запуск от имени Администратора":
reg delete "HKEY_CLASSES_ROOT\batfile\shell\runas" /v "HasLUAShield" /f
reg delete "HKEY_CLASSES_ROOT\cmdfile\shell\runas" /v "HasLUAShield" /f
reg delete "HKEY_CLASSES_ROOT\cplfile\shell\runas" /v "HasLUAShield" /f
reg delete "HKEY_CLASSES_ROOT\exefile\shell\runas" /v "HasLUAShield" /f
reg delete "HKEY_CLASSES_ROOT\mscfile\shell\runas" /v "HasLUAShield"  /f
echo.

pause