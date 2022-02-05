#Force turn head recursively and plays particles in front until the executer has made a complete rotation circle
particle minecraft:smoke ^ ^-0.21 ^0.8 0 0 0 0 1
tp @s ~ ~ ~ ~20 ~
execute unless entity @s[y_rotation=0..19] at @s run function double-jump:scripts/jump_circle