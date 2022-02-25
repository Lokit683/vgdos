@echo off
:reboot
@mode con: cols=100 lines=30
setlocal enabledelayedexpansion
if not exist files\ goto oneuse
set md1=0
echo. Test exist file..
if not exist files\functions\ md files\functions
if not exist files\languages\ md files\languages
if not exist files\Settings\ md files\Settings
if not exist files\languages\en.txt call :lanGen
set x=1
set y=1
set Xmax=8
set Ymax=6
set /p cursour=<files\Settings\cursour.txt
set cursour=%cursour:~,1%
set endcurs= 

set /p lang=<files\Settings\lang.txt
if not exist files\languages\%lang%.txt set lang=en
< files\languages\%lang%.txt ( 
set /p langs1=
set /p langs2=
set /p langs3=
set /p langs4=
set /p langs5=
set /p langs6=
set /p langs7=
set /p langs8=
set /p langs9=
set /p langs10=
set /p langs11=
set /p langs12=
set /p langs13=
set /p langs14=
set /p langs15=
set /p langs16=
set /p langs17=
set /p langs18=
set /p langs19=
set /p langs20=
set /p langs21=
set /p langs22=
set /p langs23=
set /p langs24=
set /p langs25=
set /p langs26=
set /p langs27=
set /p langs28=
set /p langs29=
set /p langs30= 
set /p langs31=
) 

set XY=%x%%y%
for /l %%g in (0,1,66) do set B%%g=%endcurs%
goto desktop

:registerapp
set id=%1
set %id%N=%2
exit /b

:desktop
title   
set /p color=<files\Settings\color.txt
color %color%

for /l %%g in (0,1,86) do set B%%gN=---
set B%XY%=%cursour%

for /f "tokens=1,2 delims=;" %%a in ('"type files\desktop.yml"') do (
call :registerapp %%a %%b
)
set B11N=adm
set B21N=adm
set B16N=adm
set B31N=adm
set B41N=adm
cls
echo.
echo.
echo.
echo.    [Set]  [Cmd]  [inf]  [EXP]  [%B51N%]  [%B61N%]  [%B71N%]  [%B81N%]
echo.      %B11%      %B21%      %B31%      %B41%      %B51%      %B61%      %B71%      %B81%
echo.
echo.    [%B12N%]  [%B22N%]  [%B32N%]  [%B42N%]  [%B52N%]  [%B62N%]  [%B72N%]  [%B82N%]  
echo.      %B12%      %B22%      %B32%      %B42%      %B52%      %B62%      %B72%      %B82%
echo.
echo.    [%B13N%]  [%B23N%]  [%B33N%]  [%B43N%]  [%B53N%]  [%B63N%]  [%B73N%]  [%B83N%]
echo.      %B13%      %B23%      %B33%      %B43%      %B53%      %B63%      %B73%      %B83%
echo.
echo.    [%B14N%]  [%B24N%]  [%B34N%]  [%B44N%]  [%B54N%]  [%B64N%]  [%B74N%]  [%B84N%]
echo.      %B14%      %B24%      %B34%      %B44%      %B54%      %B64%      %B74%      %B84%
echo.
echo.    [%B15N%]  [%B25N%]  [%B35N%]  [%B45N%]  [%B55N%]  [%B65N%]  [%B75N%]  [%B85N%]
echo.      %B15%      %B25%      %B35%      %B45%      %B55%      %B65%      %B75%      %B85%
echo.
echo.    [PUC]  [%B26N%]  [%B36N%]  [%B46N%]  [%B56N%]  [%B66N%]  [%B76N%]  [%B86N%]
echo.      %B16%      %B26%      %B36%      %B46%      %B56%      %B66%      %B76%      %B86%
echo.
echo.
echo.
echo.
echo.
echo.---------------------------------------------------------------------------------------------------
echo.   q - %langs21%                         X: %x%                        Time: %time:~,-3%
echo.   e - %langs22%                        Y: %Y%                        Date: %date%
echo.
 
choice /c wsadqel /t 1 /d l > nul
if %errorlevel%==1 call :w
if %errorlevel%==2 call :s
if %errorlevel%==3 call :a
if %errorlevel%==4 call :d
if %errorlevel%==5 call :q
if %errorlevel%==6 call :e
if %errorlevel%==7 goto desktop
goto desktop

:explorer
cls
set patch=%cd%
echo.
echo. %langs1%$ %langs2%
echo  %langs27%# %langs28%
echo  %langs29%: %cd%
echo.
echo.-----------
	for /f "tokens=*" %%a in ('"dir /b 2>nul"') do (
if exist %%a\ echo [DIR] %%a
if not exist %%a\ echo [FIL] %%a
 )
echo.-----------
echo.
set /p files=^>
if "%files%"=="$" (goto dekstop)
if "%files%"=="#" (cd..&goto explorer)
if exist "%files%\" cd /d "%cd%\%files%"&goto explorer
if not exist "%files%\" start %files%
goto explorer


:setting
set /p color=<files\Settings\color.txt
color %color%
cls
echo.
echo. [1] %langs18%
echo. [2] %langs19%
echo. [3] %langs20%
echo. [4] %langs23%
echo. [5] %langs31%
echo.
choice /c:12345 > nul
if %errorlevel%==1 goto desktop
if %errorlevel%==2 goto customcursour
if %errorlevel%==3 goto customcolor
if %errorlevel%==4 goto lange
if %errorlevel%==5 goto update
exit /b

:lange
cls
echo.
echo. %langs26% [exit]
echo.
echo. %langs25%
echo.---------------
dir /b files\languages
echo.---------------
echo.
set /p lang=^>
if "%lang%"=="exit" goto desktop
if not exist files\languages\%lang%.txt echo %langs24%.. & pause & goto lange
echo %lang%>files\Settings\lang.txt
goto reboot


:customcolor
cls
echo.
echo. [1] Custom
echo. [2] 78
echo. [3] 1F
echo. [4] OA
echo. [5] A4
echo. [6] 0f
echo. [7] F1
echo. [8] CF
echo.
choice /c:12345678 > nul
if "%errorlevel%"=="1" (
set /p colors=^>
echo %colors% > files\Settings\color.txt
)
if "%errorlevel%"=="2" (
echo 78 > files\Settings\color.txt
)
if "%errorlevel%"=="8" (
echo CF > files\Settings\color.txt
)
if "%errorlevel%"=="3" (
echo 1F > files\Settings\color.txt
)
if "%errorlevel%"=="4" (
echo 0A > files\Settings\color.txt
)
if "%errorlevel%"=="5" (
echo A4 > files\Settings\color.txt
)
if "%errorlevel%"=="5" (
echo A4 > files\Settings\color.txt
)
if "%errorlevel%"=="6" (
echo 0f > files\Settings\color.txt
)
if "%errorlevel%"=="7" (
echo F1 > files\Settings\color.txt
)
goto setting

:customcursour
cls
echo.
echo. %langs17%
echo.
set /p cursour=^>
echo %cursour%> files\Settings\cursour.txt
goto setting

:information
set /p user=<files\Settings\user.txt
set /p color=<files\Settings\color.txt
cls
echo. _______________________________
echo. System version:  ^|  1.5.4
echo. System color:    ^|  %color%
echo. User:            ^|  %user%
echo. Cursour:         ^|  %cursour%
echo. Language:        ^|  %lang%
echo.
echo. [Q] - %langs16%
choice /c:q > nul
if %errorlevel%==1 goto desktop
goto information

:cmd
if not exist files\Cmd\app.bat (
cls
echo.
echo. %langs15%.. ;(
echo.
pause
goto desktop
)

cd files\Cmd\
call app.bat %user%
cd ..\..

exit /b

:pusk
cls
echo.
echo. [1] %langs12%
echo. [2] %langs13%
echo. [3] %langs14%
choice /c:123 > nul
if %errorlevel%==1 goto reboot
if %errorlevel%==2 exit 
if %errorlevel%==3 goto desktop
goto pusk

:e
if %x%%y%==11 goto setting
if %x%%y%==21 goto cmd
if %x%%y%==31 goto information
if %x%%y%==16 goto pusk
if %x%%y%==41 goto explorer
if !B%x%%y%N!==adm exit /b

if not exist files\functions\B%XY%.txt exit /b

for /f "tokens=*" %%a in ('"type files\functions\B%XY%.txt"') do (
%%a
)
exit /b

:q
if "!B%x%%y%N!"=="adm" (
echo %langs11%.
timeout 2 > nul
exit /b
)
cls
echo.
echo. %langs4%: "%x%%y%" %langs5%
echo.
echo. [1] %langs6%
echo. [2] %langs7%
echo. [3] %langs8%
echo. [4] %langs9%
echo. [5] %langs10%
choice /c:12345 > nul
if %errorlevel%==1 exit /b
if %errorlevel%==2 goto addcmd
if %errorlevel%==3 goto setname
if %errorlevel%==4 goto appkey
if %errorlevel%==5 goto delete
exit /b

:appkey	
goto dekstop

:delete
type files\desktop.yml | findstr /i /v "B%XY%;!B%XY%N!" > files\temp.txt
del files\desktop.yml
rename files\temp.txt desktop.yml
if not exist files\functions\B%XY%.txt exit /b
del files\functions\B%XY%.txt > nul
goto desktop

:setname
cls
echo. %langs3% [the]
echo.
set /p name=^>
if "%name%"=="adm" goto setname
set name=%name:~,3%
echo B%x%%y%;%name%>> files\desktop.yml
exit /b

:addcmd
cls
echo. %langs1% $ %langs2%
echo. %langs1% # %langs30%
echo.
echo.-------------------
echo.
if exist files\functions\B%XY%.txt type files\functions\B%XY%.txt
echo.
echo.-------------------
set /p list=^>
if "%list%"=="#" call :Deltext %text%&goto addcmd
if "%list%"=="$" exit /b
echo %list% >> files\functions\B%XY%.txt
set text=%list%
goto addcmd

:deltext
type files\functions\B%XY%.txt | findstr /i /v "%*" > files\functions\temp.txt
del files\functions\B%XY%.txt
rename files\functions\temp.txt B%XY%.txt
exit /b


:w
set endkey=W
if %y%==1 exit /b
set B%XY%=%endcurs%
set /a y-=1
set XY=%x%%y%
set B%XY%=%cursour%
exit /b


:s
set endkey=s
if %y%==%Ymax% exit /b
set B%XY%=%endcurs%
set /a y+=1
set XY=%x%%y%
set B%XY%=%cursour%
exit /b

:a
set endkey=a
if %x%==1 exit /b
set B%XY%=%endcurs%
set /a x-=1
set XY=%x%%y%
set B%XY%=%cursour%
exit /b

:d
set endkey=d
if %x%==%Xmax% exit /b
set B%XY%=%endcurs%
set /a x+=1
set XY=%x%%y%
set B%XY%=%cursour%
exit /b

:update
cls
call files\center\center.bat
goto reboot

:oneuse
cls
echo.
echo. Hello user! I`m create needed files and dirs..
echo.
echo. Please enter your name:
echo.
set /p user=^>
cls
echo.
echo. Cool name %user%!
echo.
cls
md files&echo [%time:~,-3%] Create dir "files"
md files\functions&echo [%time:~,-3%] Create dir "functions"
md files\Settings&echo [%time:~,-3%] Create dir "Settings"
md files\Cmd&echo [%time:~,-3%] Create dir "Cmd"
md files\languages&echo [%time:~,-3%] Create dir "languages"
md files\Apps&echo [%time:~,-3%] Create dir "Apps"
md files\Center&echo [%time:~,-3%] Create dir "Center"
echo. > files\desktop.yml
echo.0F > files\Settings\color.txt
echo.0 > files\Settings\cursour.txt
echo.%user% > files\Settings\user.txt
echo.en> files\Settings\lang.txt
echo [%time:~,-3%] Create custom settings..
call :lanGen
cls
echo [%time:~,-3%] Install system app.
echo [%time:~,-3%] App name: cmd
powershell -command "Invoke-WebRequest https://drive.google.com/u/0/uc?id=1jUUnHHBnqHfDQFV1nOhc8LPT_iArLflW`&export=download -OutFil files\Cmd\cmd.zip"
echo [%time:~,-3%] Unpack..
cd /d files\cmd
tar.exe -xf cmd.zip
echo [%time:~,-3%] Delete temp files..
echo [%time:~,-3%] Done!
del cmd.zip
cd ..\..


echo [%time:~,-3%] Install system app.
echo [%time:~,-3%] App name: update-center
powershell -command "Invoke-WebRequest https://codeload.github.com/Lokit683/UpdateCenter/zip/refs/heads/main -OutFil files\Center\center.zip"
echo [%time:~,-3%] Unpack..
cd /d files\Center
tar.exe -xf center.zip > nul
xcopy "UpdateCenter-main\*.*" "%cd%" > nul
echo [%time:~,-3%] Delete temp files..
del center.zip
rd /s /q UpdateCenter-main
echo [%time:~,-3%] Done!
cd ..\..

echo [%time:~,-3%] Install system app.
echo [%time:~,-3%] App name: calc
echo. 1 > files\Apps\calc.app
echo [%time:~,-3%] Unpack..
echo [%time:~,-3%] Done!
goto reboot


:lanGen
echo press enter >> files\languages\en.txt
echo to exit >> files\languages\en.txt
echo pls use 3 sumbols! Viev >> files\languages\en.txt
echo Functions >> files\languages\en.txt
echo key >> files\languages\en.txt
echo quit >> files\languages\en.txt
echo Set key cod >> files\languages\en.txt
echo Set key name >> files\languages\en.txt
echo System app >> files\languages\en.txt
echo delete function and key >> files\languages\en.txt
echo This section is not editable >> files\languages\en.txt
echo Reboot >> files\languages\en.txt
echo Disable >> files\languages\en.txt
echo Close >> files\languages\en.txt
echo Not installed >> files\languages\en.txt
echo Exit >> files\languages\en.txt
echo Enter symbol in cursour >> files\languages\en.txt
echo quit >> files\languages\en.txt
echo cursour >> files\languages\en.txt
echo color >> files\languages\en.txt
echo Edit key >> files\languages\en.txt
echo Usage key >> files\languages\en.txt
echo language >> files\languages\en.txt
echo Language not exist >> files\languages\en.txt
echo Enter languge name >> files\languages\en.txt
echo enter this text to exit >> files\languages\en.txt
echo Enter >> files\languages\en.txt
echo to back >> files\languages\en.txt
echo Path >> files\languages\en.txt
echo to delete end string >> files\languages\en.txt
echo Update >> files\languages\en.txt
exit /b
