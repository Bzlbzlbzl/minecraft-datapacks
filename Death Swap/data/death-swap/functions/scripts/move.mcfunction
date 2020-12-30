execute store result entity @s Pos[0] double 1 run scoreboard players get %pos_x death_swap
execute store result entity @s Pos[2] double 1 run scoreboard players get %pos_z death_swap
execute at @s run setworldspawn ~ ~ ~
execute at @s run tp @a @s