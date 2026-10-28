cls
@echo off
chcp 1251 >nul
title Удаления папок кэша браузера "Chrome"

echo Выполняется удаления папок кэша браузера "Chrome":
chdir /d "C:\Program Files"
for /d %%D in (ChromiumTemp*) do rd /s /q "%%D"
for /d %%D in (chrome_BITS*) do rd /s /q "%%D"
for /d %%D in (chrome_drag*) do rd /s /q "%%D"
echo.

pause