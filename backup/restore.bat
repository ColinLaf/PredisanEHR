@ECHO OFF
if "%~1"=="" goto :prompt
if "%~2"=="" goto :prompt
ECHO.
ECHO Pushing database files...
scp -P 2222 -r data root@127.0.0.1:/data
ECHO Completed
ECHO.
ECHO Pushing artifact files
scp -P 2222 -r artifacts root@127.0.0.1:/mymount
ECHO Completed
ECHO.
ECHO Restoring...
ECHO.
ssh root@127.0.0.1 -p 2222 "bahmni -i local restore --restore_type=db --options=openmrs --strategy=pitr --restore_point=%~1 > /dev/null"
ECHO.
ssh root@127.0.0.1 -p 2222 "bahmni -i local restore --restore_type=db --options=bahmni_reports --strategy=pitr --restore_point=%~2 > /dev/null"
ECHO.
ssh root@127.0.0.1 -p 2222 "bahmni -i local restore --restore_type=file --options=all > /dev/null"
ECHO.
ECHO Completed.
ECHO.
ECHO Taking down maintenenace page
ssh root@127.0.0.1 -p 2222 "rm /var/www/html/maintenance.enable"
exit /B 1
:prompt
ECHO Usage: %0 ^<OpenMRS Data #^> ^<Bahmni Data #^>
exit /B 1