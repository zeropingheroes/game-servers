#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

info "Downloading game server files"

curl -L "http://files.gameservermanagers.com/GoldenEyeSource/GoldenEye_Source_v5.0.1_full_server_linux.tar.bz2" | tar -xj -C "$DIR/server"

$DIR/update.sh

info "Linking config files"

cp -rs $DIR/configs/* $DIR/server
