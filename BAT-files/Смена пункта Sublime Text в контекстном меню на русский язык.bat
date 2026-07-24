cls
@echo off
chcp 1251 >nul
title —мена пункта Sublime Text в контекстном меню на русский €зык

echo ¬ыполн€етс€ смена пункта Sublime Text в контекстном меню на русский €зык:
reg delete "HKEY_CLASSES_ROOT\*\shell\Open with Sublime Text" /f
reg add "HKEY_CLASSES_ROOT\*\shell\ќткрыть в Sublime Text\command" /ve /t "REG_SZ" /d "C:\Program Files\Sublime Text\sublime_text.exe \"%%1\"" /f
echo.

pause