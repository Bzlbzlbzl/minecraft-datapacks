# Calculations for chicken projectiles - Slime is the one with physics apploed to it

data modify entity @e[type=slime,limit=1,sort=nearest,tag=pEgg] NoAI set value 0b
execute at @s run summon area_effect_cloud ^ ^ ^0.2 {Tags:["pProj"]}

execute store result score @s p_pos run data get entity @s Pos[0] 10000
execute positioned ^ ^ ^0.2 store result score @s p_dpos run data get entity @e[type=area_effect_cloud,limit=1,sort=nearest,tag=pProj] Pos[0] 10000
scoreboard players operation @s p_dpos -= @s p_pos
execute store result entity @e[type=slime,limit=1,sort=nearest,tag=pEgg] Motion[0] double 0.0007 run scoreboard players get @s p_dpos

execute store result score @s p_pos run data get entity @s Pos[1] 10000
execute positioned ^ ^ ^0.2 store result score @s p_dpos run data get entity @e[type=area_effect_cloud,limit=1,sort=nearest,tag=pProj] Pos[1] 10000
scoreboard players operation @s p_dpos -= @s p_pos
execute store result entity @e[type=slime,limit=1,sort=nearest,tag=pEgg] Motion[1] double 0.0009 run scoreboard players get @s p_dpos

execute store result score @s p_pos run data get entity @s Pos[2] 10000
execute positioned ^ ^ ^0.2 store result score @s p_dpos run data get entity @e[type=area_effect_cloud,limit=1,sort=nearest,tag=pProj] Pos[2] 10000
scoreboard players operation @s p_dpos -= @s p_pos
execute store result entity @e[type=slime,limit=1,sort=nearest,tag=pEgg] Motion[2] double 0.0007 run scoreboard players get @s p_dpos