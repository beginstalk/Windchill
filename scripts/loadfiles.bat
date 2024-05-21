@echo off
REM ============================================================
REM Batch file to load files into Windchill
REM ============================================================
 
REM Set environment variables for Windchill
set "WINDCHILL_URL=%WINDCHILL_URL%"
set "WINDCHILL_USERNAME=%WINDCHILL_USERNAME%"
set "WINDCHILL_PASSWORD=%WINDCHILL_PASSWORD%"
set "WINDCHILL_HOME=C:\ptc\Windchill_12.1\Windchill"
set "JAVA_HOME=C:\Program Files\Amazon Corretto\jdk11.0.20_9"
set "PATH=%JAVA_HOME%\bin;%WINDCHILL_HOME%\bin;%PATH%"
 
REM Define the path to the files to be loaded
set "FILES_TO_LOAD=C:\\Users\\cicduser\\Documents\\GitHub\\Windchill\\loadFiles\\com\\accenture\\preferences\\create_TML_PreferenceDefinitions.xml"
 
REM Log the start time
echo Starting file load process at %date% %time%
echo ------------------------------------------------------------
 
REM Example command to load a tml file
windchill wt.load.LoadFromFile -u %WINDCHILL_USERNAME% -p %WINDCHILL_PASSWORD% -f %FILES_TO_LOAD%
 
REM Add additional commands as needed for other file types or operations
 
REM Log the end time
echo File load process completed at %date% %time%
echo ------------------------------------------------------------
 
REM Check for errors
IF %ERRORLEVEL% NEQ 0 (
    echo Error occurred during file load process. Check the logs for more details.
    exit /b 1
)
 
exit /b 0
