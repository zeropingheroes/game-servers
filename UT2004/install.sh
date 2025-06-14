#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/../functions.sh

echo_info "Downloading game server files"
curl -sSL "https://drive.usercontent.google.com/download?id=1Go5XZe3cQCL0FocmxutcRoVGcCxiCU9y&confirm=y" -o "ut2004-server-3339-ultimate-linux.tar.bz2"

echo_info "Extracting game server files"
tar -xjf "ut2004-server-3339-ultimate-linux.tar.bz2" -C "$DIR/server"

echo_info "Removing temporary files"
rm "ut2004-server-3339-ultimate-linux.tar.bz2"