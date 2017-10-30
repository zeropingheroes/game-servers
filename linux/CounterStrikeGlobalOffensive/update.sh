#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$DIR/../SteamCMD/steamcmd.sh +login $STEAM_USERNAME +force_install_dir "$DIR/server" +app_license_request 4020 +app_update 740 validate +quit
