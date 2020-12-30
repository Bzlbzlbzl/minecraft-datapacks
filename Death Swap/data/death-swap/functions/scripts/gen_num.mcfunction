#Recursively generates a random number (until dsCount reaches 2^21) with the three AOE clouds
scoreboard players operation @e[type=minecraft:area_effect_cloud,tag=dsPos,limit=1,sort=random] death_swap += @e[type=minecraft:area_effect_cloud,tag=dsInc,limit=1] death_swap
scoreboard players operation @e[type=minecraft:area_effect_cloud,tag=dsInc,limit=1] death_swap += @e[type=minecraft:area_effect_cloud,tag=dsInc,limit=1] death_swap
execute unless score @e[type=minecraft:area_effect_cloud,tag=dsInc,limit=1] death_swap matches 2097152.. run function death-swap:scripts/gen_num
