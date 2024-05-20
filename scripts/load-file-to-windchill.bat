@echo off
setlocal
 
REM Variables
set "WINDCHILL_URL=%WINDCHILL_URL%"
set "WINDCHILL_USERNAME=%WINDCHILL_USERNAME%"
set "WINDCHILL_PASSWORD=%WINDCHILL_PASSWORD%"
 
REM Commands to load a file into Windchill
REM These commands will vary based on how you load files into your Windchill application
 
echo Loading file into Windchill server at %WINDCHILL_URL%
 
REM Example command to load a file into Windchill
REM Modify the below command based on your specific Windchill API and requirements
curl -H "CSRF_NONCE: +IEe4l0Y3Bf/pKqKqddVrwdzkXq17eXavPZpgxZZsG25lv7DtfJOhjtM7Hmc5frdlLRfmjVptyrFlZ27zrMu1m4o7yXHkpC4nblHtz9u93bIz8fjkNFaoHZijSKn/MHBtM0usWU3tGO1lf3Aoc4uhxJv4Q==" -u "%WINDCHILL_USERNAME%:%WINDCHILL_PASSWORD%" -X POST "%WINDCHILL_URL%/Windchill/servlet/odata" -F "file=@C:\\Users\\cicduser\\Documents\\GitHub\\Windchill\\loadFiles\\com\\accenture\\preferences\\create_TML_PreferenceDefinitions.xml"
 
REM windchill wt.load.LoadFromFile -d loadFiles/com/accenture/preferences/customPrefLoader.xml -u [site-admin] -p [site-admin-secret] -CONT_PATH /
echo File load complete
 
endlocal
