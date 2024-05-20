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
curl -H "Content-Type: multipart/form-data" -H "CSRF_NONCE: VPDkEy4EFPQIIyblBaavXnRvWZlCamm1EIeTcmVFeI5OEXKsGYO0d0hQJJprYnayOMWla0Z1f8kyEhHUYsLUJx00J8YwFRzXMci9RkxyP5U/SEuMPKCgUQV+RcFQe02uGLzUQBYrfIBCEnGvDb/UdmFzKQ==" -u "%WINDCHILL_USERNAME%:%WINDCHILL_PASSWORD%" -X POST "%WINDCHILL_URL%/Windchill/servlet/odata" -F "file=@C:\\Users\\cicduser\\Documents\\GitHub\\Windchill\\loadFiles\\com\\accenture\\preferences\\create_TML_PreferenceDefinitions.xml"
 
REM windchill wt.load.LoadFromFile -d loadFiles/com/accenture/preferences/customPrefLoader.xml -u [site-admin] -p [site-admin-secret] -CONT_PATH /
echo File load complete
 
endlocal
