cls
@echo off
chcp 1251 >nul
title Очистка кэша эскизов "Проводника Windows" и меню "Пуск"

echo Выполняется очистка кэша эскизов "Проводника Windows" и меню "Пуск":

ie4uinit.exe -show
taskkill /f /im explorer.exe
cd /d %LocalAppData%\
attrib -h iconcache*.db
attrib -h thumbcache*.db
del /f iconcache*
cd /d %LocalAppData%\Microsoft\Windows\Explorer
attrib -h iconcache*.db
attrib -h thumbcache*.db
del /f iconcache*
start explorer.exe

pause