#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 /absolute/path/to/source/configs PTERODACTYL_SERVER_ID"
    exit 1
fi

CONFIG_SOURCE_DIR="$1"
CONFIG_SOURCE_DIR="${CONFIG_SOURCE_DIR%/}"
PTERODACTYL_SERVER_ID="$2"
PTERODACTYL_VOLUME_DIR="/var/lib/pterodactyl/volumes/$PTERODACTYL_SERVER_ID"

if [ ! -d "$CONFIG_SOURCE_DIR" ]; then
    echo "Error: config source dir '$CONFIG_SOURCE_DIR' does not exist or is not a directory."
    exit 2
fi

if [ ! -d "$PTERODACTYL_VOLUME_DIR" ]; then
    echo "Error: Pterodactyl volume directory '$PTERODACTYL_VOLUME_DIR' does not exist."
    exit 2
fi

mapfile -t config_files < <(cd "$CONFIG_SOURCE_DIR" && find . -type f)

for relpath in "${config_files[@]}"; do
    config_source_file="$CONFIG_SOURCE_DIR/${relpath#./}"
    pterodactyl_file="$PTERODACTYL_VOLUME_DIR/${relpath#./}"

    if [ -f "$pterodactyl_file" ]; then
        if ! cmp -s "$config_source_file" "$pterodactyl_file"; then
            if [ "$config_source_file" -nt "$pterodactyl_file" ]; then
                read -p "Copy Source >>> Pterodactyl: ${relpath#./} [y/N] " answer
                if [[ "$answer" =~ ^[Yy]$ ]]; then
                    mkdir -p "$(dirname "$pterodactyl_file")"
                    cp "$config_source_file" "$pterodactyl_file"
                    chown pterodactyl:pterodactyl "$pterodactyl_file"
                fi
            else
                read -p "Copy Pterodactyl >>> Source: ${relpath#./}  [y/N] " answer
                if [[ "$answer" =~ ^[Yy]$ ]]; then
                    mkdir -p "$(dirname "$config_source_file")"
                    cp "$pterodactyl_file" "$config_source_file"
                fi
            fi
        fi
    else
        read -p "Copy Source >>> Pterodactyl: ${relpath#./} [y/N] " answer
        if [[ "$answer" =~ ^[Yy]$ ]]; then
            mkdir -p "$(dirname "$pterodactyl_file")"
            cp "$config_source_file" "$pterodactyl_file"
            chown pterodactyl:pterodactyl "$pterodactyl_file"
        fi
    fi
done


echo "Config sync complete."
