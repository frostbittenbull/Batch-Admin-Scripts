cls
@echo off
chcp 1251 >nul
title Инверсная схема указателя мыши

echo Выполняется применение инверсной схемы указателя мыши (для тех, кто использует темную тему Windows):
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /ve /t "REG_SZ" /d "Инверсная" /f

reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "AppStarting" /t "REG_SZ" /d "%%SystemRoot%%\cursors\wait_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Arrow" /t "REG_SZ" /d "%%SystemRoot%%\cursors\arrow_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Crosshair" /t "REG_SZ" /d "%%SystemRoot%%\cursors\cross_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Hand" /t "REG_SZ" /d "%%SystemRoot%%\cursors\aero_link_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Help" /t "REG_SZ" /d "%%SystemRoot%%\cursors\help_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "IBeam" /t "REG_SZ" /d "%%SystemRoot%%\cursors\beam_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "No" /t "REG_SZ" /d "%%SystemRoot%%\cursors\no_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "NWPen" /t "REG_SZ" /d "%%SystemRoot%%\cursors\pen_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Person" /t "REG_SZ" /d "%%SystemRoot%%\cursors\person_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Pin" /t "REG_SZ" /d "%%SystemRoot%%\cursors\pin_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "SizeAll" /t "REG_SZ" /d "%%SystemRoot%%\cursors\move_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "SizeNESW" /t "REG_SZ" /d "%%SystemRoot%%\cursors\size1_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "SizeNS" /t "REG_SZ" /d "%%SystemRoot%%\cursors\size4_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "SizeNWSE" /t "REG_SZ" /d "%%SystemRoot%%\cursors\size2_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "SizeWE" /t "REG_SZ" /d "%%SystemRoot%%\cursors\size3_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "UpArrow" /t "REG_SZ" /d "%%SystemRoot%%\cursors\up_i.cur" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Wait" /t "REG_SZ" /d "%%SystemRoot%%\cursors\busy_i.cur" /f

reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "ContactVisualization" /t "REG_DWORD" /d "0x00000001" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "CursorBaseSize" /t "REG_DWORD" /d "0x00000020" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "GestureVisualization" /t "REG_DWORD" /d "0x0000001f" /f
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "Scheme Source" /t "REG_DWORD" /d "0x00000002" /f
echo.

pause