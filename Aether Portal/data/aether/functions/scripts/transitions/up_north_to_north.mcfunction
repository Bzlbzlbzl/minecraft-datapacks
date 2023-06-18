#Converts upNorth to North
execute positioned ~ ~-2 ~ if entity @e[tag=aetherCheck,tag=!aetherPortal,tag=aetherNorth,type=area_effect_cloud,distance=..0.01] run kill @s
tp @s ~ ~-2 ~
tag @s remove aetherUpNorth
tag @s add aetherNorth
