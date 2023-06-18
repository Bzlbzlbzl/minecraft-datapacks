#Recrusively tries to find water for 4 blocks (marks first water hit that satisfies). 
scoreboard players remove @s aether_water 1
execute positioned ^ ^ ^0.1 if block ~ ~ ~ water[level=0] align xyz unless entity @e[tag=aetherCheck,distance=..0.01] run tag @s add aetherPlayer
execute positioned ^ ^ ^0.1 if block ~ ~ ~ water[level=0] align xyz unless entity @e[tag=aetherCheck,distance=..0.01] run summon area_effect_cloud ~ ~ ~ {Duration:-1,Age:-2147483648,WaitTime:-2147483648,Tags:["aetherCheck"]}
execute positioned ^ ^ ^0.1 if block ~ ~ ~ water[level=0] align xyz as @e[tag=aetherCheck,distance=..0.01,tag=!aetherFailed,tag=!aetherNorth,tag=!aetherSouth,tag=!aetherEast,tag=!aetherWest,limit=1,sort=nearest] run function aether:scripts/check12
execute if entity @s[tag=aetherPlayer] run tag @s remove aetherPlayer
execute if score @s aether_water matches 1.. positioned ^ ^ ^0.1 run function aether:scripts/find_water