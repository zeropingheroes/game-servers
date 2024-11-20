ECHO off
SET SCRIPTPATH=%cd%
set /p steamusername="Enter your Steam username: "
ECHO ON

START ../SteamCMD/steamcmd.exe +force_install_dir "%SCRIPTPATH%\server" +login %steamusername% +app_update 2403 validate +quit
