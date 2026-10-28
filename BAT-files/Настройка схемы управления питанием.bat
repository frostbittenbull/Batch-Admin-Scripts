cls
@echo off
chcp 1251 >nul
title Настройка схемы управления питанием

echo Выполняется настройка схемы управления питанием (Сбалансированная):
echo Выберите схему управления питанием:
echo 1 - Экономия энергии
echo 2 - Сбалансированная
echo 3 - Высокая производительность
echo 4 - Максимальная производительность
set /p choice=Введите номер (1-4): 

if "%choice%"=="1" (
    set GUID=a1841308-3541-4fab-bc81-f71556f20b4a
    set name=Экономия энергии
)
if "%choice%"=="2" (
    set GUID=381b4222-f694-41f0-9685-ff5bb260df2e
    set name=Сбалансированная
)
if "%choice%"=="3" (
    set GUID=8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
    set name=Высокая производительность
)
if "%choice%"=="4" (
    set GUID=e9a42b02-d5df-448d-aa00-03f14749eb61
    set name=Максимальная производительность
)

if not defined GUID (
    echo Неверный выбор.
    pause
    exit /b
)

powercfg /setactive %GUID%
echo Схема управления питанием "%name%" установлена.
pause

echo.

pause