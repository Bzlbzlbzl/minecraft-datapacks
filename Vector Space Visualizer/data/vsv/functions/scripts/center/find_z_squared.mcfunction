#Finds the square of the z distance from origin. NOTE THE Y-Z FLIP
execute if score %dist values matches 0 run summon area_effect_cloud ~ ~ ~ {Tags:["vsvMarker"]}
execute if score %dist values matches 0 store result score %z_sq values run data get entity @e[type=area_effect_cloud,limit=1,tag=vsvMarker] Pos[1] 1000
execute if score %dist values matches 0 run kill @e[tag=vsvMarker]
execute if score %dist values matches 0 run scoreboard players operation %z_sq values -= %scaled_origin_z values
execute if score %dist values matches 0 run scoreboard players operation %z_sq values *= %z_sq values
scoreboard players remove %dist values 1
execute if score %dist values matches 0.. positioned ^ ^ ^1 run function vsv:scripts/center/find_z_squared
