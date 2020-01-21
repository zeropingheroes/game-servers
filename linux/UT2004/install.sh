#!/bin/bash

[ -z $CALLED_FROM_MAIN_SCRIPT ] && { echo "ERROR: This script can only be called from ./game-servers"; exit 1; }

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

info "Downloading game server files"
~/go/bin/goodls -u "https://drive.google.com/file/d/1Go5XZe3cQCL0FocmxutcRoVGcCxiCU9y/view"

info "Extracting game server files"
tar -xzf "ut2004-server-3339-ultimate-linux.tar.bz2" -C "$DIR/server"

info "Removing temporary files"
rm "ut2004-server-3339-ultimate-linux.tar.bz2"