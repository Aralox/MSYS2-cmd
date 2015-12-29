@echo off
REM CMD shell integration for MSYS2
REM
REM Copyright (C) 2015 Stefan Zimmermann <zimmermann.code@gmail.com>
REM
REM Licensed under the Apache License, Version 2.0

setlocal EnableExtensions || exit /b

if "%~1" == "/?" (
    echo Runs MSYS2 bash.exe in MSYS mode.
    echo.
    echo BASH [args ...]
    echo.
    echo First starts a non-interactive bash.exe with --login flag,
    echo which then switches to current working directory
    echo and runs a new bash.exe instance with the given arguments.
    echo.
    echo If no arguments are given, a new shell window will be started.
    echo Call BASH -i to run an interactive bash.exe in current shell window.
    exit /b 0
)

set MSYSTEM=MSYS
if "%~1" == "" (
    start bash.exe --login -c 'cd "%cd%" ^&^& bash'
) else (
    bash.exe --login -c 'cd "%cd%" ^&^& bash %*'
)

endlocal
