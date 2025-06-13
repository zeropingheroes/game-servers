#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/../functions.sh

echo_info "Downloading game server files"

source $DIR/update.sh
