cls
@echo off
chcp 1251 >nul
title ќтключение комбинации гор€чих клавишь "Ctrl+Esc"

echo ¬ыполн€етс€ отключение комбинации гор€чих клавишь "Ctrl+Esc":
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v "Scancode Map" /t "REG_BINARY" /d "0000000000000000020000000000010000000000" /f
echo.

pause