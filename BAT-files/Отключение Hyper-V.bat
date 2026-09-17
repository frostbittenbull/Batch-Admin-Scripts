cls
@echo off
chcp 1251 >nul
title Отключение Hyper-V

echo Выполняется отключение служб "Hyper-V":

echo Выполняется отключение компонента "Hyper-V"
dism /online /disable-feature /featurename:Microsoft-Hyper-V-All
dism /online /disable-feature /featurename:Microsoft-Hyper-V-Hypervisor
bcdedit /set hypervisorlaunchtype off

echo Выполняется отключение службы "Служба виртуализации удаленных рабочих столов Hyper-V":
sc stop vmicrdv
sc config vmicrdv start=disabled
echo.

echo Выполняется отключение службы "Служба завершения работы в качестве гостя (Hyper-V)":
sc stop vmicshutdown
sc config vmicshutdown start=disabled
echo.

echo Выполняется отключение службы "Служба обмена данными (Hyper-V)":
sc stop vmickvpexchange
sc config vmickvpexchange start=disabled
echo.

echo Выполняется отключение службы "Служба пульса (Hyper-V)":
sc stop vmicheartbeat
sc config vmicheartbeat start=disabled
echo.

echo Выполняется отключение службы "Служба сеансов виртуальных машин Hyper-V":
sc stop vmms
sc config vmms start=disabled
echo.

echo Выполняется отключение службы "Служба синхронизации времени Hyper-V":
sc stop vmictimesync
sc config vmictimesync start=disabled
echo.
pause