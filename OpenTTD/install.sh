#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/../functions.sh

mkdir -p "$DIR/server"

if [ ! -f "openttd-14.1-linux-generic-amd64.tar.xz" ]; then
    echo_info "Downloading game server files"
    curl -L "https://cdn.openttd.org/openttd-releases/14.1/openttd-14.1-linux-generic-amd64.tar.xz" -o "openttd-14.1-linux-generic-amd64.tar.xz"
fi

echo_info "Extracting game server files"
tar xf openttd-14.1-linux-generic-amd64.tar.xz -C "$DIR/server" --strip 1

if [ ! -f "$DIR/opengfx-7.1-all.zip" ]; then
    echo_info "Downloading graphics set"
    curl -L "https://cdn.openttd.org/opengfx-releases/7.1/opengfx-7.1-all.zip" -o opengfx-7.1-all.zip
fi

echo_info "Extracting graphics sets"
unzip -o opengfx-7.1-all.zip -d "$DIR"
tar xf "opengfx-7.1.tar" -C "$DIR/server/baseset" --strip 1
