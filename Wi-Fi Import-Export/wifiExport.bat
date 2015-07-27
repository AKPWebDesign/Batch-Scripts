@echo off
goto check_Permissions

:check_Permissions
    echo Administrative permissions required. Detecting permissions...

    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Success: Administrative permissions confirmed.
        goto export_WiFi
    ) else (
        echo Failure: Current permissions inadequate. Please run this script as an Administrator.
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
