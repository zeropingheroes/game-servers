#!/bin/bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

echo "Enter your Steam username"
read STEAMUSERNAME

../../SteamCMD/linux/steamcmd.sh +login $STEAMUSERNAME +force_install_dir "$SCRIPTPATH/server" +app_update 380840 validate +quit
