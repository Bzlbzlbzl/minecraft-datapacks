#Converts upSouth to South
execute positioned ~ ~-2 ~ if entity @e[tag=aetherCheck,tag=!aetherPortal,tag=aetherSouth,type=area_effect_cloud,distance=..0.01] run kill @s
tp @s ~ ~-2 ~
tag @s remove aetherUpSouth
tag @s add aetherSouth
