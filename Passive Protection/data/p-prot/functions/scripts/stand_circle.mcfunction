#Force turn head recursively and plays particles in front until the executer has made a complete rotation circle
particle minecraft:mycelium ^ ^-0.21 ^1.5 0 0 0 0 2
tp @s ~ ~ ~ ~6 ~
execute unless entity @s[y_rotation=0..5] at @s run function p-prot:scripts/stand_circle