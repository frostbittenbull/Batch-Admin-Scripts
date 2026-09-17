cls
@echo off
chcp 1251 >nul
title Активация Kaspersky Free на 1 год

echo Выполняется активация Kaspersky Free на 1 год (нужно предварительно выключить самозащиту в антивирусе "Kaspersky"):
set /p version="Введите версию своего Kaspersky (например, 21.24): "
cd /d "C:\Program Files (x86)\Kaspersky Lab\Kaspersky %version%"
avp.com license /add SP91U-6S8UJ-EV11T-V9GY9
echo Готово! Код активации SP91U-6S8UJ-EV11T-V9GY9 успешно введён.
echo.

pause