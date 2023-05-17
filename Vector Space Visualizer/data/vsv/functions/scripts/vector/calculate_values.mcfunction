#Calculates relative positions to the origin (stored in scoreboard) to 3 decimal points. NOTE THE Y-Z SWAP. Meant to be run by vsvVector
execute store result score @s vsv_dx run data get entity @s Pos[0] 1000
execute store result score @s vsv_dy run data get entity @s Pos[2] 1000
execute store result score @s vsv_dz run data get entity @s Pos[1] 1000
scoreboard players operation @s vsv_dx -= %scaled_origin_x values
scoreboard players operation @s vsv_dy -= %scaled_origin_y values
scoreboard players operation @s vsv_dz -= %scaled_origin_z values
