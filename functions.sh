#!/bin/bash

echo_info() {
    echo -e "\033[0;32m$*\033[0m";
}
echo_error() {
    echo -e "\033[0;31m$*\033[0m" >&2;
}
echo_warning(){
    echo -e "\033[0;33m$*\033[0m";
}

function install_game {
    GAME_NAME=${1%/}
    GAMES_DIR=$2
    IN_LOOP=${3:-false}

    if [ -f $GAMES_DIR/$GAME_NAME/install.sh ]; then

        echo_info "Installing $GAME_NAME"
        mkdir -p $GAMES_DIR/$GAME_NAME/server
        source $GAMES_DIR/$GAME_NAME/install.sh

        if [ -d $GAMES_DIR/$GAME_NAME/configs ]; then
            echo_info "Installing symlinks for config files"
            cp -rfs $GAMES_DIR/$GAME_NAME/configs/* $GAMES_DIR/$GAME_NAME/server
        fi

        echo_info "Successfully installed $GAME_NAME"
    else
        echo_error "Installer for '$GAME_NAME' not found"
    fi
}

function update_game {
    GAME_NAME=${1%/}
    GAMES_DIR=$2
    IN_LOOP=${3:-false}

    if [ -f "$GAMES_DIR/$GAME_NAME/update.sh" ]; then
        echo_info "Updating $GAME_NAME"
        source "$GAMES_DIR/$GAME_NAME/update.sh"
    else
        echo_error "Updater for '$GAME_NAME' not found"
    fi
}

function remove_game {
    GAME_NAME=${1%/}
    GAMES_DIR=$2

    if [ -d "$GAMES_DIR/$GAME_NAME/server" ]; then
        echo_info "Removing $GAME_NAME"
        rm -r "$GAMES_DIR/$GAME_NAME/server"
    else
        echo_error "'$GAME_NAME' not found"
    fi
}

function server_running {
    GAME_NAME=$1
    LAUNCHER_NAME=$2

    if (tmux has-session -t "$GAME_NAME-$LAUNCHER_NAME" 2> /dev/null); then
        return 0 # session exists
    else
        return 1
    fi
}

function update_steam_game {
    APP_ID=$1
    GAME_DIR=$2
    STEAM_USER=${3:-anonymous}

    if [ ! -d "$GAME_DIR" ]; then
        echo_error "Specified game directory does not exist"
        exit 1
    fi

    mkdir -p "$GAME_DIR/server"

    if [ $STEAM_USER = "anonymous" ]; then
        # Steam user not specified - download as anonymous
        ${SCRIPT_DIR}/SteamCMD/steamcmd.sh +force_install_dir "$GAME_DIR/server" +login $STEAM_USER +app_update "$APP_ID" validate +quit
    else
        # Steam user specified - request a license
        ${SCRIPT_DIR}/SteamCMD/steamcmd.sh +force_install_dir "$GAME_DIR/server" +login $STEAM_USER +app_license_request "$APP_ID" +app_update "$APP_ID" validate +quit
    fi
}

function echo_tmux_warning {
    echo_warning "Do not use CTRL+C to exit the console - the server will exit!"
    echo_warning "Instead, press CTRL+B and then D, which will close the console but leave the game running"
    read -p $'\e[32mOpen the console? y/n \e[0m ' -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        exit 0
    fi
}
