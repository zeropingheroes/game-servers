#!/bin/bash

[ -z $CALLED_FROM_MAIN_SCRIPT ] && { echo "ERROR: This script can only be called from ./game-servers"; exit 1; }

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

info "Downloading game server files"
~/go/bin/goodls -u "https://drive.google.com/file/d/1u7hhlZihpruWe86Ae4Uqj0oUndyEy6M6/view" # Q3A 
~/go/bin/goodls -u "https://drive.google.com/file/d/1RrHzS_FpERtNDYxqflnijlT9gbmsEH5U/view" # OSP

info "Extracting game server files"
tar -xzf "quake3-1.32c-x86-full-linux.tar.bz2" -C "$DIR/server" # Extension is .tar.bz2 but the file is not B-zipped
unzip -q "osp-Quake3-1.03a_full.zip" -d "$DIR/server/"

info "Removing temporary files"
rm "quake3-1.32c-x86-full-linux.tar.bz2"
rm "osp-Quake3-1.03a_full.zip"
