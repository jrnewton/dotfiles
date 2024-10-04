@echo off
if "%1"=="" goto usage

:run
call cfr.bat %1 --outputdir .
goto end

:usage
echo cfrjar.bat ^<jar file^>
goto end

:end
