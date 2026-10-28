cls
@echo off
chcp 1251 >nul
title ”даление встроенного браузера "Microsoft Edge"

echo ¬ыполн€етс€ удаление встроенного браузера "Microsoft Edge":
for /f "delims=" %%i in ('dir /b /ad "C:\Program Files (x86)\Microsoft\Edge\Application" ^| findstr "^[0-9]"') do (
"C:\Program Files (x86)\Microsoft\Edge\Application\%%i\Installer\setup.exe" --uninstall --system-level --verbose-logging --force-uninstall
)
echo.

pause