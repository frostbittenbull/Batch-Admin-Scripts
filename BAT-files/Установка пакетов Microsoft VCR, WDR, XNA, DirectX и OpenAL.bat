cls
@echo off
chcp 1251 >nul
title Установка пакетов Microsoft Visual C++ Redistributable, Windows Desktop Runtime, XNA Framework Redistributable, DirectX и OpenAL

echo Выполняется установка пакетов "Microsoft Visual C++ Redistributable (x86)":
winget install --id=Microsoft.VCRedist.2005.x86 --accept-source-agreements --accept-package-agreements --silent -e
winget install --id=Microsoft.VCRedist.2008.x86 --accept-source-agreements --accept-package-agreements --silent -e
winget install --id=Microsoft.VCRedist.2010.x86 --accept-source-agreements --accept-package-agreements --silent -e
winget install --id=Microsoft.VCRedist.2012.x86 --accept-source-agreements --accept-package-agreements --silent -e
winget install --id=Microsoft.VCRedist.2013.x86 --accept-source-agreements --accept-package-agreements --silent -e
winget install --id=Microsoft.VCRedist.2015+.x86 --accept-source-agreements --accept-package-agreements --silent -e
echo.

echo Выполняется установка пакетов "Microsoft Visual C++ Redistributable (x64)":
winget install --id=Microsoft.VCRedist.2005.x64 --accept-source-agreements --accept-package-agreements --silent -e
winget install --id=Microsoft.VCRedist.2008.x64 --accept-source-agreements --accept-package-agreements --silent -e
winget install --id=Microsoft.VCRedist.2010.x64 --accept-source-agreements --accept-package-agreements --silent -e
winget install --id=Microsoft.VCRedist.2012.x64 --accept-source-agreements --accept-package-agreements --silent -e
winget install --id=Microsoft.VCRedist.2013.x64 --accept-source-agreements --accept-package-agreements --silent -e
winget install --id=Microsoft.VCRedist.2015+.x64 --accept-source-agreements --accept-package-agreements --silent -e
echo.

echo Выполняется установка пакета "Microsoft Visual Basic Runtime":
winget install --id=Microsoft.VisualBasic.Runtime --accept-source-agreements --accept-package-agreements --silent -e
echo.

echo Выполняется установка пакета "Microsoft Windows Desktop Runtime (x64)":
winget install --id=Microsoft.DotNet.DesktopRuntime.6 --accept-source-agreements --accept-package-agreements --silent -e
echo.

echo Выполняется установка пакета "Microsoft XNA Framework Redistributable 4.0":
winget install --id=Microsoft.XNA.Framework.4 --accept-source-agreements --accept-package-agreements --silent -e
winget install --id=Microsoft.XNARedist --accept-source-agreements --accept-package-agreements --silent -e
echo.

echo Выполняется установка пакета "DirectX":
winget install --id=Microsoft.DirectX --accept-source-agreements --accept-package-agreements --silent -e
echo.

echo Выполняется установка пакета "OpenAL":
winget install --id=CreativeTechnology.OpenAL --accept-source-agreements --accept-package-agreements --silent -e
echo.

pause