#!/bin/bash

[ -z $CALLED_FROM_MAIN_SCRIPT ] && { echo "ERROR: This script can only be called from ./game-servers"; exit 1; }

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

info "Downloading game server files"
source $DIR/update.sh

info "Copying steamclient.so"
cp $DIR/../SteamCMD/linux32/steamclient.so $DIR/server/Binaries/Linux/lib

info "Creating steam_appid.txt"
echo 219640 > $DIR/server/Binaries/Linux/steam_appid.txt

