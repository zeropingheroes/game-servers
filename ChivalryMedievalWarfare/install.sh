#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/../functions.sh

echo_info "Downloading game server files"
source $DIR/update.sh

echo_info "Copying steamclient.so"
cp $DIR/../SteamCMD/linux32/steamclient.so $DIR/server/Binaries/Linux/lib

echo_info "Creating steam_appid.txt"
echo 219640 > $DIR/server/Binaries/Linux/steam_appid.txt

