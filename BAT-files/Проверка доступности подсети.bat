cls
@echo off
setlocal EnableDelayedExpansion
chcp 1251 >nul
title Проверка доступности подсети

for /f "delims=" %%A in ('echo prompt $E^| cmd') do set "ESC=%%A"

:Menu
cls
echo.
echo Проверка доступных показывает только доступные IP-адреса
echo Полная проверка показывает все IP-адреса
echo.
echo 1 - Проверка доступных
echo 2 - Полная проверка
echo.
echo 0 - Выход
echo.

choice /c 120 /n /m "Выберите пункт: "

if errorlevel 3 goto :eof
if errorlevel 2 goto FullScan
if errorlevel 1 goto FastScan

goto Menu

:FullScan
call :Scan full
goto AfterScan

:FastScan
call :Scan fast
goto AfterScan

:Scan
cls
echo.
set /p subnet="Введите подсеть (например, 192.168.1): "

echo.
echo Сканирование подсети %subnet%.0/24…
echo.

set "RESULT="

for /L %%i in (1,1,254) do (
    if "%1"=="full" (
        ping -n 1 -w 100 %subnet%.%%i >nul
        if not errorlevel 1 (
            echo %ESC%[32m%subnet%.%%i - ОТВЕЧАЕТ%ESC%[0m
            set "RESULT=!RESULT!!subnet!.%%i - ОТВЕЧАЕТ\r\n"
        ) else (
            echo %ESC%[31m%subnet%.%%i - НЕ ОТВЕЧАЕТ%ESC%[0m
            set "RESULT=!RESULT!!subnet!.%%i - НЕ ОТВЕЧАЕТ\r\n"
        )
    ) else (
        ping -n 1 -w 100 %subnet%.%%i | find "TTL=" >nul
        if not errorlevel 1 (
            echo %subnet%.%%i - ОТВЕЧАЕТ
            set "RESULT=!RESULT!!subnet!.%%i - ОТВЕЧАЕТ\r\n"
        )
    )
)

exit /b

:AfterScan
echo.
choice /c yn /n /m "Сохранить результат в текстовом формате? (y/n): "

if errorlevel 2 goto NoSave
if errorlevel 1 goto Save

:Save
(
    echo Результат сканирования
    echo Подсеть: %subnet%.0/24
    echo Дата: %date% %time%
    echo.
    echo %RESULT%
) > "%~dp0result.txt"

echo.
echo Результат сохранён в result.txt
pause
goto Menu

:NoSave
echo.
pause
goto Menu