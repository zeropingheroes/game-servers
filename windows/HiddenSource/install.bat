@ECHO off
SET SCRIPTPATH=%cd%

echo Downloading Hidden Source
start http://www.hidden-source.com/downloads/hsb4b-full.zip

echo Please extract the Hidden Source zip file to the 'server/' directory
 
echo Updating Source Dedicated Server
start /wait ../SteamCMD/steamcmd.exe +login anonymous +force_install_dir "%SCRIPTPATH%/server" +app_update 205 validate +quit
 
echo Updating Source SDK Base 2006
start /wait ../SteamCMD/steamcmd.exe +login anonymous +force_install_dir "%SCRIPTPATH%/server" +app_update 215 validate +quit

echo Please extract the Hidden Source zip file to the 'server/' directory 

pause >nul