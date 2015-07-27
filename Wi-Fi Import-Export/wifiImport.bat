@echo off
goto check_Permissions

:check_Permissions
    echo Administrative permissions required. Detecting permissions...

    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Success: Administrative permissions confirmed.
        goto import_WiFi
    ) else (
        echo Failure: Current permissions inadequate. Please run this script as an Administrator.
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
