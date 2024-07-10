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
1. Copy the following files into your mission
   - sound_landslide.ogg
   - The whole Functions Folder and its content

2. Merge `CfgFunctions` from the `Description.ext` into your Mission's `description.ext`
   
3. Open `Functions\Rockslide\fn_post_init.sqf`
   - move to Define Section:
     - `_bomb`:
       - object where the explosions gonna be spawned.
       - the landslide will start from here.
       - will be deleted once the landslide event starts.
     - `_duration`:
       - duration of the landslide event.
       - Currently based on length of `sound_landslide.ogg`
     - `_layerName`:
       - 3den Editor Layer Name for the debries caused of the landslide.
       - Will be unhidden during the landslide.
       - Centerposition of all objects will define the endpoint of the landslide.
     - `_timeDetonation`:
       - Time of the day at which the explosion gonna occour to that will trigger the landslide.
       - Example: `7.25` => `07:15`
       - wont work if mission starts before midnight and Detonation occours after midnight.
     - `_numberOfBombs`: 
       - Amount of explosions (gbu-12) that occour randomly during the first 2 secounds.


## Other Notes
- `_bomb`
  - when this object gets damaged (>0.1), it will trigger the landslide
  - when this object gets deleted, (for exapmle, by zeus to manually trigger it), it will start the landslide
- `fn_post_init.sqf`
  - handles  the eventhandlers and sets everything up
  - has the `post_init` flag in CfgFunctions, meaning it will get executed at the beginning of the mission.
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