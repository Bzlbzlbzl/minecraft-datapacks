#Finds the distance between vectors of a circle
scoreboard players add %vec_dist values 1
execute positioned ^ ^ ^0.1 unless entity @e[tag=vsvTestVec,distance=..0.1,tag=!vsvMe] run function vsv:scripts/center/find_vector_dist
