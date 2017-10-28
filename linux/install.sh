#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/globals

info "Downloading SteamCMD"

$DIR/SteamCMD/download.sh

info "Starting SteamCMD"

info "Please log into a Steam account which owns the games you wish to host"

info "Username:"
read STEAM_USERNAME

$DIR/SteamCMD/steamcmd.sh +login $STEAM_USERNAME +quit

info "Adding Steam username to game-servers/linux/globals"

sed -i "s/STEAM_USERNAME=\"\"/STEAM_USERNAME=\"$STEAM_USERNAME\"/g" $DIR/globals

info "Installation complete!"
