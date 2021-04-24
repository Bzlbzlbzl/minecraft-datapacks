#Tags self as me, runs throw:scripts/find_mob function, tag self with pickUp if mob hit, teleports hit mob to head and removes AI, removes me and hit tags, sets self throw_use score to 5 (to prevent instant drop)
tag @s add me
execute as @s at @s anchored eyes positioned ^ ^ ^ run function throw:scripts/find_mob
execute if entity @e[tag=hit] run tag @s add pickUp
scoreboard players operation @e[tag=hit] throw_main = @s throw_main
data modify entity @e[tag=hit,limit=1,type=!minecraft:ender_dragon,type=!minecraft:wither] NoAI set value 1b
tp @e[tag=hit] ~ ~2 ~
tag @e remove hit
tag @s remove me