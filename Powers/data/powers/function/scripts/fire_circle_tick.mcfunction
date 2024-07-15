# Ticks for fire circle armor stand. Not meant to be run alone
particle minecraft:soul_fire_flame ^ ^ ^1 0 0 0 0 2
tp @s ~ ~ ~ ~18 0
execute unless entity @s[y_rotation=0..17] at @s run function powers:scripts/fire_circle_tick