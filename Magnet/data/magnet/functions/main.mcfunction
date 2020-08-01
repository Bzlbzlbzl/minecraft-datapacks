# # # Magnet - By Bzlbzlbzl
#
execute as @a[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{magnet:1b}}}] run tag @s add pullTo
execute as @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:blaze_rod",tag:{magnet:1b}}]}] run tag @s add pullTo

execute at @a[tag=pullTo] run tag @e[type=item,distance=..8] add pulled

execute as @e[type=item,tag=pulled] store result score @s x run data get entity @s Pos[0] 100
execute as @e[type=item,tag=pulled] store result score @s y run data get entity @s Pos[1] 100
execute as @e[type=item,tag=pulled] store result score @s z run data get entity @s Pos[2] 100

execute as @e[type=item,tag=pulled] at @s store result score @s dx run data get entity @p[tag=pullTo] Pos[0] 100
execute as @e[type=item,tag=pulled] at @s store result score @s dy run data get entity @p[tag=pullTo] Pos[1] 100
execute as @e[type=item,tag=pulled] at @s store result score @s dz run data get entity @p[tag=pullTo] Pos[2] 100

execute as @e[type=item,tag=pulled] run scoreboard players operation @s dx -= @s x
execute as @e[type=item,tag=pulled] run scoreboard players operation @s dy -= @s y
execute as @e[type=item,tag=pulled] run scoreboard players operation @s dz -= @s z

execute as @e[type=item,tag=pulled] store result entity @s Motion[0] double 0.001 run scoreboard players get @s dx
execute as @e[type=item,tag=pulled] store result entity @s Motion[1] double 0.002 run scoreboard players get @s dy
execute as @e[type=item,tag=pulled] store result entity @s Motion[2] double 0.001 run scoreboard players get @s dz

tag @e[type=item,tag=pulled] remove pulled

execute as @a[tag=pullTo] run tag @s remove pullTo