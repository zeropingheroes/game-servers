#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/../include

info "Downloading game server files"

mkdir -p $DIR/server

curl -L "http://files.gameservermanagers.com/UnrealTournament2004/ut2004-server-3339-ultimate-linux.tar.bz2" | tar -xj -C "$DIR/server"
