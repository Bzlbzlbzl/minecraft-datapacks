# Creates vector recursively at a distance
execute if score %dist values matches 0 run function vsv:scripts/vector/create_vector
execute if score %dist values matches 0.. run scoreboard players remove %dist values 1
execute if score %dist values matches 0.. positioned ^ ^ ^1 run function vsv:scripts/vector/create_distance_vector
