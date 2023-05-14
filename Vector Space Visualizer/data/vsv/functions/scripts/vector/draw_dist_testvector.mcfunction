# Creates test vector recursively at a distance
execute if score %dist values matches 0 run summon area_effect_cloud ~ ~ ~ {Tags:["vsvTestVec"]}
execute if score %dist values matches 0.. run scoreboard players remove %dist values 1
execute if score %dist values matches 0.. positioned ^ ^ ^1 run function vsv:scripts/vector/draw_dist_testvector
