@echo off
REM Navigate to the workspace (optional, ensures correct path)
cd /d %~dp0

REM Create build folder if it doesn't exist
if not exist build (
    mkdir build
)

REM Copy index.html into build folder
if exist index.html (
    copy /Y index.html build\index.html
) else (
    echo ERROR: index.html not found in workspace!
    exit /b 1
)

REM Verify copy
if exist build\index.html (
    echo index.html successfully copied to build\
) else (
    echo ERROR: Failed to copy index.html!
    exit /b 1
)
