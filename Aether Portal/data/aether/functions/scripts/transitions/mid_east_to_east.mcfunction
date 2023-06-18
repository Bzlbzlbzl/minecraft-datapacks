#Converts midEast to East
execute positioned ~ ~-1 ~ if entity @e[tag=aetherCheck,tag=!aetherPortal,tag=aetherEast,type=area_effect_cloud,distance=..0.01] run kill @s
tp @s ~ ~-1 ~
tag @s remove aetherMidEast
tag @s add aetherEast
