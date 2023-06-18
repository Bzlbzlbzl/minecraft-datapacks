#Either increment or reset depending. Will avoid tags cuz inefficient apparently
scoreboard players operation %init aether_check = @s aether_check

execute as @a at @s align xyz positioned ~0.5 ~ ~ if entity @e[tag=aetherCheck,tag=aetherPortal,tag=aetherNorth,type=area_effect_cloud,distance=..0.01] run scoreboard players add @s aether_check 1
execute as @a at @s align xyz positioned ~0.5 ~ ~1 if entity @e[tag=aetherCheck,tag=aetherPortal,tag=aetherNorth,type=area_effect_cloud,distance=..0.01] run scoreboard players add @s aether_check 1
execute as @a at @s align xyz positioned ~0.5 ~-1 ~ if entity @e[tag=aetherCheck,tag=aetherPortal,tag=aetherNorth,type=area_effect_cloud,distance=..0.01] run scoreboard players add @s aether_check 1
execute as @a at @s align xyz positioned ~0.5 ~-1 ~1 if entity @e[tag=aetherCheck,tag=aetherPortal,tag=aetherNorth,type=area_effect_cloud,distance=..0.01] run scoreboard players add @s aether_check 1
execute as @a at @s align xyz positioned ~0.5 ~-2 ~ if entity @e[tag=aetherCheck,tag=aetherPortal,tag=aetherNorth,type=area_effect_cloud,distance=..0.01] run scoreboard players add @s aether_check 1
execute as @a at @s align xyz positioned ~0.5 ~-2 ~1 if entity @e[tag=aetherCheck,tag=aetherPortal,tag=aetherNorth,type=area_effect_cloud,distance=..0.01] run scoreboard players add @s aether_check 1

execute as @a at @s align xyz positioned ~ ~ ~0.5 if entity @e[tag=aetherCheck,tag=aetherPortal,tag=aetherWest,type=area_effect_cloud,distance=..0.01] run scoreboard players add @s aether_check 1
execute as @a at @s align xyz positioned ~1 ~ ~0.5 if entity @e[tag=aetherCheck,tag=aetherPortal,tag=aetherWest,type=area_effect_cloud,distance=..0.01] run scoreboard players add @s aether_check 1
execute as @a at @s align xyz positioned ~ ~-1 ~0.5 if entity @e[tag=aetherCheck,tag=aetherPortal,tag=aetherWest,type=area_effect_cloud,distance=..0.01] run scoreboard players add @s aether_check 1
execute as @a at @s align xyz positioned ~1 ~-1 ~0.5 if entity @e[tag=aetherCheck,tag=aetherPortal,tag=aetherWest,type=area_effect_cloud,distance=..0.01] run scoreboard players add @s aether_check 1
execute as @a at @s align xyz positioned ~ ~-2 ~0.5 if entity @e[tag=aetherCheck,tag=aetherPortal,tag=aetherWest,type=area_effect_cloud,distance=..0.01] run scoreboard players add @s aether_check 1
execute as @a at @s align xyz positioned ~1 ~-2 ~0.5 if entity @e[tag=aetherCheck,tag=aetherPortal,tag=aetherWest,type=area_effect_cloud,distance=..0.01] run scoreboard players add @s aether_check 1

execute if score %init aether_check = @s aether_check run scoreboard players set @s aether_check 0