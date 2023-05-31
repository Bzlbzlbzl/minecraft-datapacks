#Recursively uses spreadplayers until found a spot far from player
execute if dimension minecraft:the_nether run spreadplayers ~ ~ 0 40 under 199 false @e[tag=psySpawned]
execute unless dimension minecraft:the_nether run spreadplayers ~ ~ 0 40 false @e[tag=psySpawned]
execute as @e[tag=psySpawned,distance=..16] run function psychosis:scripts/spread_far
