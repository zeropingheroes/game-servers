# game-servers
Game server configs, launchers and downloaders for our LAN parties

## Linux

### Installation

1. `apt update -y && apt install -y lib32stdc++6 lib32tinfo5 lib32ncurses5 libcurl3-gnutls:i386 libc6 libfontconfig1 libfreetype6 libgcc1 libicu55 liblzma5 liblzo2-2 libpng12-0 libsdl1.2debian libsdl1.2debian:i386 libstdc++6 libxdg-basedir1 zlib1g libstdc++5:i386 unzip`

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

...
