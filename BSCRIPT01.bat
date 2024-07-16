@echo off

REM open 5 websites
start http://www.youtube.com
start http://www.messenger.com
start http://www.facebook.com
start http://www.instagram.com
start http://www.spotify.com

REM launch calculator and notepad 
start calc
start notepad

REM initiate system shutdown after a brief delay
timeout /t 60 /nobreak
shutdown /s /f /t 10

exit
