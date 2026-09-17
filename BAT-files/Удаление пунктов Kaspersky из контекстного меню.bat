cls
@echo off
chcp 1251 >nul
title ”даление пунктов Kaspersky из контекстного меню

echo ¬ыполн€етс€ удаление пунктов Kaspersky (нужно предварительно выключить самозащиту в антивирусе "Kaspersky"):
set /p version="¬ведите версию своего Kaspersky (например, 21.24): "
regsvr32 /u "C:\Program Files (x86)\Kaspersky Lab\Kaspersky %version%\x64\shellex.dll"
regsvr32 /u "C:\Program Files (x86)\Kaspersky Lab\Kaspersky %version%\shellex.dll"
echo.

pause