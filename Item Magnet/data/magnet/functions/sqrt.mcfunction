#Simply finds the square root of the numbers (rounded to the nearest whole number)
scoreboard players operation @s magnet_sq_count += @s magnet_sq_inc
scoreboard players add @s magnet_sq_inc 2
scoreboard players add @s magnet_distance 1
execute as @s if score @s magnet_sq_dist > @s magnet_sq_count run function magnet:sqrt