@echo off
:: VGD - Virtual Graphic desktop
set ver=1_1

set background=F
set text=8

if "%1"=="get" (
	 if "%2"=="color" echo %background%%text%&exit /b
	 if "%2"=="ver" echo %ver%&exit /b
	 if "%2"=="help" (
	 	 echo. %0 get:
	 	 echo. ^| ver - os version.
	 	 echo. ^| color - os default color.
	 	 exit /b
	 	)
	 )
SETLOCAL EnableDelayedExpansion
color %background%%text%
:CoreLoading
title      
cls
echo.         ^|
echo. \    /  ^| Waist loader.
echo.  \/\/   ^|    Version: 0.1
echo._________^|
if not exist boot.ini goto onestart
echo.
call :log Edit boot structure? Press E
choice /c:en /t 1 /d n > nul
if %errorlevel%==1 goto editboot
for /f "tokens=1,* delims=:" %%a in (boot.ini) do (
set %%a=%%b
)
call :log Checking launch component..
call :log Launch is "%launch%".
echo.
if not "%launch%"=="core" goto beStart
if "%launch%"=="core" goto MySystem
exit /b


:onestart
echo.
call :log Installing the VGD project on this computer..
call :log Generate need patch.
md data\
md data\userdata\
md data\function\
md data\App\
md data\AppData\
echo MDR> data\App\mdr.ini
echo cmd.exe>> data\App\mdr.ini
call :log Generate boot.ini
echo.launch:core>>boot.ini
echo.
call :log Enter user name:
set /p user=[%time:~,-3%] ^>
echo.%user%>>data\userdata\name.txt
echo.f>>data\userdata\color.txt
echo.8>>data\userdata\color.txt
echo.0>>data\userdata\cursour.txt
call :log Reboot...
timeout 1 /nobreak > nul
goto CoreLoading

:beStart
call %lanuch%
cls
echo.
call :log The called component has completed its work. Reloading..
echo.
timeout 2 /nobreak > nul
goto CoreLoading



:MySystem
set x=1
set y=1
for /l %%x in (0,1,8) do for /l %%y in (0,1,6) do set "%%yB%%xN=---"
FOR /F "tokens=* usebackq" %%a IN (`dir /b data\function`) DO (
	set dirtype=null
	if exist data\function\%%a\data.vgd set /p dirtype=<data\function\%%a\data.vgd
	if !dirtype!==function set /p %%aN=<data\function\%%a\name.txt
)
:MyDesktopSystem
if exist data\userdata\name.txt set /p user=<data\userdata\name.txt
if not exist data\userdata\name.txt set user=Guest
if exist data\userdata\cursour.txt set /p cursour=<data\userdata\cursour.txt
if exist data\userdata\color.txt ((
set /p background=
set /p text=
) < data\userdata\color.txt)
color %background%%text%
for /l %%x in (0,1,8) do for /l %%y in (0,1,6) do set "%%yB%%x= "
set "%y%B%x%=%cursour%"
title    


set "0b8n=INF"
set "1b8n=REB"
set "2b8n=UPD"
cls
echo.
echo. [!0B0N!]   [!0B1N!]   [!0B2N!]   [!0B3N!]   [!0B4N!]   [!0B5N!]   [!0B6N!]   [!0B7N!]   [!0B8N!]   
echo.   !0B0!       !0B1!       !0B2!       !0B3!       !0B4!       !0B5!       !0B6!       !0B7!       !0B8!
echo.
echo. [!1B0N!]   [!1B1N!]   [!1B2N!]   [!1B3N!]   [!1B4N!]   [!1B5N!]   [!1B6N!]   [!1B7N!]   [!1B8N!]   
echo.   !1B0!       !1B1!       !1B2!       !1B3!       !1B4!       !1B5!       !1B6!       !1B7!       !1B8!
echo.
echo. [!2B0N!]   [!2B1N!]   [!2B2N!]   [!2B3N!]   [!2B4N!]   [!2B5N!]   [!2B6N!]   [!2B7N!]   [!2B8N!]   
echo.   !2B0!       !2B1!       !2B2!       !2B3!       !2B4!       !2B5!       !2B6!       !2B7!       !2B8!
echo.
echo. [!3B0N!]   [!3B1N!]   [!3B2N!]   [!3B3N!]   [!3B4N!]   [!3B5N!]   [!3B6N!]   [!3B7N!]   [!3B8N!]   
echo.   !3B0!       !3B1!       !3B2!       !3B3!       !3B4!       !3B5!       !3B6!       !3B7!       !3B8!
echo.
echo. [!4B0N!]   [!4B1N!]   [!4B2N!]   [!4B3N!]   [!4B4N!]   [!4B5N!]   [!4B6N!]   [!4B7N!]   [!4B8N!]   
echo.   !4B0!       !4B1!       !4B2!       !4B3!       !4B4!       !4B5!       !4B6!       !4B7!       !4B8!
echo.
echo. [!5B0N!]   [!5B1N!]   [!5B2N!]   [!5B3N!]   [!5B4N!]   [!5B5N!]   [!5B6N!]   [!5B7N!]   [!5B8N!]   
echo.   !5B0!       !5B1!       !5B2!       !5B3!       !5B4!       !5B5!       !5B6!       !5B7!       !5B8!
echo.
echo. [!6B0N!]   [!6B1N!]   [!6B2N!]   [!6B3N!]   [!6B4N!]   [!6B5N!]   [!6B6N!]   [!6B7N!]   [!6B8N!]   
echo.   !6B0!       !6B1!       !6B2!       !6B3!       !6B4!       !6B5!       !6B6!       !6B7!       !6B8!
echo.___________________________________________________________________________________________________
echo.              ^|  Q - Edit sector                                                Time:   %time:~,-6%
echo.   W   - Move ^|                                                                 Date: %date%
echo.  ASD         ^|  E - Use sector
choice /c:wsadeqr /t 10 /d r > nul
if %errorlevel%==1 set /a y-=1
if %errorlevel%==2 set /a y+=1
if %errorlevel%==3 set /a x-=1
if %errorlevel%==4 set /a x+=1
if %errorlevel%==5 goto usesector
if %errorlevel%==6 goto editsector
goto MyDesktopSystem

:editsector
if not "%x%"=="8" (
cls
echo.
echo. %text1%
echo.
echo. [1] Name
echo. [2] App
echo. [3] Delete
echo.
echo. [Q] - Close this window
set text1=
choice /c:q123 > nul

if !errorlevel!==3 (
	set app=
	set title=!%y%b%x%n!
	set patch=
	cls
	echo.
	echo. ^> [2] App
	echo.
	echo.  _________
	FOR /F "tokens=* usebackq" %%a IN (`dir /b data\App`) DO echo. ^| %%a
	echo.
	set /p app=^>
	if not exist data\App\%app% goto editsector
					set %y%b%x%n=APP
	(
		set /p title=
		set /p patch=
		) < data\App\!app!
	if not exist "data\function\%y%B%x%\" md data\function\%y%B%x%\
	echo.function> data\function\%y%B%x%\data.vgd
	echo.!title!> data\function\%y%B%x%\name.txt
	echo.%app%> data\function\%y%B%x%\task.txt
	set %y%b%x%n=!title!
		goto MyDesktopSystem
	)

if !errorlevel!==4 (
	rd /s /q data\function\%y%B%x%
	set %y%b%x%n=---
	goto MyDesktopSystem
	)

if !errorlevel!==2 (
cls
echo.
echo. ^> [1] Name
echo.
set /p st=^>
	if "!st:~,-2!"=="" set text1=[Name] Please use sector name 3 symbols&goto editsector
if not exist data\function\%y%B%x%\ md data\function\%y%B%x%\
echo.function> data\function\%y%B%x%\data.vgd
set %y%b%x%n=!st:~,3!

echo.!%y%b%x%n!> data\function\%y%B%x%\name.txt
echo.
)
) else (
echo.
echo. This sector not a editable
timeout 1 /nobreak > nul
)
goto MyDesktopSystem


:usesector
set patch=
set usesector=
if exist "data\function\%y%B%x%\task.txt" set /p usesector=<data\function\%y%B%x%\task.txt
set ospatch=%cd%
if exist "data\App\%usesector%" (
	(
		set /p %random%=
		set /p patch=
		) < data\App\%usesector%
	cd /d data\AppData\%usesector%\
	if exist "!patch!" call !patch!
	cd /d %ospatch%
	@echo off
	)

cls
if "%x% %y%"=="8 1" (
cls
echo.
echo. Save userdata...
timeout 1 /nobreak > nul
echo. Stop all tasks..
timeout 1 /nobreak > nul
echo.
echo. Bye user..
echo.
timeout 1 /nobreak > nul
goto CoreLoading
)
if "%x% %y%"=="8 2" (
echo 1
)

if "%x% %y%"=="8 0" (
echo.
call :color %background%9
call :echo "      VGD - Virtual graphic desktop"
echo.     ^|
echo.     ^| System:
echo.     ^|   version: 1.0
echo.     ^|   boot:    waist
echo.     ^| 
echo.     ^| User:
echo.     ^|   name:     %user%
echo.     ^|   color:    %background%%text%
echo.     ^|   cursour:  %cursour% 
echo.
echo.     [Q] - Close this window
echo.
choice /c:Q > nul
goto MyDesktopSystem
)
goto MyDesktopSystem



exit /b
:log
echo. [%time:~,-3%] %*
exit /b


:color
 set "c=%1"
exit /b
 
:echo
 for /f %%i in ('"prompt $h& for %%i in (.) do rem"') do (
  pushd "%~dp0"
   <nul>"%~1_" set /p="%%i%%i  "
   findstr /a:%c% . "%~1_*"
   if "%~2" neq "/" echo.
   del "%~1_"
  popd
 )
exit /b
