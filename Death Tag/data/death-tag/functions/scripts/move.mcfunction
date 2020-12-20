execute store result entity @s Pos[0] double 1 run scoreboard players get %pos_x death_tag
execute store result entity @s Pos[2] double 1 run scoreboard players get %pos_z death_tag
execute at @s run worldborder center ~ ~
worldborder set 128
execute at @s run setworldspawn ~ ~ ~
execute at @s run tp @a[tag=dtIt] ~52 ~ ~52
execute at @s run tp @a[tag=!dtIt] ~-40 ~ ~-40