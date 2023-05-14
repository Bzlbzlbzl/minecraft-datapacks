#Draws a circle (first part of vector space)
scoreboard players operation %dist values = %space_dist values
function vsv:scripts/vector/create_distance_vector
execute unless score %first_sph_iter values = %sphere_count values run scoreboard players operation %dist values = %space_dist values
execute unless score %first_sph_iter values = %sphere_count values run function vsv:scripts/vector/create_backwards_vector
execute store result score %turn values run data get entity @s Rotation[0] 100
scoreboard players operation %turn values += %scaled_circle_incr values
execute store result entity @s Rotation[0] float 0.01 run scoreboard players get %turn values
scoreboard players remove %circle_count values 1

#execute unless score %circle_count values > %circle_times values run scoreboard players set %circle_delay values 2