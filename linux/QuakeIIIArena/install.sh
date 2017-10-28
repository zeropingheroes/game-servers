#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/../globals

mkdir -p $DIR/server

# Extension is .tar.bz2 but the file is not bzipped
info "Downloading game server files"
info "Downloading Quake III Arena"
curl -L "http://files.gameservermanagers.com/Quake3/quake3-1.32c-x86-full-linux.tar.bz2" | tar -xz -C "$DIR/server"

info "Downloading OSP"
curl -L "http://osp.dget.cc/orangesmoothie/downloads/osp-Quake3-1.03a_full.zip" > "$DIR/server/osp-Quake3-1.03a_full.zip"

info "Extracting OSP"
unzip -q "$DIR/server/osp-Quake3-1.03a_full.zip" -d "$DIR/server/"

info "Removing temporary files"
rm "$DIR/server/osp-Quake3-1.03a_full.zip"

info "Linking config files"
cp -rs $DIR/configs/* $DIR/server
