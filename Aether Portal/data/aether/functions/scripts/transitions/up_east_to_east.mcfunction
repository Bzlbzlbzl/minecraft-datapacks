#Converts upEast to East
execute positioned ~ ~-2 ~ if entity @e[tag=aetherCheck,tag=!aetherPortal,tag=aetherEast,type=area_effect_cloud,distance=..0.01] run kill @s
tp @s ~ ~-2 ~
tag @s remove aetherUpEast
tag @s add aetherEast
