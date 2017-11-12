#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

info "Downloading game server files"

curl -L "https://zeropingheroes.ams3.digitaloceanspaces.com/ut2004-server-3339-ultimate-linux.tar.bz2" | tar -xj -C "$DIR/server"
