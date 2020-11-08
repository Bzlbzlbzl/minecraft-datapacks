#Force turn head recursively and plays particles in front until the executer has made a complete rotation circle
particle minecraft:happy_villager ^ ^ ^0.8 0 0 0 0 2
tp @s ~ ~ ~ ~18 ~
execute unless entity @s[y_rotation=0..17] at @s run function p-prot:scripts/player_circle