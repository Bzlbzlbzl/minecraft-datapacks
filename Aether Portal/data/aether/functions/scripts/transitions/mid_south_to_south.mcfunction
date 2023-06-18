#Converts midSouth to South
execute positioned ~ ~-1 ~ if entity @e[tag=aetherCheck,tag=!aetherPortal,tag=aetherSouth,type=area_effect_cloud,distance=..0.01] run kill @s
tp @s ~ ~-1 ~
tag @s remove aetherMidSouth
tag @s add aetherSouth
