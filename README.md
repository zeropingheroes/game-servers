# game-servers
Game server configs, launchers and downloaders for our LAN parties

## Linux

### Installation

1. `dpkg --add-architecture i386 && apt update -y && apt install -y lib32stdc++6 lib32tinfo5 lib32ncurses5 libcurl3-gnutls:i386 libc6 libfontconfig1 libfreetype6 libgcc1 libicu55 liblzma5 liblzo2-2 libpng12-0 libsdl1.2debian libsdl1.2debian:i386 libstdc++6 libxdg-basedir1 zlib1g libstdc++5:i386 unzip p7zip-full`

2. `git clone https://github.com/zeropingheroes/game-servers.git && cd game-servers/linux`

3. `./game-servers self-install`

### Usage

    $ ./game-servers

    Usage:

      game-servers self-install
      game-servers self-update

      game-servers install <game1> [<game2>...]
      game-servers install all

      game-servers update <game1> [<game2>...]
      game-servers update all

      game-servers remove <game1> [<game2>...]
      game-servers remove all

      game-servers launch <game> [<launcher>]
      game-servers console <game> [<launcher>]
      game-servers stop <game> [<launcher>]

      game-servers status

## Windows

### Installation

1. Run `download.bat` in `windows/SteamCMD` to download SteamCMD in the default browser

2. Extract `steamcmd.zip` into `windows/SteamCMD`

### Usage

In each of the game folders, if present, run the following batch files in this order:

1. `install.bat` - Download and install the game files (some manual extraction may be required)

2. `copy-configs.bat` - Copy configuration files from the `configs/` directory in that folder into the game server's directory

3. `launch.bat` - Launch the game server