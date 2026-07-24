cls
@echo off
chcp 1251 >nul
title Отключение обновлений "KMPlayer"

echo Выполняется отключение проверки обновлений и уведомлений об обновлениях "KMPlayer x64":
reg add "HKEY_CURRENT_USER\Software\KMPlayer 64X\KMPlayer 64X\Settings" /v "UpOpenLastTime" /t "REG_BINARY" /d "de34696b2f37eb40" /f
echo.

pause