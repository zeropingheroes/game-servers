#!/bin/bash

[ -z $CALLED_FROM_MAIN_SCRIPT ] && { echo "ERROR: This script can only be called from ./game-servers"; exit 1; }

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Extension is .tar.bz2 but the file is not bzipped
info "Downloading game server files"
info "Downloading Quake III Arena"
~/go/bin/goodls -u "https://drive.google.com/file/d/1u7hhlZihpruWe86Ae4Uqj0oUndyEy6M6/view"

info "Extracting Quake III Arena"
tar -xzf "quake3-1.32c-x86-full-linux.tar.bz2" -C "$DIR/server"

info "Downloading OSP"
~/go/bin/goodls -u "https://drive.google.com/file/d/1RrHzS_FpERtNDYxqflnijlT9gbmsEH5U/view"

info "Extracting OSP"
unzip -q "$DIR/server/osp-Quake3-1.03a_full.zip" -d "$DIR/server/"

info "Removing temporary files"
rm "$DIR/server/osp-Quake3-1.03a_full.zip" "$DIR/server/quake3-1.32c-x86-full-linux.tar.bz2"
