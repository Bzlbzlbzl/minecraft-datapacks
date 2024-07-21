# Ticks for fire circle armor stand. Not meant to be run alone
particle minecraft:dust{color:[1.0,1.0,1.0],scale:1} ^ ^ ^6 0 0 0 0 2
tp @s ~ ~ ~ ~4 0
execute unless entity @s[y_rotation=0..3] at @s run function powers:scripts/circle_tick