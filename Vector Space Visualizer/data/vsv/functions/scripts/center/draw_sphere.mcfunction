# Draws a sphere of vectors

#Quick adjust so next circle is off a bit
scoreboard players operation %adjust values = %scaled_circle_incr values
scoreboard players operation %adjust values /= %2 values
execute store result score %turn values run data get entity @s Rotation[0] 1000
scoreboard players operation %turn values += %adjust values
execute store result entity @s Rotation[0] float 0.001 run scoreboard players get %turn values

#Rotation up
execute store result score %turn values run data get entity @s Rotation[1] 1000
scoreboard players operation %turn values += %scaled_space_incr values
execute store result entity @s Rotation[1] float 0.001 run scoreboard players get %turn values

#Prep for next circle
#Calculating value for %circle_count, number of times the current circle function will run before completion
scoreboard players operation %sq_target values = %space_dist values
scoreboard players operation %sq_target values *= %1000 values
scoreboard players operation %sq_target values *= %sq_target values
scoreboard players operation %dist values = %space_dist values
function vsv:scripts/center/find_z_squared
scoreboard players operation %sq_target values -= %z_sq values
scoreboard players set %sq_inc values 1
scoreboard players set %sqrt values 0
scoreboard players set %sq_check values 0
function vsv:scripts/center/sqrt
scoreboard players operation %circle_count values = %circle_times values
scoreboard players operation %circle_count values *= %sqrt values
scoreboard players operation %circle_count values /= %1000 values
scoreboard players operation %circle_count values /= %space_dist values

scoreboard players remove %sphere_count values 1

scoreboard players operation %scaled_circle_incr values = %360 values
scoreboard players operation %scaled_circle_incr values *= %1000 values
scoreboard players operation %scaled_circle_incr values /= %circle_count values

#Draw circle not needed, run in main -> function vsv:scripts/center/draw_circles

#Recursive loop CALLED IN MAIN, NOT HERE
