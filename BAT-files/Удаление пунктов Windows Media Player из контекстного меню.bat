cls
@echo off
chcp 1251 >nul
title Удаление пунктов Windows Media Player из контекстного меню

echo Выполняется удаление пункта "Добавить в список воспроизведения проигрывателя Windows Media":
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\audio\shell\Enqueue" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\Directory.Audio\shell\Enqueue" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\Directory.Image\shell\Enqueue" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\Directory.Video\shell\Enqueue" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\video\shell\Enqueue" /f
echo.

echo Выполняется удаление пункта "Воспроизвести с помощью проигрывателя Windows Media":
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\audio\shell\Play" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\Directory.Audio\shell\Play" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\Directory.Image\shell\Play" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\Directory.Video\shell\Play" /f
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\video\shell\Play" /f
echo.

pause