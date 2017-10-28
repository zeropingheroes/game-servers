#!/bin/bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

mkdir -p $SCRIPTPATH/server

# Extension is .tar.bz2 but the file is not bzipped
echo "Downloading Quake III Arena"
curl -L "http://files.gameservermanagers.com/Quake3/quake3-1.32c-x86-full-linux.tar.bz2" | tar -xz -C "$SCRIPTPATH/server"

echo "Downloading OSP"
curl -L "http://osp.dget.cc/orangesmoothie/downloads/osp-Quake3-1.03a_full.zip" > "$SCRIPTPATH/server/osp-Quake3-1.03a_full.zip"

echo "Extracting OSP"
unzip -q "$SCRIPTPATH/server/osp-Quake3-1.03a_full.zip" -d "$SCRIPTPATH/server/"

echo "Removing temporary files"
rm "$SCRIPTPATH/server/osp-Quake3-1.03a_full.zip"
