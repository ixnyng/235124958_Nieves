@echo off
setlocal enabledelayedexpansion

:: Define directories and sort files
set sourceDir=C:\c.txt
set archiveDir=Z:\archive
set tempSortDir=%archiveDir%\sorted

:: Check if Drive Z: exists
if not exist "Z:\" (
    echo Drive Z: does not exist. Please make sure the drive is available.
    pause
    goto end
)

:: Create the archive directory if it doesn't exist
if not exist "%archiveDir%" (
    mkdir "%archiveDir%"
)

:: Create a temporary directory for sorting if it doesn't exist
if not exist "%tempSortDir%" (
    mkdir "%tempSortDir%"
)

:: Archive old files to the archive directory
echo Archiving Pictures from %sourceDir% to %archiveDir%...
forfiles /P "%sourceDir%" /M *c.txt /D -30 /C "cmd /c move @file %archiveDir%"

:: Sort the archived files by size
echo Sorting archived files by size...
for /f "tokens=*" %%a in ('dir %archieve_dir%\*c.txt /S /O:-S /B') do (
	echo %%a
)

:: Prompt user for permission to delete
echo The following large files are archived and sorted by size:
dir /S /O-S "%tempSortDir%"
echo.

set /p delConfirm=Do you want to delete these old, large files? (Y/N): 
if /I "%delConfirm%"=="Y" (
    echo Deleting old, large files...
    del /Q "%tempSortDir%\*"
    echo Files deleted.
) else (
    echo Files were not deleted.
)

:end
echo Operation completed.
pause
