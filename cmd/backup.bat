set Date=%DATE:/=_%
if "%time:~0,1%" == " " (set Hr=0%time:~1,1%) ELSE set Hr=%time:~0,2%
set Min=%TIME:~3,2%
set Sec=%TIME:~6,2%
 

set dirToBackup=K:\frolov_vi\backup\
SET stamp=%Date%_%Hr%-%Min%-%Sec%

K:
cd %dirToBackup%
mkdir %stamp%



rem   xcopy C:\Users\frolov_vi\Documents\FAQ %dirToBackup%\%stamp% /Y /s /e /exclude:C:\Users\frolov_vi\Documents\admin\cmd\excludedfileslist.txt
rem   cd %stamp%
rem   mkdir regrestests
rem   xcopy C:\eclipse\workspace\regrestests K:\frolov_vi\backup\%stamp%\regrestests /Y /s /e /exclude:C:\Users\frolov_vi\Documents\admin\cmd\excludedfileslist.txt



rem Regres Tests Project
set backupdir=C:\eclipse\workspace\regrestests
zip -S9r %backupdir%\%stamp%_regres.zip %backupdir%\??* -x %backupdir%\*.exe %backupdir%\*.bat %backupdir%\*.jar %backupdir%\*.war %backupdir%\*.zip %backupdir%\lib/* %backupdir%\allure-results/* %backupdir%\Log4j/* %backupdir%\LOGS/* %backupdir%\target/* %backupdir%\test-*/* %backupdir%\ExtentReports/* 

echo f |xcopy /H /y /s /e %backupdir%\%stamp%_regres.zip %dirToBackup%\%stamp%\%stamp%_regres.zip
del /F/Q %backupdir%\%stamp%_regres.zip


rem SELENIDE Tests Project
set backupdir=C:\eclipse\workspace\selenide
zip -S9r %backupdir%\%stamp%_selenide.zip %backupdir%\??* -x %backupdir%\*.exe %backupdir%\*.bat %backupdir%\*.jar %backupdir%\*.war %backupdir%\*.zip %backupdir%\lib/* %backupdir%\allure-results/* %backupdir%\Log4j/* %backupdir%\LOGS/* %backupdir%\target/* %backupdir%\test-*/* %backupdir%\ExtentReports/* %backupdir%\build/*

echo f |xcopy /H /y /s /e %backupdir%\%stamp%_selenide.zip %dirToBackup%\%stamp%\%stamp%_selenide.zip
del /F/Q %backupdir%\%stamp%_selenide.zip


rem Siebel Tests Project
set backupdir=C:\eclipse\workspace\sibeltests
zip -S9r %backupdir%\%stamp%_siebeltests.zip %backupdir%\??* -x %backupdir%/*.exe %backupdir%/*.bat %backupdir%/*.jar %backupdir%/*.war %backupdir%/*.zip %backupdir%/lib**/* %backupdir%/allure-results/* %backupdir%/Log4j/* %backupdir%/LOGS/* %backupdir%/target/* %backupdir%/test-*/* %backupdir%/ExtentReports/* %backupdir%/build/*

echo f |xcopy /H /y /s /e %backupdir%\%stamp%_siebeltests.zip %dirToBackup%\%stamp%\%stamp%_siebeltests.zip
del /F/Q %backupdir%\%stamp%_siebeltests.zip


rem Scripts
set backupdir=C:\Users\frolov_vi\Documents\admin
zip -S9r %dirToBackup%\%stamp%\%stamp%_scripts.zip %backupdir%\??*



rem Fags
set backupdir=C:\Users\frolov_vi\Documents\FAQ
zip -S9r %dirToBackup%\%stamp%\%stamp%_FAQs.zip %backupdir%\??* -x %backupdir%\*.exe %backupdir%\*.bat %backupdir%\*.jar %backupdir%\*.war



rem Other about TESTs
set backupdir=C:\Users\frolov_vi\Documents\Тесты
zip -S9r %dirToBackup%\%stamp%\%stamp%_someInfoAboutTests.zip %backupdir%\??* -x %backupdir%\*.exe %backupdir%\*.bat %backupdir%\*.jar %backupdir%\*.war


rem Delete Files OLDER  x DAy's
rem ForFiles /p %dirToBackup% /s /d -30 /c "cmd /c del @file"

rem Delete FOLDERS OLDER  x DAy's
FORFILES /p %dirToBackup% /S /D -30 /C "cmd /c IF @isdir == TRUE rd /S /Q @path"