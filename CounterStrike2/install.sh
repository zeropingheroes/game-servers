#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/../functions.sh

echo_info "Downloading game server files"
source $DIR/update.sh

echo_info "Adding steamclient.so to correct directory"
mkdir -p ~/.steam/sdk64

ln -sfT ~/.local/share/Steam/steamcmd/linux64/steamclient.so ~/.steam/sdk64/steamclient.so
