cls
@echo off
chcp 1251 >nul
title Создание пустого файла "hosts" без атрибута "только для чтения"

echo Выполняется создание пустого файла "hosts" без атрибута "только для чтения":
cd.>%SystemRoot%\System32\drivers\etc\hosts
ATTRIB -R -H %SystemRoot%\System32\drivers\etc\hosts
echo.

Pause