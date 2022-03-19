#Recursively generates a random number (until dtCount reaches 2^21) with the three AOE clouds
scoreboard players operation @e[type=minecraft:area_effect_cloud,tag=dtPos,limit=1,sort=random] death_tag += @e[type=minecraft:armor_stand,tag=dtInc,limit=1] death_tag
scoreboard players operation @e[type=minecraft:armor_stand,tag=dtInc,limit=1] death_tag += @e[type=minecraft:armor_stand,tag=dtInc,limit=1] death_tag
execute unless score @e[type=minecraft:armor_stand,tag=dtInc,limit=1] death_tag matches 2097152.. run function death-tag:scripts/gen_num
