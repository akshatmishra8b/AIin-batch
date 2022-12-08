@echo off
set BotName=Chatterbot

title AI %BotName% 1.0 - Learner Bot
color 0a

rem Create the speech file if not exist
if not exist speech.txt echo.>speech.txt

Echo Start up a conversation with %BotName%
echo.

:START
set /p text="You: "

:: DYNAMIC QUESTIONS THAT PULL REALTIME INFORMATION
if /i "%text%"=="what time is it" goto :TIME
if /i "%text%"=="what is the time" goto :TIME
if /i "%text%"=="what is  date" goto :DATE
if /i "%text%"=="what is time" goto :TIME
if /i "%text%"=="tell me time" goto :TIME
if /i "%text%"=="tell me the time" goto :TIME
if /i "%text%"=="open google" start chrome "www.google.com"
if /i "%text%"=="open youtube" start chrome "www.youtube.com"

:: OUR SPEECH FILE
for /f "tokens=1,* delims={" %%a in (speech.txt) do (

if /i "%text%"=="%%a" (
echo.
echo %BotName%: %%b
echo.
goto :START
)
)
echo.
echo %BotName%: I don't know what that means.
set /p answer=%BotName%: How should this be answered '%text%'?
echo %text%{%answer%>>speech.txt
echo %BotName%: Thanks!
echo.
goto :START
:TIME
echo.
echo %BotName%: The time is %TIME%
echo.
goto :START

:DATE
echo.
echo %BotName%: The date is %DATE%
echo.
goto :START
:CALCULATOR
echo.
set /p sum=
set /a ans=%sum%
echo.
echo = %ans%
echo --------------------------------------------------------------
pause
cls
echo Previous Answer: %ans%