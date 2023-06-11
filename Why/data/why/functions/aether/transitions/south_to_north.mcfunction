#Converts aetherSouth to aetherNorth. Kills if duplicate
execute positioned ~ ~ ~1 if entity @e[tag=aetherCheck,tag=!aetherPortal,tag=aetherNorth,type=area_effect_cloud,distance=..0.01] run kill @s
tp @s ~ ~ ~1
tag @s remove aetherSouth
tag @s add aetherNorth