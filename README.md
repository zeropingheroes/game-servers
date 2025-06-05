# game-servers
Game server configs, launchers and downloaders for our LAN parties

## Ubuntu 24.04

### Installation

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
git clone https://github.com/zeropingheroes/game-servers.git
```

3. Install the project
```bash
cd game-servers/linux
./game-servers self-install
```

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
      game-servers restart <game> [<launcher>]
      game-servers stop <game> [<launcher>]

      game-servers status
      
### Editing Config files

During installation, config files in each game server's `configs` directory are symlinked into the game server's folder, so you can edit the files in the `configs` directory, and the game server will pick up the changes, and the changes can be put into Git.

Any new files you create will need to be manually symlinked into the game server's folder.

### Supported Game Servers

- ChivalryMedievalWarfare
- CounterStrikeGlobalOffensive
- GarrysMod
- GoldeneyeSource
- HalfLife2Deathmatch
- JustCause2Multiplayer
- OpenTTD
- QuakeIIIArena
- TeamFortress2
- Teeworlds
- UT2004

## Windows

### Installation

1. Run `windows/SteamCMD/download.bat`to download SteamCMD in the default browser

2. Extract `steamcmd.zip` into `windows/SteamCMD`

### Usage

In each of the game folders, if present, run the following batch files in this order:

1. `install.bat` - Download and install the game files (some manual extraction may be required)

2. `copy-configs.bat` - Copy configuration files from the `configs/` directory in that folder into the game server's directory

3. `launch.bat` - Launch the game server

### Editing Config files

All config files in the `configs` directory are **copied** into the game server's folder, so if you update a config file, re-run `copy-configs.bat` to allow the game server to pick up the new version of the file.

### Supported Game Servers

- HiddenSource
- TheShip

(basically because they won't run on Linux...)
