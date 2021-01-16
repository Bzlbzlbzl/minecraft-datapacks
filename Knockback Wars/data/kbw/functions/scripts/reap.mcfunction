# Grim Reaper reap function
#If reap came from netherite hoe, will set attack to 1 (so I only need to check for attack in the same function)
execute if score @s reap matches 1.. run scoreboard players set @s attack 1

#Resets attack score if reap ability should end
execute unless block ^ ^ ^0.4 air run scoreboard players set @s attack 0
execute positioned ^ ^ ^0.4 if entity @s[distance=6..] run scoreboard players set @s attack 0

#Blindness
execute as @a[distance=..0.9] run effect give @s minecraft:blindness 1 0 true

#If attack score was reset, then perform the teleport
execute if score @s attack matches 0 at @s run particle minecraft:large_smoke ~ ~1.2 ~ 0.25 0.6 0.25 0 15 normal
execute if score @s attack matches 0 at @s run particle minecraft:smoke ~ ~0.8 ~ 0.25 0.6 0.25 0.05 90 normal
execute if score @s attack matches 0 run tp @s ~ ~ ~
execute if score @s attack matches 0 run particle minecraft:large_smoke ~ ~1.2 ~ 0.25 0.6 0.25 0 15 normal
execute if score @s attack matches 0 run particle minecraft:smoke ~ ~0.8 ~ 0.25 0.6 0.25 0.05 90 normal
execute if score @s attack matches 0 run playsound minecraft:entity.blaze.shoot master @a ~ ~ ~ 1 2
execute if score @s attack matches 0 run scoreboard players set @s calculation 20

#Unless attack score was reset, then keep running command
execute unless score @s attack matches 0 run particle minecraft:smoke ~ ~1 ~ 0.3 0.5 0.3 0 1 normal
execute unless score @s attack matches 0 if predicate kbw:reap_soul run particle minecraft:large_smoke ~ ~1 ~ 0.3 0.5 0.3 0 1 normal
execute unless score @s attack matches 0 if predicate kbw:reap_soul if score @s reap matches 1.. run particle minecraft:soul ~ ~1 ~ 0.3 0.5 0.3 0 1 normal
execute unless score @s attack matches 0 positioned ^ ^ ^0.4 run function kbw:scripts/reap