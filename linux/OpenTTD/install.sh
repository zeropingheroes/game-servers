#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/../globals

mkdir -p $DIR/server

info "Downloading game server files"
curl -L "https://binaries.openttd.org/releases/1.7.1/openttd-1.7.1-linux-generic-amd64.tar.gz" | tar -xvz -C "$DIR/server" --strip 1

#info "Linking config files"
#cp -rs $DIR/configs/* $DIR/server

