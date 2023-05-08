# <Insert Description>
#Logs current position up to 3 decimal points, then calculates displacement of 3 decimal points. NOTE THE Y-Z SWAP
execute store result score %vector_x values run data get entity @s Pos[0] 1000
execute store result score %vector_y values run data get entity @s Pos[2] 1000
execute store result score %vector_z values run data get entity @s Pos[1] 1000

scoreboard players operation %vector_dx values = %origin_x values
scoreboard players operation %vector_dy values = %origin_y values
scoreboard players operation %vector_dz values = %origin_z values
scoreboard players operation %vector_dx values -= %vector_x values
scoreboard players operation %vector_dy values -= %vector_y values
scoreboard players operation %vector_dz values -= %vector_z values

