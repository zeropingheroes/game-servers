#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$DIR/../SteamCMD/steamcmd.sh +login $STEAM_USERNAME +force_install_dir "$DIR/server" +app_update 232250 validate +quit
