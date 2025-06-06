#!/bin/bash

[ -z $CALLED_FROM_MAIN_SCRIPT ] && { echo "ERROR: This script can only be called from ./game-servers"; exit 1; }

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

info "Downloading game server files"
curl -L "https://binaries.openttd.org/releases/1.7.1/openttd-1.7.1-linux-generic-amd64.tar.gz" | tar -xvz -C "$DIR/server" --strip 1

info "Downloading graphics set"
curl -L "https://binaries.openttd.org/extra/opengfx/0.5.2/opengfx-0.5.2-all.zip" > "$DIR/server/opengfx-0.5.2-all.zip"

info "Extracting graphics set"
unzip -q "$DIR/server/opengfx-0.5.2-all.zip" -d "$DIR/server"
tar -xf "$DIR/server/opengfx-0.5.2.tar" -C "$DIR/server/baseset" --strip 1

info "Removing temporary files"
rm "$DIR/server/opengfx-0.5.2-all.zip"
rm "$DIR/server/opengfx-0.5.2.tar"
