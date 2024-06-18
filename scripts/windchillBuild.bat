@echo off
REM ============================================================
REM Batch file to load files into Windchill
REM ============================================================
 
REM Set environment variables for Windchill
set "WINDCHILL_URL=%WINDCHILL_URL%"
set "WINDCHILL_USERNAME=%WINDCHILL_USERNAME%"
set "WINDCHILL_PASSWORD=%WINDCHILL_PASSWORD%"
set "WINDCHILL_HOME=C:\ptc\Windchill_12.1\Windchill"
set "JAVA_HOME=C:\Program Files\Java\jdk-11.0.12"
set "ANT_HOME=C:\ptc\Windchill_12.1\Windchill\ant"
set "PATH=%JAVA_HOME%\bin;%WINDCHILL_HOME%\bin;%ANT_HOME%\bin;%PATH%"

REM Log the start time
echo ------------------------------------------------------------
 
xcopy /y/i/s "C:\\actions-runner\\_work\\Windchill\\Windchill\\src" "C:\\ptc\\Windchill_12.1\\Windchill\\src"
xcopy /y/i/s "C:\\actions-runner\\_work\\Windchill\\Windchill\\codebase" "C:\\ptc\\Windchill_12.1\\Windchill\\codebase"

echo Running ant
call ant -f %WINDCHILL_HOME%/bin/tools.xml class -Dclass.includes=com/accenture/*.java

@REM echo Running xconfmanager
@REM call xconfmanager -t C:/ptc/Windchill_12.1/Windchill/codebase/service.properties -s wt.services/svc/default/com.ptc.core.components.descriptor.DataUtility/customTextID/java.lang.Object/0=com.accenture.AttributeTextAreaDataUtility/singleton -p

@REM echo Before restarting windchill
@REM (windchill stop || echo Windchill restarting) && windchill start
@REM ping 127.0.0.1 -n 300 > nul
@REM echo windchill restarted


echo ------------------------------------------------------------
 
REM Check for errors
IF %ERRORLEVEL% NEQ 0 (
    echo Error occurred during file load process. Check the logs for more details.
    exit /b 1
)
 
exit /b 0
