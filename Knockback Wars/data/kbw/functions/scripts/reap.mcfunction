# Grim Reaper reap function
#Resets reap score if reap ability should end
execute unless block ^ ^ ^0.4 air run scoreboard players set @s reap 0
execute positioned ^ ^ ^0.4 if entity @s[distance=6..] run scoreboard players set @s reap 0

#Blindness
execute as @a[distance=..0.9] run effect give @s minecraft:blindness 1 0 true

#If reap score was reset, then perform the teleport
execute if score @s reap matches 0 at @s run particle minecraft:large_smoke ~ ~1.2 ~ 0.25 0.6 0.25 0 15 normal
execute if score @s reap matches 0 at @s run particle minecraft:smoke ~ ~0.8 ~ 0.25 0.6 0.25 0.05 90 normal
execute if score @s reap matches 0 run tp @s ~ ~ ~
execute if score @s reap matches 0 run particle minecraft:large_smoke ~ ~1.2 ~ 0.25 0.6 0.25 0 3 normal
execute if score @s reap matches 0 run particle minecraft:soul ~ ~1 ~ 0.52 0.9 0.52 0.03 18 normal
execute if score @s reap matches 0 run particle minecraft:smoke ~ ~0.8 ~ 0.25 0.6 0.25 0.05 90 normal
execute if score @s reap matches 0 run playsound minecraft:entity.wither.hurt master @a ~ ~ ~ 0.7 0.75
execute if score @s reap matches 0 run scoreboard players set @s calculation 20

#If reap score was reset, then do not run again; else run again
execute unless score @s reap matches 0 if predicate kbw:point5 run particle minecraft:soul ~ ~1 ~ 0.3 0.5 0.3 0 1 normal
execute unless score @s reap matches 0 positioned ^ ^ ^0.4 run function kbw:scripts/reap