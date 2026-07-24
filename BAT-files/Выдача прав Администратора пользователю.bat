cls
@echo off
setlocal EnableDelayedExpansion
chcp 1251 >nul
title Выдача прав Администратора пользователю

set i=0
for /f "skip=1 tokens=* delims= " %%U in ('wmic useraccount get name') do (
    if not "%%U"=="" (
        set /a i+=1
        set "user[!i!]=%%U"
    )
)

:MainMenu
cls
echo Выберите какого пользователя сделать администратором:
echo.

for /l %%N in (1,1,%i%) do (
    echo %%N - !user[%%N]!
)

echo.
echo 0 - Выход
echo.

set "keys=0"
for /l %%N in (1,1,%i%) do set "keys=!keys!%%N"

choice /c !keys! /n /m "Выберите пункт: "

if errorlevel 10 goto :eof
if errorlevel 9  set sel=9
if errorlevel 8  set sel=8
if errorlevel 7  set sel=7
if errorlevel 6  set sel=6
if errorlevel 5  set sel=5
if errorlevel 4  set sel=4
if errorlevel 3  set sel=3
if errorlevel 2  set sel=2
if errorlevel 1  set sel=1

if not defined user[%sel%] goto :MainMenu

set "USERNAME=!user[%sel%]!"

cls
echo Делаю пользователя "!USERNAME!" администратором...
echo.

net localgroup Администраторы "!USERNAME!" /add >nul 2>&1
net localgroup Пользователи "!USERNAME!" /delete >nul 2>&1

echo Готово.
timeout /t 2 >nul
goto :MainMenu