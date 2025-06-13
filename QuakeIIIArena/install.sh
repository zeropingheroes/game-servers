#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/../functions.sh

echo_info "Downloading game server files"
~/go/bin/goodls -u "https://drive.google.com/file/d/1u7hhlZihpruWe86Ae4Uqj0oUndyEy6M6/view" # Q3A 
~/go/bin/goodls -u "https://drive.google.com/file/d/1RrHzS_FpERtNDYxqflnijlT9gbmsEH5U/view" # OSP

echo_info "Extracting game server files"
tar -xzf "quake3-1.32c-x86-full-linux.tar.bz2" -C "$DIR/server" # Extension is .tar.bz2 but the file is not B-zipped
unzip -q "osp-Quake3-1.03a_full.zip" -d "$DIR/server/"

echo_info "Removing temporary files"
rm "quake3-1.32c-x86-full-linux.tar.bz2"
rm "osp-Quake3-1.03a_full.zip"
