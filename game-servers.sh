#!/bin/bash

# Abort script on first error
set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $SCRIPT_DIR/functions.sh
source $SCRIPT_DIR/.env

# Help
if [ $# == 0 ]; then
    echo "
    Usage:

      game-servers install SteamCMD
      game-servers install <game1> [<game2>...]

      game-servers update <game1> [<game2>...]
      game-servers update all

      game-servers configure <game>

      game-servers remove <game1> [<game2>...]
      game-servers remove all

      game-servers launch <game> [<launcher>]
      game-servers console <game> [<launcher>]
      game-servers restart <game> [<launcher>]
      game-servers stop <game> [<launcher>]

      game-servers status
    "
    exit
fi

COMMAND=${1,,}

# Commands
case $COMMAND in

    "install")

        # Argument is a single game (or SteamCMD)
        if [ $# == 2 ]; then
            GAME_NAME=$2

            install_game $GAME_NAME $SCRIPT_DIR

        # Argument is a list of games
        elif [ $# -gt 2 ]; then
            for GAME_NAME in "$@"; do
                if [ $GAME_NAME != "install" ]; then
                    install_game $GAME_NAME $SCRIPT_DIR
                fi
            done
        fi
        ;;

    "update")

        # Argument is a single game
        if [ $# == 2 ] && [ $2 != "all" ]; then
            GAME_NAME=$2

            update_game $GAME_NAME $SCRIPT_DIR

        # Argument is "all"
        elif [ $# == 2 ] && [ "$2" == "all" ]; then
            echo_info "Updating all game servers"
            for GAME_NAME in */ ; do
                if [ $GAME_NAME != "SteamCMD/" ]; then
                    update_game $GAME_NAME $SCRIPT_DIR true
                fi
            done

        # Argument is a list of games
        elif [ $# -gt 2 ]; then
            for GAME in "$@"; do
                if [ "$GAME" != "update" ]; then
                    update_game $GAME $SCRIPT_DIR
                fi
            done
        fi
        ;;

    "configure")

        GAME_NAME=$2
        configure_game $GAME_NAME $SCRIPT_DIR

    ;;

    "remove")

       # Argument is a single game
        if [ $# == 2 ] && [ $2 != "all" ]; then
            GAME_NAME=$2

            remove_game $GAME_NAME $SCRIPT_DIR

        # Argument is "all"
        elif [ $# == 2 ] && [ "$2" == "all" ]; then
            echo_info "Removing all game servers"
            for GAME_NAME in */ ; do
                if [ $GAME_NAME != "SteamCMD/" ]; then
                    remove_game $GAME_NAME $SCRIPT_DIR
                fi
            done

        # Argument is a list of games
        elif [ $# -gt 2 ]; then
            for GAME in "$@"; do
                if [ "$GAME" != "remove" ]; then
                    remove_game $GAME $SCRIPT_DIR
                fi
            done
        fi
        ;;

    "launch")

        GAME_NAME=${2%/}
        LAUNCHER_NAME=${3:-default}

        LAUNCH_SCRIPT="$GAME_NAME/launchers/$LAUNCHER_NAME.sh"
        TMUX_LOG="$GAME_NAME/logs/$GAME_NAME-$LAUNCHER_NAME-tmux-error.log"

        if [ -f ${LAUNCH_SCRIPT} ]; then
            echo_info "Launching $GAME_NAME with \"$LAUNCHER_NAME\" launcher"
            if [ ! -d "$GAME_NAME/logs" ]; then
                mkdir -p "$GAME_NAME/logs"
            fi
            tmux new-session -d -s "$GAME_NAME-$LAUNCHER_NAME" "${LAUNCH_SCRIPT}" 2> "${TMUX_LOG}"
            echo_tmux_warning
            tmux attach-session -t "$GAME_NAME-$LAUNCHER_NAME"
        else
            echo_error "Launcher \"$LAUNCHER_NAME\" for $GAME_NAME not found"
            exit
        fi
        ;;

    "console")

        GAME_NAME=${2%/}
        LAUNCHER_NAME=${3:-default}
        if ( server_running $GAME_NAME $LAUNCHER_NAME ); then
            echo_info "Opening console for $GAME_NAME ($LAUNCHER_NAME)"
            echo_tmux_warning
            tmux attach-session -t "$GAME_NAME-$LAUNCHER_NAME"
        else
            echo_error "$GAME_NAME-$LAUNCHER_NAME not running"
            exit
        fi
        ;;

   "restart")

        GAME_NAME=${2%/}
        LAUNCHER_NAME=${3:-default}

        $SCRIPT_DIR/game-servers.sh stop $GAME_NAME $LAUNCHER_NAME
        until ! server_running $GAME_NAME $LAUNCHER_NAME
        do
            sleep 0.1
        done
	$SCRIPT_DIR/game-servers.sh launch $GAME_NAME $LAUNCHER_NAME

        ;;

    "stop")

        GAME_NAME=${2%/}
        LAUNCHER_NAME=${3:-default}
        if ( server_running $GAME_NAME $LAUNCHER_NAME ); then
            echo_info "Stopping $GAME_NAME ($LAUNCHER_NAME) server"
            tmux send-keys "^c" -t "$GAME_NAME-$LAUNCHER_NAME"
        else
            echo_error "$GAME_NAME-$LAUNCHER_NAME not running"
            exit
        fi
        ;;

    "status")

        echo_info "Currently running servers:"
        tmux list-sessions
        exit
        ;;

    *)
        echo_error "Unknown command: $COMMAND"
        exit

        ;;
esac

