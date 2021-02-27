#Force turn head recursively and plays particles in front until the executer has made a complete rotation circle
particle minecraft:mycelium ^ ^ ^8 0.05 0.05 0.05 0.5 5 normal @p
particle minecraft:mycelium ^ ^ ^-8 0.05 0.05 0.05 0.5 5 normal @p
particle minecraft:mycelium ^8 ^ ^ 0.05 0.05 0.05 0.5 5 normal @p
particle minecraft:mycelium ^-8 ^ ^ 0.05 0.05 0.05 0.5 5 normal @p
tp @s ~ ~ ~ ~3 ~
execute unless entity @s[y_rotation=90..92] at @s run function magnetism:scripts/circle