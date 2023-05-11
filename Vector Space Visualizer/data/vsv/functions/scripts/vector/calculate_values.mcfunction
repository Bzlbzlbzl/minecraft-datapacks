#Calculates the norm and relative positions to the origin (stored in scoreboard). Meant to be run by vsvVector
#Calculates displacement of 3 decimal points. NOTE THE Y-Z SWAP
execute store result score @s vsv_dx run data get entity @s Pos[0] 100
execute store result score @s vsv_dy run data get entity @s Pos[2] 100
execute store result score @s vsv_dz run data get entity @s Pos[1] 100
scoreboard players operation @s vsv_dx -= %scaled_origin_x values
scoreboard players operation @s vsv_dy -= %scaled_origin_y values
scoreboard players operation @s vsv_dz -= %scaled_origin_z values
