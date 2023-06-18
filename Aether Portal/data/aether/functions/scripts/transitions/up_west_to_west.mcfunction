#Converts upWest to West
execute positioned ~ ~-2 ~ if entity @e[tag=aetherCheck,tag=!aetherPortal,tag=aetherWest,type=area_effect_cloud,distance=..0.01] run kill @s
tp @s ~ ~-2 ~
tag @s remove aetherUpWest
tag @s add aetherWest
