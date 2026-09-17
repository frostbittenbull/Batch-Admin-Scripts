cls
@echo off
chcp 1251 >nul
title ”даление пунктов Windows Media Player из контекстного меню

echo ¬ыполн€етс€ удаление пункта "ƒобавить в список воспроизведени€ проигрывател€ Windows Media":
reg delete "HKEY_CLASSES_ROOT\exefile\shellex\ContextMenuHandlers\ProxifierShellExt" /f
reg delete "HKEY_CLASSES_ROOT\lnkfile\shellex\ContextMenuHandlers\ProxifierShellExt" /f
echo.

pause