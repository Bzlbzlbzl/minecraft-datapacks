# Grim Reaper reap function
#Tags self me and sets calculation to 50 (for the find_hit function)
tag @s[tag=!me] add me
scoreboard players set @s calculation 50

#Resets rend score if reap ability should end (if block or too far)
execute unless block ^ ^ ^0.4 air run scoreboard players set @s rend 0
execute positioned ^ ^ ^0.4 if entity @s[distance=6.5..] run scoreboard players set @s rend 0

#Blindness
execute as @a[distance=..0.9] run effect give @s minecraft:blindness 1 0 true

#If rend score was reset: apply effects; summon armorstand; then perform the teleport; calculation to 100; then tags noScythe and untags me and untags hit
execute if score @s rend matches 0 at @s rotated as @s anchored eyes run function kbw:scripts/find_hit
execute if score @s rend matches 0 at @s run effect give @e[tag=hit] minecraft:blindness 10 1 true
execute if score @s rend matches 0 at @s run effect give @e[tag=hit] minecraft:slowness 9 1 true
execute if score @s rend matches 0 at @s run effect give @e[tag=hit] minecraft:weakness 9 9 true
execute if score @s rend matches 0 run effect give @s minecraft:speed 5 9 true
execute if score @s rend matches 0 at @s run summon armor_stand ~0.4 61.1 ~0.7 {ShowArms:1b,Marker:1b,Invisible:1b,Tags:["reapScythe"],Pose:{RightArm:[100f,0f,0f]},HandItems:[{id:"minecraft:netherite_hoe",Count:1b,tag:{Enchantments:[{id:"minecraft:protection",lvl:0s}]}},{}]}
execute if score @s rend matches 0 at @s positioned ~0.4 61.1 ~0.7 run scoreboard players set @e[type=minecraft:armor_stand,tag=reapScythe,limit=1,sort=nearest] calculation 280
execute if score @s rend matches 0 at @s run particle minecraft:large_smoke ~ ~1.2 ~ 0.25 0.6 0.25 0 15 normal
execute if score @s rend matches 0 at @s run particle minecraft:soul ~ ~1 ~ 0.52 0.9 0.52 0.03 5 normal
execute if score @s rend matches 0 at @s run particle minecraft:smoke ~ ~0.8 ~ 0.25 0.6 0.25 0.05 90 normal
execute if score @s rend matches 0 at @s run playsound minecraft:entity.wither.hurt master @a ~ ~ ~ 1 0.75
execute if score @s rend matches 0 run tp @s ~ ~ ~
execute if score @s rend matches 0 run particle minecraft:large_smoke ~ ~1.2 ~ 0.25 0.6 0.25 0 3 normal
execute if score @s rend matches 0 run particle minecraft:soul ~ ~1 ~ 0.52 0.9 0.52 0.03 24 normal
execute if score @s rend matches 0 run particle minecraft:smoke ~ ~0.8 ~ 0.25 0.6 0.25 0.05 90 normal
execute if score @s rend matches 0 run scoreboard players set @s calculation 200
execute if score @s rend matches 0 run attribute @s minecraft:generic.knockback_resistance base set 10
execute if score @s rend matches 0 run tag @s add noScythe
execute if score @s rend matches 0 run tag @s remove me
execute if score @s rend matches 0 run tag @e[tag=hit] remove hit

#Unless rend score was reset, keep on running
execute unless score @s rend matches 0 if predicate kbw:reap_soul run particle minecraft:smoke ~ ~1 ~ 0.3 0.5 0.3 0 1 normal
execute unless score @s rend matches 0 if predicate kbw:reap_soul run particle minecraft:large_smoke ~ ~1 ~ 0.3 0.5 0.3 0 1 normal
execute unless score @s rend matches 0 if predicate kbw:reap_soul run particle minecraft:soul ~ ~1 ~ 0.3 0.5 0.3 0 1 normal
execute unless score @s rend matches 0 positioned ^ ^ ^0.4 run function kbw:scripts/rend