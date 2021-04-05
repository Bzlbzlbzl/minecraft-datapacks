execute store result entity @s Pos[0] double 1 run scoreboard players get %pos_x death_tag
execute store result entity @s Pos[2] double 1 run scoreboard players get %pos_z death_tag
execute at @s run worldborder center ~ ~
worldborder set 1024
spreadplayers ~ ~ 0 1 false @s
execute at @s run setworldspawn ~ ~ ~
execute at @s run tp @a ~ ~ ~