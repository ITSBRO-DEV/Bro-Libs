@echo off
title Bro Libs Cloud Installer V2
color 0A

set "USERNAME=%USERNAME%"
set "BASE=C:\Users\%USERNAME%\AppData\itsbrodev"
set "CLOUD=%BASE%\Cloud"

:MENU
cls
echo ============================================
echo        Bro Libs Cloud Installer V2
echo ============================================
echo.
echo 1. Install Cloud
echo 2. Repair Cloud
echo 3. Upgrade Cloud
echo 4. Exit
echo.
set /p choice="Select an option (1-4): "

if "%choice%"=="1" goto INSTALL_CONFIRM
if "%choice%"=="2" goto REPAIR_CONFIRM
if "%choice%"=="3" goto UPGRADE_CONFIRM
if "%choice%"=="4" goto END
goto MENU

:INSTALL_CONFIRM
cls
echo Are You Sure That You Want To Install Bro Libs Cloud?
echo.
echo 1. Yes
echo 2. No
echo.
set /p ans="Select (1-2): "
if "%ans%"=="1" goto INSTALL
if "%ans%"=="2" goto MENU
goto INSTALL_CONFIRM

:REPAIR_CONFIRM
cls
if not exist "%CLOUD%" (
    echo Cloud folder does not exist. Nothing to repair.
    pause
    goto MENU
)
echo Are You Sure That You Want To Repair Bro Libs Cloud?
echo.
echo 1. Yes
echo 2. No
echo.
set /p ans="Select (1-2): "
if "%ans%"=="1" goto REPAIR
if "%ans%"=="2" goto MENU
goto REPAIR_CONFIRM

:UPGRADE_CONFIRM
cls
if not exist "%CLOUD%\Cloud.txt" (
    echo No Cloud.txt found. Cannot upgrade.
    pause
    goto MENU
)

findstr /C:"Version : 1" "%CLOUD%\Cloud.txt" >nul
if %errorlevel%==0 (
    echo Upgrade Bro Libs Cloud from Version 1 to Version 2?
    echo.
    echo 1. Yes
    echo 2. No
    echo.
    set /p ans="Select (1-2): "
    if "%ans%"=="1" goto UPGRADE
    if "%ans%"=="2" goto MENU
    goto UPGRADE_CONFIRM
) else (
    echo You Dont Have Version 1 installed!
    pause
    goto MENU
)

:INSTALL
cls
if exist "%CLOUD%" (
    rmdir /s /q "%CLOUD%"
)
mkdir "%CLOUD%" || goto INSTALL_FAIL

(
    echo Version : 2
    echo Cloud-Key: Bro-Libs-%random%
    echo Edition : Bro-Libs-Pancake
    echo Creator : itsBRODEV
    echo.
    echo Install : Good
    echo Usable : Yes
) > "%CLOUD%\Cloud.txt" || goto INSTALL_FAIL

echo Installation complete!
pause
goto MENU

:INSTALL_FAIL
cls
(
    echo Version : 2
    echo Cloud-Key: Bro-Libs-%random%
    echo Edition : Bro-Libs-Pancake
    echo Creator : itsBRODEV
    echo.
    echo Install : Failed
    echo Usable : No
) > "%CLOUD%\Cloud.txt"

echo Installation failed due to errors!
pause
goto MENU

:REPAIR
cls
if exist "%CLOUD%" (
    rmdir /s /q "%CLOUD%"
)
mkdir "%CLOUD%" || goto REPAIR_FAIL

(
    echo Version : 2
    echo Cloud-Key: Bro-Libs-%random%
    echo Edition : Bro-Libs-Pancake
    echo Creator : itsBRODEV
    echo.
    echo Install : Good
    echo Usable : Yes
) > "%CLOUD%\Cloud.txt" || goto REPAIR_FAIL

echo Repair complete!
pause
goto MENU

:REPAIR_FAIL
cls
(
    echo Version : 2
    echo Cloud-Key: Bro-Libs-%random%
    echo Edition : Bro-Libs-Pancake
    echo Creator : itsBRODEV
    echo.
    echo Install : Failed
    echo Usable : No
) > "%CLOUD%\Cloud.txt"

echo Repair failed due to errors!
pause
goto MENU

:UPGRADE
cls
(
    echo Version : 2
    echo Cloud-Key: Bro-Libs-%random%
    echo Edition : Bro-Libs-Pancake
    echo Creator : itsBRODEV
    echo.
    echo Install : Good
    echo Usable : Yes
) > "%CLOUD%\Cloud.txt"

echo Upgrade complete! Cloud is now V2.
pause
goto MENU

:END
exit /b