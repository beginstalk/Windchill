@echo off
setlocal enabledelayedexpansion

REM Set environment variables for Windchill
set "WINDCHILL_URL=%WINDCHILL_URL%"
set "WINDCHILL_USERNAME=%WINDCHILL_USERNAME%"
set "WINDCHILL_PASSWORD=%WINDCHILL_PASSWORD%"
set "WINDCHILL_HOME=C:\ptc\Windchill_12.1\Windchill"
set "JAVA_HOME=C:\Program Files\Java\jdk-11.0.12"
set "ANT_HOME=C:\ptc\Windchill_12.1\Windchill\ant"
set "PATH=%JAVA_HOME%\bin;%WINDCHILL_HOME%\bin;%ANT_HOME%\bin;%PATH%"


set "FILES=%FILES%"
set "BUILD_TYPE=%BUILD_TYPE%"
set "PREFIX=C:/actions-runner/_work/Windchill/Windchill/"

if "!BUILD_TYPE!"=="full" (
     for %%i in (%FILES%) do (
            set "FILE=%%i"
            windchill wt.load.LoadFromFile -u wcadmin -p wcadmin -d !FILE!
    )
) else (
    for %%i in (%FILES%) do (
        set "FILE=%%i"
        set "START_WITH=!FILE:~0,23!"
        echo !FILE!
        if "!START_WITH!"=="loadFiles/com/accenture" (
            set "FULL_FILE_NAME=%PREFIX%%%i"
            windchill wt.load.LoadFromFile -u wcadmin -p wcadmin -d !FULL_FILE_NAME!
        )
    )
)
endlocal