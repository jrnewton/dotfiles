@echo off
echo.
echo log options:
echo    -p for patch
echo    --stat for file list
echo    --graph for branch visual
echo.
echo.
echo Read 2 vs 3 dots: https://www.dolthub.com/blog/2022-11-11-two-and-three-dot-diff-and-log/
echo.
echo Trace the evolution of code:
echo   # run from Git bash:
echo   git --no-pager log -P -L/'::getPrivateCellChain(void)/,/\s\}/'^:objectInstance.cpp
echo.
echo   # run from windows terminal:
echo   git --no-pager log -P -L"/::getPrivateCellChain(void)/,/^\s\}/"^:objectInstance.cpp
