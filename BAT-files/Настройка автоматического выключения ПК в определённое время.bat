cls
@echo off
chcp 1251 >nul
title Настройка автоматического выключения ПК

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
cls
echo Проверка текущих заданий в планировщике:
schtasks /query /tn "AutoShutdown_Weekdays" >nul 2>&1
if %errorlevel% equ 0 (echo %green%[+] Найдена задача для будней%reset%) else (echo %red%[-] Задача для будней не настроена%reset%)

schtasks /query /tn "AutoShutdown_Saturday" >nul 2>&1
if %errorlevel% equ 0 (echo %green%[+] Найдена задача для субботы%reset%) else (echo %red%[-] Задача для субботы не настроена%reset%)
echo.

:ActionQuestion
set "act="
set /p act=Настроить автоматическое выключение ПК? (y - настроить / n - выход / d - удалить задачи): 
if /I "%act%"=="n" exit /b
if /I "%act%"=="d" goto DeleteTasks
if /I "%act%"=="y" (
    goto ManualQuestion
) else (
    echo %red%Неверный ввод. Используйте y, n или d.%reset%
    goto ActionQuestion
)

:ManualQuestion
set "mode="
set /p mode=Настроить вручную? (y/n): 
if /I "%mode%"=="y" (
    goto ManualSetup
) else if /I "%mode%"=="n" (
    goto AutoSetup
) else (
    echo %red%Неверный ввод. Используйте y или n.%reset%
    goto ManualQuestion
)

:AutoSetup
schtasks /create /tn "AutoShutdown_Weekdays" /tr "shutdown.exe /s /f /t 60" /sc weekly /d MON,TUE,WED,THU,FRI /st 17:59 /f >nul
schtasks /create /tn "AutoShutdown_Saturday" /tr "shutdown.exe /s /f /t 60" /sc weekly /d SAT /st 12:59 /f >nul
echo %green%Задачи по умолчанию успешно созданы! (Пн-Пт 18:00, Сб 13:00)%reset%
pause
goto Main

:ManualSetup
echo.
echo Настройка для Будней (Пн-Пт):
set /p w_time=Введите время (например, 18:00): 
schtasks /create /tn "AutoShutdown_Weekdays" /tr "shutdown.exe /s /f /t 60" /sc weekly /d MON,TUE,WED,THU,FRI /st %w_time% /f

echo.
echo Настройка для Субботы:
set /p s_time=Введите время (например, 13:00): 
schtasks /create /tn "AutoShutdown_Saturday" /tr "shutdown.exe /s /f /t 60" /sc weekly /d SAT /st %s_time% /f

echo %green%Ручная настройка завершена.%reset%
pause
goto Main

:DeleteTasks
echo.
schtasks /delete /tn "AutoShutdown_Weekdays" /f >nul 2>&1
schtasks /delete /tn "AutoShutdown_Saturday" /f >nul 2>&1
echo %green%Все задачи автовыключения удалены.%reset%
pause
goto Main

pause