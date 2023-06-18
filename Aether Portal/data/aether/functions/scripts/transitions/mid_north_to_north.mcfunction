#Converts midNorth to North
execute positioned ~ ~-1 ~ if entity @e[tag=aetherCheck,tag=!aetherPortal,tag=aetherNorth,type=area_effect_cloud,distance=..0.01] run kill @s
tp @s ~ ~-1 ~
tag @s remove aetherMidNorth
tag @s add aetherNorth
