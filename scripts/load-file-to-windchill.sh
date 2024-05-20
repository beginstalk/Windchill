#!/bin/bash
set -e

# Variables
WINDCHILL_URL=${WINDCHILL_URL}
WINDCHILL_USERNAME=${WINDCHILL_USERNAME}
WINDCHILL_PASSWORD=${WINDCHILL_PASSWORD}

# Commands to load a file into Windchill
# These commands will vary based on how you load files into your Windchill application

echo "Loading file into Windchill server at ${WINDCHILL_URL}"

# Example command to load a file into Windchill
# Modify the below command based on your specific Windchill API and requirements
curl -u "${WINDCHILL_USERNAME}:${WINDCHILL_PASSWORD}" -X POST "${WINDCHILL_URL}/Windchill/servlet/odata" -F "file=@C:/Users/cicduser/Documents/GitHub/Windchill/loadFiles/com/accenture/preferences/create_TML_PreferenceDefinitions"
# windchill wt.load.LoadFromFile -d loadFiles/com/accenture/preferences/customPrefLoader.xml -u [site-admin] -p [site-admin-secret] -CONT_PATH /
echo "File load complete"
