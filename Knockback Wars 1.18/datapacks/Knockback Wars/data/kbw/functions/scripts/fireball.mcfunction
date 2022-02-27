# Fireball mechanics

#Summons a temporary marker to get location of looking at, and a tagged Fireball
summon area_effect_cloud ^ ^ ^1 {Tags:["pyroFireball"]}
execute at @s positioned ~ ~2 ~ run summon minecraft:fireball ^ ^ ^ {Tags:["pyroFireball"],ExplosionPower:3}

#Coordinate X data storage
execute store result score @s pyroFlail run data get entity @s Pos[0] 1000
execute store result score @s calculation run data get entity @e[type=minecraft:area_effect_cloud,tag=pyroFireball,limit=1,sort=nearest] Pos[0] 1000
scoreboard players operation @s calculation -= @s pyroFlail
execute store result entity @e[type=minecraft:fireball,tag=pyroFireball,limit=1,sort=nearest] Motion[0] double 0.002 run scoreboard players get @s calculation

#Coordinate Y data storage
execute store result score @s pyroFlail run data get entity @s Pos[1] 1000
execute store result score @s calculation run data get entity @e[type=minecraft:area_effect_cloud,tag=pyroFireball,limit=1,sort=nearest] Pos[1] 1000
scoreboard players operation @s calculation -= @s pyroFlail
execute store result entity @e[type=minecraft:fireball,tag=pyroFireball,limit=1,sort=nearest] Motion[1] double 0.002 run scoreboard players get @s calculation

#Coordinate Z data storage
execute store result score @s pyroFlail run data get entity @s Pos[2] 1000
execute store result score @s calculation run data get entity @e[type=minecraft:area_effect_cloud,tag=pyroFireball,limit=1,sort=nearest] Pos[2] 1000
scoreboard players operation @s calculation -= @s pyroFlail
execute store result entity @e[type=minecraft:fireball,tag=pyroFireball,limit=1,sort=nearest] Motion[2] double 0.002 run scoreboard players get @s calculation

#Killing the temporary marker (in case another pyromaniac launched fireball at same tick); calculation to 20
kill @e[type=minecraft:area_effect_cloud,tag=pyroFireball,limit=1,sort=nearest]
scoreboard players set @s calculation 20