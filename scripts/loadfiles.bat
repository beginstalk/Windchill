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

 
REM Define the path to the files to be loaded
@REM set "FILES_TO_LOAD1=C:\\actions-runner\\_work\Windchill\\Windchill\\loadFiles\\com\\accenture\\type\\WTDocument_0.xml"
@REM set "FILES_TO_LOAD2=C:\\actions-runner\\_work\Windchill\\Windchill\\loadFiles\\com\\accenture\\type\\WTDocument_1.xml"
@REM set "FILES_TO_LOAD3=C:\\actions-runner\\_work\Windchill\\Windchill\\loadFiles\\com\\accenture\\type\\WTDocument_2.xml"

REM Log the start time
echo Starting file load process at %date% %time%
echo ------------------------------------------------------------
 
REM Example command to load a tml file
@REM windchill wt.load.LoadFromFile -u %WINDCHILL_USERNAME% -p %WINDCHILL_PASSWORD% -d %FILES_TO_LOAD1%
@REM windchill wt.load.LoadFromFile -u %WINDCHILL_USERNAME% -p %WINDCHILL_PASSWORD% -d %FILES_TO_LOAD2%
@REM windchill wt.load.LoadFromFile -u %WINDCHILL_USERNAME% -p %WINDCHILL_PASSWORD% -d %FILES_TO_LOAD3%

xcopy /y/i/s "C:\\actions-runner\\_work\\Windchill\\Windchill\\src" "C:\\ptc\\Windchill_12.1\\Windchill\\src"

set "FILES_TO_LOAD=C:\\actions-runner\\_work\\Windchill\\Windchill\\loadFile.xml"

@REM windchill -v wt.load.LoadFileSet -file %FILES_TO_LOAD% -descr "Loading multiple files" -UNATTENDED -NOSERVERSTOP

echo Before running ant
call ant -f %WINDCHILL_HOME%/bin/tools.xml class -Dclass.includes=com/accenture/*.java
echo After running ant

echo Before running xconfmanager
call xconfmanager -t C:/ptc/Windchill_12.1/Windchill/codebase/service.properties -s wt.services/svc/default/com.ptc.core.components.descriptor.DataUtility/customTextID/java.lang.Object/0=com.accenture.AttributeTextAreaDataUtility/singleton -p
echo After running xconfmanager

echo Before restarting windchill
(windchill stop || echo Windchill not running) && start /wait windchill start


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
