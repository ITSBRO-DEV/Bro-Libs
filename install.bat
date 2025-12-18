@echo off
title Bro Libs Cloud Installer
color 0A

set "USERNAME=%USERNAME%"
set "BASE=C:\Users\%USERNAME%\AppData\itsbrodev"
set "CLOUD=%BASE%\Cloud"

:MENU
cls
echo ============================================
echo        Bro Libs Cloud Installer
echo ============================================
echo.
echo 1. Install Cloud
echo 2. Repair Cloud
echo 3. Exit
echo.
set /p choice="Select an option (1-3): "

if "%choice%"=="1" goto INSTALL_CONFIRM
if "%choice%"=="2" goto REPAIR_CONFIRM
if "%choice%"=="3" goto END
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

:INSTALL
cls
REM If folder exists, remove it
if exist "%BASE%" (
    rmdir /s /q "%BASE%"
)
mkdir "%CLOUD%"

set /a RANDNUM=%random% * 1000 + %random%

(
    echo version : 1
    echo key : CLOUD-1-%RANDNUM%
    echo edition : CLOUD-1
) > "%CLOUD%\Cloud.txt"

echo Installation complete!
pause
goto MENU

:REPAIR
cls
REM Remove only Cloud folder, keep base
if exist "%CLOUD%" (
    rmdir /s /q "%CLOUD%"
)
mkdir "%CLOUD%"

set /a RANDNUM=%random% * 1000 + %random%

(
    echo version : 1
    echo key : CLOUD-1-%RANDNUM%
    echo edition : CLOUD-1
) > "%CLOUD%\Cloud.txt"

echo Repair complete!
pause
goto MENU

:END
exit