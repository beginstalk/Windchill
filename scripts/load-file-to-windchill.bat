@echo off
setlocal
 
REM Variables
set "WINDCHILL_URL=%WINDCHILL_URL%"
set "WINDCHILL_USERNAME=%WINDCHILL_USERNAME%"
set "WINDCHILL_PASSWORD=%WINDCHILL_PASSWORD%"
set "WINDCHILL_HOME=C:\ptc\Windchill_12.1\Windchill"
set "JAVA_HOME=C:\Program Files\Amazon Corretto\jdk11.0.20_9"
set "PATH=%JAVA_HOME%\bin;%WINDCHILL_HOME%\bin;%PATH%"
 
REM Commands to load a file into Windchill
REM These commands will vary based on how you load files into your Windchill application
 
echo Loading file into Windchill server at %WINDCHILL_URL%
 
REM Example command to load a file into Windchill
REM Modify the below command based on your specific Windchill API and requirements
set "FILES_TO_LOAD=C:\\Users\\cicduser\\Documents\\GitHub\\Windchill\\loadFiles\\com\\accenture\\preferences\\create_TML_PreferenceDefinitions.xml"





REM Log the start time
echo Starting file load process at %date% %time%
echo ------------------------------------------------------------
 
REM Example command to load a tml file
REM windchill wt.load.LoadFromFile -u %WINDCHILL_USERNAME% -p %WINDCHILL_PASSWORD% -f %FILES_TO_LOAD%
 
REM Log the end time
echo File load process completed at %date% %time%
echo ------------------------------------------------------------
 
REM Check for errors
IF %ERRORLEVEL% NEQ 0 (
    echo Error occurred during file load process. Check the logs for more details.
    exit /b 1
)
 
exit /b 0



REM curl -u "%WINDCHILL_USERNAME%:%WINDCHILL_PASSWORD%" -X POST "%WINDCHILL_URL%/Windchill/servlet/odata" -F "file=@C:\\Users\\cicduser\\Documents\\GitHub\\Windchill\\loadFiles\\com\\accenture\\preferences\\create_TML_PreferenceDefinitions.xml"
REM windchill wt.load.LoadFromFile -d loadFiles/com/accenture/preferences/customPrefLoader.xml -u [site-admin] -p [site-admin-secret] -CONT_PATH /
REM echo File load complete
 
endlocal
