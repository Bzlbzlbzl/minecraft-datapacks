#Recursively uses spreadplayers until found a spot far from player
scoreboard players set %spread_success psychosis 1

execute if dimension minecraft:the_nether run spreadplayers ~ ~ 0 50 under 119 false @e[tag=psyMarker]
execute unless dimension minecraft:the_nether run spreadplayers ~ ~ 0 50 false @e[tag=psyMarker]

execute if entity @e[tag=psyMarker,distance=..20] run scoreboard players set %spread_success psychosis 0
execute as @e[tag=psyMarker,limit=1] at @s if entity @e[type=player,gamemode=!spectator,distance=..8] run scoreboard players set %spread_success psychosis 0

scoreboard players add %crash_check psychosis 1
execute unless score %crash_check psychosis matches 10.. if score %spread_success psychosis matches 0 run function psychosis:scripts/spread_far
