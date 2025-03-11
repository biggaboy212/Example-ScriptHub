:: This batch file builds your project and appends a header to the top of it.
:: If you have the batch runner extension, press the "Run" triangle at the top right of the tab bar.

@echo off
setlocal

darklua process ..\src\init.luau dist.luau -c .darklua.json
if errorlevel 1 exit /b

if not exist dist.luau (
    echo Error: dist.luau not found
    exit /b 1
)

type header.luau > dist.luau.new
if errorlevel 1 exit /b

type dist.luau >> dist.luau.new
if errorlevel 1 exit /b

move /Y dist.luau.new dist.luau
if errorlevel 1 exit /b

move /Y dist.luau ..\dist.luau
if errorlevel 1 exit /b

endlocal