@echo off
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
cls
setlocal EnableDelayedExpansion
title Auto-Symlink
:::                      _                       _____                       _   _           _    
:::      /\             | |                     / ____|                     | | (_)         | |   
:::     /  \     _   _  | |_    ___    ______  | (___    _   _   _ __ ___   | |  _   _ __   | | __
:::    / /\ \   | | | | | __|  / _ \  |______|  \___ \  | | | | | '_ ` _ \  | | | | | '_ \  | |/ /
:::   / ____ \  | |_| | | |_  | (_) |           ____) | | |_| | | | | | | | | | | | | | | | |   < 
:::  /_/    \_\  \__,_|  \__|  \___/           |_____/   \__, | |_| |_| |_| |_| |_| |_| |_| |_|\_\
:::                                                       __/ |                                   
:::                                                      |___/                                    
:::                                                                                               
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
pause
for /f "delims=" %%i in ('dir /b /ad "C:\Program Files"') do (
	robocopy "C:\Program Files\%%i" "D:\Program Files\%%i" /sec /move /e
	mklink "C:\Program Files\%%i" "D:\Program Files\%%i" /d
)
for /f "delims=" %%i in ('dir /b /ad "C:\Program Files (x86)"') do (
	robocopy "C:\Program Files (x86)\%%i" "D:\Program Files (x86)\%%i" /sec /move /e
	mklink "C:\Program Files (x86)\%%i" "D:\Program Files (x86)\%%i" /d
)
echo.
pause
exit