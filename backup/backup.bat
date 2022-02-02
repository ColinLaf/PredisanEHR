@ECHO OFF
ECHO Running database backup command....
ECHO OpenMRS...
ECHO.
ssh root@127.0.0.1 -p 2222 "bahmni -i local backup --backup_type=db --options=openmrs > /dev/null"
ECHO Completed.
ECHO. && ECHO Bahmni... && ECHO.
ssh root@127.0.0.1 -p 2222 "bahmni -i local backup --backup_type=db --options=bahmni_reports > /dev/null"
ECHO Completed.
ECHO.
ECHO Running artifact backup command....
ECHO.
ssh root@127.0.0.1 -p 2222 "bahmni -i local backup --backup_type=file --options=all > /dev/null"
ECHO Completed.
ECHO.
ECHO Deleting old database files...
rmdir /s data
ECHO Pulling new database files...
ECHO.
scp -P 2222 -r root@127.0.0.1:/data ./data
ECHO Completed
ECHO.
ECHO Deleting old artifact files...
rmdir /s artifacts
ECHO Pulling new artifact files...
ECHO.
scp -P 2222 -r root@127.0.0.1:/mymount ./artifacts
ECHO Completed
ECHO Everything Completed
ECHO Check current directory for files. Closing...
timeout 10
exit /B 1