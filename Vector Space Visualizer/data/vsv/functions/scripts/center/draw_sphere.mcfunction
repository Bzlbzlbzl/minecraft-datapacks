# Draws a sphere of vectors

#Quick adjust so next circle is off a bit
scoreboard players operation %adjust values = %scaled_circle_incr values
scoreboard players operation %adjust values /= %2 values
execute store result score %turn values run data get entity @s Rotation[0] 100
scoreboard players operation %turn values += %adjust values
execute store result entity @s Rotation[0] float 0.01 run scoreboard players get %turn values

#Prep for next circle
#HERE v
scoreboard players remove %circle_times values 2
scoreboard players operation %circle_count values = %circle_times values
scoreboard players remove %sphere_count values 1

scoreboard players operation %scaled_circle_incr values = %360 values
scoreboard players operation %scaled_circle_incr values *= %100 values
scoreboard players operation %scaled_circle_incr values /= %circle_times values

#Rotation up
execute store result score %turn values run data get entity @s Rotation[1] 100
scoreboard players operation %turn values += %scaled_space_incr values
execute store result entity @s Rotation[1] float 0.01 run scoreboard players get %turn values

#Draws circle
function vsv:scripts/center/draw_circle

#Recursive loop CALLED IN MAIN, NOT HERE
#execute if score %sphere_count values matches 1.. run function vsv:scripts/center/draw_sphere
scoreboard players remove %sphere_count values 1