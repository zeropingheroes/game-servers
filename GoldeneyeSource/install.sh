#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo_info "Downloading game server files"
curl -sSL "https://drive.usercontent.google.com/download?id=15ikRfTc5TBJmSyWGo1H6_OzscPU9HGFT&confirm=y" -o "GoldenEye_Source_v5.0.6_full_server_windows.7z"

echo_info "Extracting game server files"
7z x "GoldenEye_Source_v5.0.6_full_server_windows.7z" -o"$DIR/server"

echo_info "Removing temporary files"
rm "GoldenEye_Source_v5.0.6_full_server_windows.7z"

echo_info "Moving default server config"
mv "$DIR/server/gesource/cfg/server.cfg" "$DIR/server/gesource/cfg/server-default.cfg"

source $DIR/update.sh
