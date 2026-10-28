cls
@echo off
chcp 1251 >nul
title Настройка параметров быстродействия (Визуальные эффекты)

echo Выполняется настройка параметров быстродействия (Визуальные эффекты):

echo Выполняется отключение всех функций визуальных эффектов:
::reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t "REG_DWORD" /d "0x00000002" /f

echo Выполняется отключение всех функций визуальных эффектов кроме "Вывод эскизов вместо значков" и "Сглаживание неровностей экранных шрифтов":
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t "REG_DWORD" /d "0x00000003" /f
echo.

echo Выполняется отключение функции "Анимация на панели задач":
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение функции "Анимация окон при свертывании и развертывании":
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t "REG_SZ" /d "0" /f
echo.

echo Выполняется отключение функции "Анимированные элементы управления и элементы внутри окна" (9e3e068012000000-9e3e068010000000):
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /t "REG_BINARY" /d "9e3e068010000000" /f
echo.

echo Выполняется отключение функции "Включение Peek":
reg add "Компьютер\Компьютер\HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется включение функции "Вывод эскизов вместо значков":
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение функции "Гладкое прокручивание списков" (9e3e068012000000-963a068012000000):
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /t "REG_BINARY" /d "963e068010000000" /f
echo.

echo Выполняется отключение функции "Затухание меню после вызова команды" (9e3e068012000000-9e3a068012000000):
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /t "REG_BINARY" /d "963a068010000000" /f
echo.

echo Выполняется отключение функции "Отбрасывание теней значками на рабочем столе":
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение функции "Отображение прозрачного прямоугольника выделения":
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t "REG_DWORD" /d "0x00000000" /f
echo.

echo Выполняется отключение функции "Отображения содержимого окна при перетаскивании":
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "DragFullWindows" /t "REG_SZ" /d "0" /f
echo.

echo Выполняется отключение функции "Отображение теней, отбрасываемых окнами" (9e3e068012000000-9e3e028012000000):
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /t "REG_BINARY" /d "963a028010000000" /f
echo.

echo Выполняется отключение функции "Отображение тени под указателем мыши" (9e3e068012000000-9e1e068012000000):
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /t "REG_BINARY" /d "961a028010000000" /f
echo.

echo Выполняется включение функции "Сглаживание неровностей экранных шрифтов":
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "FontSmoothing" /t "REG_SZ" /d "2" /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "FontSmoothingGamma" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "FontSmoothingOrientation" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "FontSmoothingType" /t "REG_DWORD" /d "0x00000002" /f
::reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "CTTuneMakeSettingsDefault" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение функции "Скольжение при раскрытии списков" (9e3e068012000000-9a3e068012000000):
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /t "REG_BINARY" /d "921a028010000000" /f
echo.

echo Выполняется отключение функции "Сохранение вида эскизов панели задач":
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\DWM" /v "AlwaysHibernateThumbnails" /t "REG_DWORD" /d "0x00000001" /f
::reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LastActiveClick" /t "REG_DWORD" /d "0x00000001" /f
::reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisablePreviewDesktop" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется отключение функции "Эффекты затухания или скольжения при обращении к меню" (9e3e068012000000-9c3e068012000000):
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /t "REG_BINARY" /d "901a028010000000" /f
echo.

echo Выполняется отключение функции "Эффекты затухания или скольжения при появлении подсказок" (9e3e068012000000-9e36068012000000):
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /t "REG_BINARY" /d "9012028010000000" /f
echo.

pause