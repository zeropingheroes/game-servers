#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/../globals

$DIR/../SteamCMD/steamcmd.sh +login $STEAM_USERNAME +force_install_dir "$DIR/server" +app_update 380840 validate +quit
