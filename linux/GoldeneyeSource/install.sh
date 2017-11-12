#!/bin/bash

[ -z $CALLED_FROM_MAIN_SCRIPT ] && { echo "ERROR: This script can only be called from ./game-servers"; exit 1; }

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

info "Downloading game server files"

curl -L "https://zeropingheroes.ams3.digitaloceanspaces.com/GoldenEye_Source_v5.0.6_full_server_windows.7z" > "$DIR/server/GoldenEye_Source_v5.0.6_full_server_windows.7z"

7z x "$DIR/server/GoldenEye_Source_v5.0.6_full_server_windows.7z" -o"$DIR/server"

info "Removing temporary files"
rm "$DIR/server/GoldenEye_Source_v5.0.6_full_server_windows.7z"

info "Moving default server config"
mv "$DIR/server/gesource/cfg/server.cfg" "$DIR/server/gesource/cfg/server-default.cfg"

source $DIR/update.sh
