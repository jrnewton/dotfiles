@echo off
REM print second column and beyond

REM git status -s produces output like this:
REM M  changelog.txt
REM MM clUpdate.ps1
REM ?? scratch/
REM So this original logic doesn't work:
REM   Git separates first column with 2 spaces
REM   so the 'third' column is really second.
REM   cut -d' ' -f3-
REM
REM So use this original logic instead:
col.bat 2
