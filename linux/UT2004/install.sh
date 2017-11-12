#!/bin/bash

[ -z $CALLED_FROM_MAIN_SCRIPT ] && { echo "ERROR: This script can only be called from ./game-servers"; exit 1; }

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

info "Downloading game server files"

curl -L "https://zeropingheroes.ams3.digitaloceanspaces.com/ut2004-server-3339-ultimate-linux.tar.bz2" | tar -xj -C "$DIR/server"
