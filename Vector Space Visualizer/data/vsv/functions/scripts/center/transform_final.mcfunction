# Final iteration of transform (this is just to be precise)
execute store result entity @s Pos[0] double 0.001 run scoreboard players get @s vsv_fx
execute store result entity @s Pos[2] double 0.001 run scoreboard players get @s vsv_fy
execute store result entity @s Pos[1] double 0.001 run scoreboard players get @s vsv_fz

execute unless score %no_orient values matches 1 at @s run tp @s ~ ~ ~ facing entity @e[type=armor_stand,tag=vsvOrigin,limit=1] feet

function vsv:scripts/vector/calculate_values