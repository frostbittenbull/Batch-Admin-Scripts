cls
@echo off
chcp 1251 >nul
title Отключение службы BitLocker и автоматического шифрования дисков при установке Windows

echo Выполняется отключение служб "BitLocker":

echo Выполняется отключение автоматического шифрования конкретных томов дисков:
manage-bde -off C:
manage-bde -off D:
manage-bde -off E:
echo.

echo Выполняется отключение службы "Служба шифрования дисков BitLocker":
sc stop BDESVC
sc config BDESVC start=disabled
echo.

echo Выполняется отключение автоматического шифрования дисков "BitLocker" при установке Windows:
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\BitLocker" /v "PreventDeviceEncryption" /t "REG_DWORD" /d "0x00000001" /f
echo.

echo Выполняется удаление пунктов "BitLocker" из контекстного меню запоминающих устройств:
reg delete "HKEY_CLASSES_ROOT\Drive\shell\encrypt-bde" /f
reg delete "HKEY_CLASSES_ROOT\Drive\shell\encrypt-bde-elev" /f
reg delete "HKEY_CLASSES_ROOT\Drive\shell\manage-bde" /f
reg delete "HKEY_CLASSES_ROOT\Drive\shell\resume-bde" /f
reg delete "HKEY_CLASSES_ROOT\Drive\shell\resume-bde-elev" /f
reg delete "HKEY_CLASSES_ROOT\Drive\shell\unlock-bde" /f
echo.

pause