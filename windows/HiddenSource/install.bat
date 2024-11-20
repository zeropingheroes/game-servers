@ECHO off
SET SCRIPTPATH=%cd%

echo Downloading Hidden Source
start https://drive.google.com/file/d/1-VEAtQemAetp360yaWqtdvO6XhYslZn9/view?usp=sharing

echo Please extract the Hidden Source zip file to the 'server/' directory
 
echo Updating Source Dedicated Server
start /wait ../SteamCMD/steamcmd.exe +force_install_dir "%SCRIPTPATH%/server" +login anonymous +app_update 205 validate +quit
 
echo Updating Source SDK Base 2006
start /wait ../SteamCMD/steamcmd.exe +force_install_dir "%SCRIPTPATH%/server" +login anonymous +app_update 215 validate +quit

echo Please extract the Hidden Source zip file to the 'server/' directory 

pause >nul