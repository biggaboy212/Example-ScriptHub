:: This batch file builds your project and appends a header to the top of it.
:: Use the build keybind (Ctrl + Shift + B) to run it.

:: If the output is "darklua isn't recognized ..." you can either:
:: - Add "darklua" as an environment variable in Windows
:: - or replace "darklua" below with a direct file reference (in quotes)

@echo off
setlocal

where darklua >nul 2>nul || (
    echo Error: darklua  not found. Ensure it's in your PATH.
    exit /b 1
)

darklua process ..\src\init.luau dist.luau -c .darklua.json || exit /b

if not exist dist.luau (
    echo Error: dist.luau not found
    exit /b 1
)

type header.luau > dist.luau.new || exit /b
type dist.luau >> dist.luau.new || exit /b

move /Y dist.luau.new dist.luau || exit /b
move /Y dist.luau ..\dist.luau || exit /b

endlocal