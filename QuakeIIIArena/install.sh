#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/../functions.sh

echo_info "Downloading game server files"
curl -sSL "https://drive.usercontent.google.com/download?id=1u7hhlZihpruWe86Ae4Uqj0oUndyEy6M6&confirm=y" -o "quake3-1.32c-x86-full-linux.tar.bz2" 
curl -sSL "https://drive.usercontent.google.com/download?id=1RrHzS_FpERtNDYxqflnijlT9gbmsEH5U&confirm=y" -o "osp-Quake3-1.03a_full.zip"
curl -sSL "https://drive.usercontent.google.com/download?id=1R-0ZuvvqmTwhNescPzw5am1tv-qSYV4m&confirm=y" -o "q3a-threewave-maps.zip"
curl -sSL "https://drive.usercontent.google.com/download?id=14ksyNbZJKgNjVCm_pLFj2Z1GIgJL3e5H&confirm=y" -o "q3a-custom-maps.zip"

echo_info "Extracting game server files"
tar -xzf "quake3-1.32c-x86-full-linux.tar.bz2" -C "$DIR/server" # Extension is .tar.bz2 but the file is not B-zipped
unzip -q "osp-Quake3-1.03a_full.zip" -d "$DIR/server/"
unzip -q -o "q3a-threewave-maps.zip" -d "$DIR/server/baseq3/"
unzip -q -o "q3a-custom-maps.zip" -d "$DIR/server/baseq3/"

echo_info "Removing temporary files"
rm "quake3-1.32c-x86-full-linux.tar.bz2"
rm "osp-Quake3-1.03a_full.zip"
rm "q3a-threewave-maps.zip"
rm "q3a-custom-maps.zip"
