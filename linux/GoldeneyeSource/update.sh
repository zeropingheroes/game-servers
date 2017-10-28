#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$DIR/../SteamCMD/steamcmd.sh +login anonymous +force_install_dir "$DIR/server" +app_update 310 validate +quit
