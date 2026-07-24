cls
@echo off
chcp 1251 >nul
title Форматирование жёсткого диска или USB-накопителя

echo Список доступных дисков:
wmic logicaldisk where "DriveType=3" get DeviceID | find ":"
echo.

echo Список доступных съемных носителей (USB-накопителей):
wmic logicaldisk where "DriveType=2" get DeviceID | find ":"
echo.

set /p disk="Введите букву диска: "
echo.

echo Выберите файловую систему:
echo 1. NTFS
echo 2. FAT32
echo 3. exFAT
set /p fs_choice="Введите номер (1-3): "

if "%fs_choice%"=="1" set fs=NTFS
if "%fs_choice%"=="2" set fs=FAT32
if "%fs_choice%"=="3" set fs=exFAT
echo.

set /p cluster="Введите размер единицы распределения (оставьте пустым для значения по умолчанию): "
if not "%cluster%"=="" (
    set alloc=/a:%cluster%
) else (
    set alloc=
)
echo.

set /p label="Введите метку тома (оставьте пустым для без метки): "
if not "%label%"=="" (
    set vol=/v:%label%
) else (
    set vol=
)
echo.

echo Выберите способ форматирования:
echo 1. Быстрое форматирование (очистка оглавления)
echo 2. Полное форматирование
set /p fmt_choice="Введите номер (1-2): "

if "%fmt_choice%"=="1" set fmt=/q
if "%fmt_choice%"=="2" set fmt=
echo.

echo Вы выбрали: диск %disk%, файловая система %fs%, %fmt_choice%-е форматирование
set /p confirm="Продолжить? (y/n): "
if /i not "%confirm%"=="y" goto :eof
echo.

echo Выполняется форматирование диска…
format %disk%: /fs:%fs% %fmt% %vol% %alloc% /y
echo.

pause