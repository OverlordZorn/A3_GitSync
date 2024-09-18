## Overview
This is set of functions to be easily imported into a mission.
It imitates the event of a landslide, triggered by explosions, resulting in rubble/debries blocking a road for example.

> [!IMPORTANT]
> Dependency: CBA


## Video Preview

https://www.youtube.com/watch?v=vvOSc_ZxDQY

https://www.youtube.com/watch?v=0wmoexW90Zo

https://www.youtube.com/watch?v=LfeLntQW7Y4

https://www.youtube.com/watch?v=Ec_w5YxQ5ug



## How to Import
1. Copy the `rockslide` folder into your missionfolder

2. Merge `CfgFunctions` from the `description.ext` into your Mission's `description.ext`
   
3. Open `\Rockslide\functions\fn_define.sqf` to adjust if needed.
Default Layername: `ROCKSLIDE`
Default StartObject Variable Name: `rockslide_start`

## How to use
1. create an object (for example: box of cereal) to define the start pos of the rockslide. Explosions will happen here.
2. create a layer in the editor and define a name, like `ROCKSLIDE`. Fill this layer with object that shall be revealed during the rockslide event.

3. Open `\Rockslide\functions\fn_define.sqf` and add a function call per landslide event.

Parameters:
- StartObject: Where the rockslide will start.
- layername: the name of the editor layer
- numBombs: the amount of explosions at the start of the rockslide
- duration: the time it will take for the rockslide effect spawners to go from start position to end position.
- _recieveDmg: if damage on the startObject shall trigger the landslide.

## How to trigger the event
There are multiple ways to trigger/start the rockslide event.
1. Use Zeus to delete the StartObject
2. `zrn_rockslide_fnc_prep` will monitor and wait for a global variable to be set to `true`. the name will be generated based on the layername, for example:
`Layername: "ROCKSLIDE"` -> `TriggerVariable: "ROCKSLIDE_trigger"`
`Layername: "ROCKSLIDE 02"` -> `TriggerVariable: "ROCKSLIDE_02_trigger"`
3. (optional, based on _recieveDmg) Tell the players to damage the startObject. If the damage recieved on the certain object exceeds 0.1, it will trigger the rockslide event.

The functions returns the trigger-variablename as a string, but it will also be logged in the rpt and, when in the editor, will be displayed in systemChat.


## Other Notes
- `fn_global_effects.sqf`
  - handles all global effects
    - Explosions
    - playSound3d
    - unhides the objects
- `fn_local_effects.sqf`
  - handles all clientside effects
    - Cam Shake
    - Camera Blur
    - Particles (in seperate files)
      - `fn_local_rocks.sqf`
      - `fn_local_smoke.sqf`
- Partially inspired by `Alias' Rockslide` Script.
  - particles are a direct copy.
- Made with Dedicated Servers in mind!
  - might have missed something though - feedback apprechiated!
