#Recursively uses spreadplayers until found a spot far from player
execute if dimension minecraft:the_nether run spreadplayers ~ ~ 0 50 under 119 false @e[tag=psyMarker]
execute unless dimension minecraft:the_nether run spreadplayers ~ ~ 0 50 false @e[tag=psyMarker]
execute as @e[tag=psyMarker,distance=..20] run function psychosis:scripts/spread_far
