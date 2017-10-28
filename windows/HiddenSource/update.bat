ECHO off
SET SCRIPTPATH=%cd%
ECHO ON

echo "Updating Source Dedicated Server"
START ../SteamCMD/steamcmd.exe +login anonymous +force_install_dir "%SCRIPTPATH%/server" +app_update 205 validate +quit
echo "Updating Source SDK Base 2006"
START ../SteamCMD/steamcmd.exe +login anonymous +force_install_dir "%SCRIPTPATH%/server" +app_update 215 validate +quit 
