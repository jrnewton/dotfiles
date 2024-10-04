@echo off

call powershell -file C:\tools\bin\git-clone.ps1 %*

goto end

:args
echo 1 is %1
echo 2 is %2
if "%1"=="" goto usage
set _URL=%1

if "%2"=="" goto notarget
echo Using target
set _TARGET=%2
goto target

REM no target dir given
:notarget
echo Using target of CD
set _TARGET=%CD%
goto target

REM target dir provided
:target
echo _URL is %_URL%
echo _TARGET is %_TARGET%
call git clone %_URL% %_TARGET%
echo %_URL% %_TARGET% > C:\work\git_clone_log.txt
goto end

:usage
echo Usage: git-clone.bat ^<repo URL^> ^[target directory^]
echo   Clone a repo, and record it in a log.
echo.
echo Examples:
echo   git-clone.bat https://dino-software.visualstudio.com/DefaultCollection/UDM/_git/UDM
echo   git-clone.bat https://dino-software.visualstudio.com/DefaultCollection/UDM/_git/UDM gui
echo.
exit /b 12
goto end

:end

