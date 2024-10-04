@echo off
REM Add modified files to index

REM Output of git status -s is like this:
REM   ' M file1'
REM   'AM file2'
REM So use regex of space or alpha followed by 'M' to find the ones we need.

REM git q -> select rows with xM -> take 2nd col -> xargs -> git add
git q | grep "[ A-Z]M " | col2 | xargs git add --
