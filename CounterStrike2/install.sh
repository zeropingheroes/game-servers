#!/bin/bash

[ -z $CALLED_FROM_MAIN_SCRIPT ] && { echo "ERROR: This script can only be called from ./game-servers"; exit 1; }

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

info "Downloading game server files"
#source $DIR/update.sh

info "Adding steamclient.so to correct directory"
mkdir -p ~/.steam/sdk64

ln -sfT ~/.local/share/Steam/steamcmd/linux64/steamclient.so ~/.steam/sdk64/steamclient.so


