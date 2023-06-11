#Converts aetherEast to aetherWest
execute positioned ~1 ~ ~ if entity @e[tag=aetherCheck,tag=!aetherPortal,tag=aetherWest,type=area_effect_cloud,distance=..0.01] run kill @s
tp @s ~1 ~ ~
tag @s remove aetherEast
tag @s add aetherWest