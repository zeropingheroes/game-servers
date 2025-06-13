#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIR/../functions.sh

STEAMCMD_URL="https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz"

echo_info "Installing x86 dependencies"
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install libstdc++6:i386 -y

echo_info "Downloading and extracting SteamCMD"
curl -sSL "${STEAMCMD_URL}" | tar -xzvf - -C "${DIR}"

echo_info "Preparing directories for SteamCMD"
mkdir -p "${DIR}/steamapps"


if [[ -z "${STEAMCMD_USERNAME// }" ]]; then
    echo_info "Specify a Steam account which owns the games you wish to host"
    echo_info "Username:"
    read STEAMCMD_USERNAME
fi

echo_info "Logging into SteamCMD and updating"
${DIR}/steamcmd.sh +login $STEAMCMD_USERNAME +quit

echo_info "Copying Steam libraries into place"
mkdir -p "${DIR}/.steam/sdk32" "${DIR}/.steam/sdk64"
cp "${DIR}/linux32/steamclient.so" "${DIR}/.steam/sdk32/steamclient.so"
cp "${DIR}/linux64/steamclient.so" "${DIR}/.steam/sdk64/steamclient.so"

echo_info "Installation complete!"
