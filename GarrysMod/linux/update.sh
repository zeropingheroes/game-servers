#!/bin/bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

../../SteamCMD/linux/steamcmd.sh +login anonymous +force_install_dir "$SCRIPTPATH/server" +app_update 4020 validate +quit
