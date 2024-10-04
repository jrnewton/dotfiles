@echo off

REM echo 1 is %1
REM echo 2 is %2
if "%1"=="" goto version

REM git alias passes args in a way I don't completely understand.
REM if you call "git sw foo" then it will send "foo" as args 1 and 2.
REM if you call "git sw foo bar" then it will send "foo" as arg 1
REM and "bar" as arg 2.
REM
REM This next condition tries to deal with that.
if "%1"=="%2" goto maint
if "%2"=="" goto maint
goto private

:version
git merge V41
goto end

:maint
git merge V41_%1
goto end

:private
git merge V41_%1_%2
goto end

:end
