#Checks mid-west facing aether portal (by west facing I mean from the water block inside the aether portal facing the air inside the aether portal direction)
# Meant to be run by aetherCheck aec, but check4.mcfunction can run it too (as aec) for checks
scoreboard players set @s aether_check 1

execute unless block ~1 ~-2 ~ glowstone run scoreboard players set @s aether_check 0
execute unless block ~ ~-2 ~ glowstone run scoreboard players set @s aether_check 0 
execute unless block ~-1 ~-2 ~ glowstone run scoreboard players set @s aether_check 0
execute unless block ~-2 ~-2 ~ glowstone run scoreboard players set @s aether_check 0
execute unless block ~1 ~-1 ~ glowstone run scoreboard players set @s aether_check 0
execute unless block ~-2 ~-1 ~ glowstone run scoreboard players set @s aether_check 0
execute unless block ~1 ~ ~ glowstone run scoreboard players set @s aether_check 0
execute unless block ~-2 ~ ~ glowstone run scoreboard players set @s aether_check 0
execute unless block ~1 ~1 ~ glowstone run scoreboard players set @s aether_check 0
execute unless block ~-2 ~1 ~ glowstone run scoreboard players set @s aether_check 0
execute unless block ~1 ~2 ~ glowstone run scoreboard players set @s aether_check 0
execute unless block ~ ~2 ~ glowstone run scoreboard players set @s aether_check 0 
execute unless block ~-1 ~2 ~ glowstone run scoreboard players set @s aether_check 0
execute unless block ~-2 ~2 ~ glowstone run scoreboard players set @s aether_check 0

execute unless block ~ ~-1 ~ #aether:air_water run scoreboard players set @s aether_check 0
execute unless block ~-1 ~-1 ~ #aether:air_water run scoreboard players set @s aether_check 0
execute unless block ~ ~ ~ #aether:air_water run scoreboard players set @s aether_check 0
execute unless block ~-1 ~ ~ #aether:air_water run scoreboard players set @s aether_check 0
execute unless block ~ ~1 ~ #aether:air_water run scoreboard players set @s aether_check 0
execute unless block ~-1 ~1 ~ #aether:air_water run scoreboard players set @s aether_check 0

execute if entity @s[type=area_effect_cloud,tag=aetherPortal] unless block ~ ~-1 ~ water[level=0] run scoreboard players set @s aether_check 0
execute if entity @s[type=area_effect_cloud,tag=aetherPortal] unless block ~-1 ~-1 ~ water[level=0] run scoreboard players set @s aether_check 0
execute if entity @s[type=area_effect_cloud,tag=aetherPortal] unless block ~ ~ ~ water[level=0] run scoreboard players set @s aether_check 0
execute if entity @s[type=area_effect_cloud,tag=aetherPortal] unless block ~-1 ~ ~ water[level=0] run scoreboard players set @s aether_check 0
execute if entity @s[type=area_effect_cloud,tag=aetherPortal] unless block ~ ~1 ~ water[level=0] run scoreboard players set @s aether_check 0
execute if entity @s[type=area_effect_cloud,tag=aetherPortal] unless block ~-1 ~1 ~ water[level=0] run scoreboard players set @s aether_check 0

# WILL TAG AEC IF NOT TAGGED YET
execute if score @s[tag=!aetherNorth,tag=!aetherSouth,tag=!aetherEast,tag=!aetherWest,tag=!aetherMidNorth,tag=!aetherMidSouth,tag=!aetherMidEast,tag=!aetherMidWest,tag=!aetherUpNorth,tag=!aetherUpSouth,tag=!aetherUpEast,tag=!aetherUpWest,type=area_effect_cloud] aether_check matches 1 run tag @s add aetherMidWest
