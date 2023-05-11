#Calculates the norm and relative positions to the origin (stored in scoreboard). Meant to be run by vsvVectorTip
#Calculates displacement of 3 decimal points. NOTE THE Y-Z SWAP
execute store result score @s vsv_dx run data get entity @s Pos[0] 100
execute store result score @s vsv_dy run data get entity @s Pos[2] 100
execute store result score @s vsv_dz run data get entity @s Pos[1] 100
scoreboard players operation @s vsv_dx -= %scaled_origin_x values
scoreboard players operation @s vsv_dy -= %scaled_origin_y values
scoreboard players operation @s vsv_dz -= %scaled_origin_z values

#Estimates the norm using recursion for the sqrt
scoreboard players operation %sq_dx values = @s vsv_dx
scoreboard players operation %sq_dy values = @s vsv_dy
scoreboard players operation %sq_dz values = @s vsv_dz
scoreboard players operation %sq_dx values /= %100 values
scoreboard players operation %sq_dy values /= %100 values
scoreboard players operation %sq_dz values /= %100 values
scoreboard players operation %sq_dx values *= %sq_dx values
scoreboard players operation %sq_dy values *= %sq_dy values
scoreboard players operation %sq_dz values *= %sq_dz values
scoreboard players set %sq_target values 0
scoreboard players operation %sq_target values += %sq_dx values
scoreboard players operation %sq_target values += %sq_dy values
scoreboard players operation %sq_target values += %sq_dz values
scoreboard players set %sq_inc values 1
scoreboard players set %sqrt values 0
scoreboard players set %sq_check values 0
function vsv:scripts/vector/sqrt
scoreboard players operation @s vsv_norm = %sqrt values
execute if entity @s[tag=vsvVectorTip,tag=vsvSpawned] as @e[tag=vsvVectorTail,tag=vsvSpawned] run scoreboard players operation @s vsv_norm = %sqrt values