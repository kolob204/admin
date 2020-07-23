set cur=%cd%
XCOPY "\\10.63.10.4\sam\Scan_Dipt\Production\regrestests\src\*" "%cur%\regrestests\src\*" /Y /E
XCOPY "\\10.63.10.4\sam\Scan_Dipt\Production\regrestests\target\*" "%cur%\regrestests\target\*" /Y /E
XCOPY "\\10.63.10.4\sam\Scan_Dipt\Production\run_regres*.bat" "%cur%\*" /Y
XCOPY "\\10.63.10.4\sam\Scan_Dipt\Production\*.docx" "%cur%\*" /Y
XCOPY "\\10.63.10.4\sam\Scan_Dipt\Production\*.xlsx" "%cur%\*" /Y