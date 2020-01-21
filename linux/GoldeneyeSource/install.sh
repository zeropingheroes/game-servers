#!/bin/bash

[ -z $CALLED_FROM_MAIN_SCRIPT ] && { echo "ERROR: This script can only be called from ./game-servers"; exit 1; }

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

info "Downloading game server files"
~/go/bin/goodls -u "https://drive.google.com/file/d/1Scc997NmXfBZArIv8SeT0ae9Enn_uYkC/view?usp=sharing" 

info "Extracting game server files"
7z x "GoldenEye_Source_v5.0.6_full_server_windows.7z" -o"$DIR/server"

info "Removing temporary files"
rm "GoldenEye_Source_v5.0.6_full_server_windows.7z"

info "Moving default server config"
mv "$DIR/server/gesource/cfg/server.cfg" "$DIR/server/gesource/cfg/server-default.cfg"

source $DIR/update.sh
