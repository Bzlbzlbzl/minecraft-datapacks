# TEST TEST TEST

scoreboard players set %space_incr values 6
scoreboard players set %space_dist values 8
scoreboard players set %360 values 360
scoreboard players set %4 values 4

data modify entity @s Rotation[1] set value 0.0f

scoreboard players operation %scaled_space_incr values = %space_incr values
scoreboard players operation %scaled_space_incr values *= %100 values

scoreboard players operation %scaled_circle_incr values = %scaled_space_incr values
#scoreboard players operation %circle_incr values = %space_incr values

scoreboard players operation %circle_times values = %360 values
scoreboard players operation %circle_times values /= %space_incr values
scoreboard players operation %circle_count values = %circle_times values

scoreboard players operation %sphere_count values = %circle_times values
scoreboard players operation %sphere_count values /= %2 values
#here^


function vsv:scripts/center/draw_circle

#BELOW IS AUTOMATICALLY CALLED
#execute if score %sphere_count values matches 1.. run function vsv:scripts/center/draw_sphere

#draw final 2 dots