#Force turn head recursively and plays particles in front until the executer has made a complete rotation circle
particle minecraft:end_rod ^ ^ ^1 0 0 0 0 2
tp @s ~ ~ ~ ~20 ~
execute unless entity @s[y_rotation=0..19] at @s run function tp-bow:make_circle