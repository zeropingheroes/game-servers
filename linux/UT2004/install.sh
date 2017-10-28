#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/../globals

info "Downloading game server files"

mkdir -p $DIR/server

curl -L "http://files.gameservermanagers.com/UnrealTournament2004/ut2004-server-3339-ultimate-linux.tar.bz2" | tar -xj -C "$DIR/server"

info "Installing game server dependencies"

/usr/bin/apt update -y && /usr/bin/apt install -y libsdl1.2debian:i386 libstdc++5:i386
