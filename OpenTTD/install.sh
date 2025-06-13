#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/../functions.sh

echo_info "Downloading game server files"
curl -L "https://binaries.openttd.org/releases/1.7.1/openttd-1.7.1-linux-generic-amd64.tar.gz" | tar -xvz -C "$DIR/server" --strip 1

echo_info "Downloading graphics set"
curl -L "https://binaries.openttd.org/extra/opengfx/0.5.2/opengfx-0.5.2-all.zip" > "$DIR/server/opengfx-0.5.2-all.zip"

echo_info "Extracting graphics set"
unzip -q "$DIR/server/opengfx-0.5.2-all.zip" -d "$DIR/server"
tar -xf "$DIR/server/opengfx-0.5.2.tar" -C "$DIR/server/baseset" --strip 1

echo_info "Removing temporary files"
rm "$DIR/server/opengfx-0.5.2-all.zip"
rm "$DIR/server/opengfx-0.5.2.tar"
