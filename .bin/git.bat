@echo off
REM wrapper around git.exe which puts current branch into cmd prompt

git.exe %*
call gitprompt.bat
