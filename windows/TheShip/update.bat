ECHO off
SET SCRIPTPATH=%cd%
set /p steamusername="Enter your Steam username: "
ECHO ON

START ../SteamCMD/steamcmd.exe +login %steamusername% +force_install_dir "%SCRIPTPATH%\server" +app_update 2403 validate +quit
