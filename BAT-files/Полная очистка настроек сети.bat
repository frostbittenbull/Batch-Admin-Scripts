cls
@echo off
chcp 1251 >nul
title Полная очистка настроек сети

echo Выполняется сброс TCP/IP
netsh int ip reset
echo.

echo Выполняется сброс Winsock (сетевых библиотек)
netsh winsock reset
echo.

echo Выполняется сброс настроек IPv4 и IPv6
netsh interface ipv4 reset
netsh interface ipv6 reset
echo.

echo Выполняется сброс политики брандмауэра
netsh advfirewall reset
echo.

echo Выполняется очистка кэша DNS
ipconfig /flushdns
echo.

echo Выполняется освобождение и обновление IP-адресов
ipconfig /release
ipconfig /renew
echo.

echo Выполняется сброс DNS для всех адаптеров
for /f "skip=3 tokens=1,* delims=:" %%A in ('netsh interface show interface') do (
    for /f "tokens=* delims= " %%I in ("%%B") do (
        echo Выполняется сброс DNS для адаптера: %%I
        netsh interface ip set dns name="%%I" source=dhcp >nul
    )
)
echo.

echo Далее будет произведена перезагрузка компьютера.
echo Если вам это не нужно, закройте BAT-файл (окно "Командной строки").
echo Если вам это нужно, нажмите клавишу "Enter".
echo.

>nul pause

echo Выполняется перезагрузка компьютера:
shutdown /r /t 0
echo.

pause