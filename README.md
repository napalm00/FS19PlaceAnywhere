# Place Anywhere mod for Farming Simulator 19
This mod lets you place buildings anywhere in your land, including within other buildings.

![Place Anywhere](https://i.imgur.com/FZ4SIYF.png)

# Installation
1. Download the latest version from the [releases page](https://github.com/napalm00/FS19PlaceAnywhere/releases)
2. Place the downloaded zip in your `Documents/My Games/FarmingSimulator19/mods` folder
3. Launch the game and enable the mod in the mission start screen

# Configuration
You can change the cost of terrain modifications by opening `PlaceAnywhere.lua` in the mod's zip file and changing the value of
```
PlacementScreenController.DISPLACEMENT_COST_PER_M3 = 1; -- Edit this to change the terrain modification cost per cubic meter (game default: 50)
```

# Notes
I've tested this mod and didn't notice any side effects, however it might still cause issues as it removes some game checks.

# Changelog

**1.1**: Fixed bug when buying vehicles
**1.0**: Initial release