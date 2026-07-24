cls
@echo off
chcp 1251 >nul
title Активация Internet Download Manager

echo Выполняется корректировка в разделе "HKEY_CURRENT_USER\Software\Classes\CLSID\":
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{436D67E1-2FB3-4A6C-B3CD-FF8A41B0664D}" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{5312C54E-A385-46B7-B200-ABAF81B03935}" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{9C9D53D4-A978-43FC-93E2-1C21B529E6D7}" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671}" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{E6871B76-C3C8-44DD-B947-ABFFE144860D}" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{E8CF4E59-B7A3-41F2-86C7-82B03334F22A}" /f
echo.

echo Выполняется корректировка в разделе "HKEY_CURRENT_USER\Software\Classes\Wow6432Node\CLSI\":
reg delete "HKEY_CURRENT_USER\Software\Classes\Wow6432Node\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\Wow6432Node\CLSID\{436D67E1-2FB3-4A6C-B3CD-FF8A41B0664D}" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\Wow6432Node\CLSID\{5312C54E-A385-46B7-B200-ABAF81B03935}" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\Wow6432Node\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\Wow6432Node\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\Wow6432Node\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\Wow6432Node\CLSID\{9C9D53D4-A978-43FC-93E2-1C21B529E6D7}" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\Wow6432Node\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671}" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\Wow6432Node\CLSID\{E6871B76-C3C8-44DD-B947-ABFFE144860D}" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\Wow6432Node\CLSID\{E8CF4E59-B7A3-41F2-86C7-82B03334F22A}" /f
echo.

echo Выполняется корректировка в разделе "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\":
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{436D67E1-2FB3-4A6C-B3CD-FF8A41B0664D}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{5312C54E-A385-46B7-B200-ABAF81B03935}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{9C9D53D4-A978-43FC-93E2-1C21B529E6D7}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{E6871B76-C3C8-44DD-B947-ABFFE144860D}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{E8CF4E59-B7A3-41F2-86C7-82B03334F22A}" /f
echo.

echo Выполняется корректировка в разделе "HKEY_LOCAL_MACHINE\Software\Classes\Wow6432Node\CLSID\":
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\Wow6432Node\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\Wow6432Node\CLSID\{436D67E1-2FB3-4A6C-B3CD-FF8A41B0664D}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\Wow6432Node\CLSID\{5312C54E-A385-46B7-B200-ABAF81B03935}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\Wow6432Node\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\Wow6432Node\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\Wow6432Node\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\Wow6432Node\CLSID\{9C9D53D4-A978-43FC-93E2-1C21B529E6D7}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\Wow6432Node\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\Wow6432Node\CLSID\{E6871B76-C3C8-44DD-B947-ABFFE144860D}" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Classes\Wow6432Node\CLSID\{E8CF4E59-B7A3-41F2-86C7-82B03334F22A}" /f
echo.

echo Выполняется корректировка в разделе "HKEY_USER\.DEFAULT\Software\Classes\CLSID\":
reg delete "HKEY_USER\.DEFAULT\Software\Classes\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f
reg delete "HKEY_USER\.DEFAULT\Software\Classes\CLSID\{436D67E1-2FB3-4A6C-B3CD-FF8A41B0664D}" /f
reg delete "HKEY_USER\.DEFAULT\Software\Classes\CLSID\{5312C54E-A385-46B7-B200-ABAF81B03935}" /f
reg delete "HKEY_USER\.DEFAULT\Software\Classes\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}" /f
reg delete "HKEY_USER\.DEFAULT\Software\Classes\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}" /f
reg delete "HKEY_USER\.DEFAULT\Software\Classes\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}" /f
reg delete "HKEY_USER\.DEFAULT\Software\Classes\CLSID\{9C9D53D4-A978-43FC-93E2-1C21B529E6D7}" /f
reg delete "HKEY_USER\.DEFAULT\Software\Classes\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671}" /f
reg delete "HKEY_USER\.DEFAULT\Software\Classes\CLSID\{E6871B76-C3C8-44DD-B947-ABFFE144860D}" /f
reg delete "HKEY_USER\.DEFAULT\Software\Classes\CLSID\{E8CF4E59-B7A3-41F2-86C7-82B03334F22A}" /f
echo.

echo Выполняется корректировка в разделе "HKEY_USER\.DEFAULT\Software\Classes\Wow6432Node\CLSID\":
reg delete "HKEY_USER\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7}" /f
reg delete "HKEY_USER\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{436D67E1-2FB3-4A6C-B3CD-FF8A41B0664D}" /f
reg delete "HKEY_USER\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{5312C54E-A385-46B7-B200-ABAF81B03935}" /f
reg delete "HKEY_USER\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C}" /f
reg delete "HKEY_USER\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192}" /f
reg delete "HKEY_USER\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC}" /f
reg delete "HKEY_USER\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{9C9D53D4-A978-43FC-93E2-1C21B529E6D7}" /f
reg delete "HKEY_USER\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671}" /f
reg delete "HKEY_USER\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{E6871B76-C3C8-44DD-B947-ABFFE144860D}" /f
reg delete "HKEY_USER\.DEFAULT\Software\Classes\Wow6432Node\CLSID\{E8CF4E59-B7A3-41F2-86C7-82B03334F22A}" /f
echo.

echo Выполняется удаление раздела Internet Download Manager":
reg delete "HKEY_LOCAL_MACHINE\Software\Wow6432Node\Internet Download Manager" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Internet Download Manager" /f
reg delete "HKEY_CURRENT_USER\Software\Wow6432Node\DownloadManager" /f
echo.

echo Выполняется корректировка в разделе "HKEY_CURRENT_USER\Software\DownloadManager\":
reg delete "HKEY_CURRENT_USER\Software\DownloadManager" /v "Email" /f
reg delete "HKEY_CURRENT_USER\Software\DownloadManager" /v "Serial" /f
reg delete "HKEY_CURRENT_USER\Software\DownloadManager" /v "scansk" /f
reg delete "HKEY_CURRENT_USER\Software\DownloadManager" /v "Model" /f
reg delete "HKEY_CURRENT_USER\Software\DownloadManager" /v "MData" /f
reg delete "HKEY_CURRENT_USER\Software\DownloadManager" /v "Therad" /f
reg delete "HKEY_CURRENT_USER\Software\DownloadManager" /v "tvfrdt" /f
reg delete "HKEY_CURRENT_USER\Software\DownloadManager" /v "LstCheck" /f
reg delete "HKEY_CURRENT_USER\Software\DownloadManager" /v "CheckUpdtVM" /f
reg delete "HKEY_CURRENT_USER\Software\DownloadManager" /v "radxcnt" /f
reg delete "HKEY_CURRENT_USER\Software\DownloadManager" /v "ptrk_scdt" /f
reg delete "HKEY_CURRENT_USER\Software\DownloadManager" /v "LastCheckQU" /f
reg add "HKEY_CURRENT_USER\Software\DownloadManager" /v "FName" /t "REG_SZ" /d "User" /f
reg add "HKEY_CURRENT_USER\Software\DownloadManager" /v "LaunchOnStart" /t "REG_DWORD" /d "0x00000000" /f
reg add "HKEY_CURRENT_USER\Software\DownloadManager" /v "LName" /t "REG_SZ" /d "" /f
reg add "HKEY_CURRENT_USER\Software\DownloadManager" /v "nLst" /t "REG_DWORD" /d "0x00000000" /f
echo.