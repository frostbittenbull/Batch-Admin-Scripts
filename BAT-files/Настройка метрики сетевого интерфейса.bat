cls
@echo off
chcp 1251 >nul
title Настройка метрики сетевого интерфейса

for /f "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do set "esc=%%b"
set "red=%esc%[91m"
set "green=%esc%[92m"
set "reset=%esc%[0m"

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo %red%Пожалуйста, запустите данный BAT-файл от имени Администратора.%reset%
    pause
    exit /b
)

:Main
echo Список сетевых интерфейсов (IPv4):
netsh interface ipv4 show interface

:Index
set "ifindex="
set /p ifindex=Введите индекс интерфейса: 
if "%ifindex%"=="" (
    echo %red%Интерфейса с пустым индексом не существует. Попробуйте ещё раз.%reset%
    echo.
    goto Index
)
netsh interface ipv4 show interface | findstr /R /C:"^ *%ifindex% " >nul
if %errorlevel% neq 0 (
    echo %red%Интерфейс с индексом "%ifindex%" не найден. Попробуйте ещё раз.%reset%
    echo.
    goto Index
)

:Question
set "mode="
set /p mode=Настроить вручную? (y/n): 
if /I "%mode%"=="y" (
    goto Manual
) else if /I "%mode%"=="n" (
    goto Auto
) else (
    echo %red%Неверный ввод. Используйте только латинские y или n.%reset%
    echo.
    goto Question
)

:Manual
set "metric="
set /p metric=Введите метрику (например 20): 
echo(%metric%| findstr /R "^[0-9][0-9]*$" >nul
if %errorlevel% neq 0 (
    echo %red%Метрика должна быть числом.%reset%
    echo.
    goto Manual
)
netsh interface ipv4 set interface %ifindex% metric=%metric%
if %errorlevel% equ 0 (
    cls
    echo %green%Установлена метрика %metric% для интерфейса с индексом %ifindex%%reset%
) else (
    cls
    echo %red%Произошла ошибка при установке метрики.%reset%
)
echo.
goto Main

:Auto
netsh interface ipv4 set interface %ifindex% metric=automatic
if %errorlevel% equ 0 (
    cls
    echo %green%Установлена автоматическая метрика для интерфейса с индексом %ifindex%%reset%
) else (
    cls
    echo %red%Произошла ошибка при установке автоматической метрики.%reset%
)
echo.
goto Main

pause