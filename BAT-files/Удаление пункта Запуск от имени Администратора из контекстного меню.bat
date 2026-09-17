cls
@echo off
chcp 1251 >nul
title Удаление пункта "Запуск от имени Администратора" из контекстного меню

echo Выполняется удаление пункта "Запуск от имени Администратора" из контекстного меню:
reg delete "HKEY_CLASSES_ROOT\batfile\shell\runas" /f
reg delete "HKEY_CLASSES_ROOT\cmdfile\shell\runas" /f
reg delete "HKEY_CLASSES_ROOT\cplfile\shell\runas" /f
reg delete "HKEY_CLASSES_ROOT\exefile\shell\runas" /f
reg delete "HKEY_CLASSES_ROOT\mscfile\shell\runas" /f
echo.

pause