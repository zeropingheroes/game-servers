#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/../include

info "Downloading game server files"
source $DIR/update.sh

info "Linking config files"
cp -rs $DIR/configs/* $DIR/server

