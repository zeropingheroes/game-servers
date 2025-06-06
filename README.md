# game-servers
Game server configs, launchers and downloaders for our LAN parties.

## Requirements

* Ubuntu 24.04

## Installation

1. Install dependencies

```bash
sudo add-apt-repository multiverse -y
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install steamcmd \
                 unzip \
                 p7zip-full \
                 golang-go
go install github.com/tanaikech/goodls@latest
```

2. Clone the project

```bash
git clone git@github.com:zeropingheroes/game-servers.git
```

3. Install the project
```bash
cd game-servers
./game-servers self-install
```

## Usage

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
      game-servers restart <game> [<launcher>]
      game-servers stop <game> [<launcher>]

      game-servers status
      
## Editing Config files

During installation, config files in each game server's `configs` directory are symlinked into the game server's folder, so you can edit the files in the `configs` directory, and the game server will pick up the changes, and the changes can be put into Git.

Any new files you create will need to be manually symlinked into the game server's folder.