@echo off
goto check_Permissions

:check_Permissions
    net session >nul 2>&1
    if %errorLevel% == 0 (
        goto import_WiFi
    ) else (
        echo Administrator permissions are required. Please re-run this script as an Administrator.
    )

    pause >nul
    exit

:import_WiFi
    echo Importing Wi-Fi settings...
    cd "%~dp0"
    for /r %%i in (*.xml) do netsh wlan add profile filename="%%i"
    echo Done!
    pause >nul
    exit
