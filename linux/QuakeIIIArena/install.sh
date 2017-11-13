#!/bin/bash

[ -z $CALLED_FROM_MAIN_SCRIPT ] && { echo "ERROR: This script can only be called from ./game-servers"; exit 1; }

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Extension is .tar.bz2 but the file is not bzipped
info "Downloading game server files"
info "Downloading Quake III Arena"
curl -L "http://zeropingheroes.ams3.digitaloceanspaces.com/quake3-1.32c-x86-full-linux.tar.bz2" | tar -xz -C "$DIR/server"

info "Downloading OSP"
curl -L "http://zeropingheroes.ams3.digitaloceanspaces.com/osp-Quake3-1.03a_full.zip" > "$DIR/server/osp-Quake3-1.03a_full.zip"

info "Extracting OSP"
unzip -q "$DIR/server/osp-Quake3-1.03a_full.zip" -d "$DIR/server/"

info "Removing temporary files"
rm "$DIR/server/osp-Quake3-1.03a_full.zip"
