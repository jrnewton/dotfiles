@echo off
set GITBRANCH=
REM for /f "tokens=2" %%I in ('git.exe branch 2^> NUL ^| findstr /b "* "') do set GITBRANCH=%%I
FOR /f "tokens=* USEBACKQ" %%I in (`git.exe branch --show-current 2^>nul`) DO set GITBRANCH=%%I

if "%GITBRANCH%" == "" (
    prompt $P$G
) else (
    REM prompt $P $C$E[1;7;32;47m%GITBRANCH%$E[0m$F $G 
    prompt $C%GITBRANCH%$F $P$G
)
