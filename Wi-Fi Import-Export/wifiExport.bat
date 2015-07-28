@echo off
goto check_Permissions

:check_Permissions
    net session >nul 2>&1
    if %errorLevel% == 0 (
        goto export_WiFi
    ) else (
        echo Administrator permissions are required. Please re-run this script as an Administrator.
    )

    pause >nul
    exit

:export_WiFi
    echo Exporting Wi-Fi settings...
    cd "%~dp0"
    netsh wlan export profile key=clear
    echo Done!
    pause >nul
    exit
