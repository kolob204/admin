@ECHO OFF

setlocal enableDelayedExpansion

Set Location=LOGS\
Set PatternName=*.log
for /f "delims=" %%F in ('Where /R %Location% /F %PatternName%') do (
    set x=%%~nxF
    set y=!x:~0,2!
    set /a  y += 1
 
    if %DATE:~0,2% gtr !y! del /F - %%F
) 

Set Location=%cd%\selenide\allure-results
for /f "delims=" %%F in ('dir /B %Location%') do (
    set x=%%~nxF
    set y=!x:~0,2!
    set /a  y += 1
 
    if %DATE:~0,2% gtr !y! rd /S /Q - %cd%\selenide\allure-results\%%F
) 

exit

