# # # Item Magnet - By Bzlbzlbzl # # #

#Adds the pullTo tag to anyone with a magnet in their main hand or offhand
execute as @a[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{magnet:1b}}}] run tag @s add pullTo
execute as @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:blaze_rod",tag:{magnet:1b}}]}] run tag @s add pullTo
execute as @e[nbt={HandItems:[{id:"minecraft:blaze_rod", tag:{magnet:1b}}]}] run tag @s add pullTo
execute as @e[type=item,nbt={Item:{id:"minecraft:blaze_rod",tag:{magnet:1b}}}] run tag @s add pullTo
execute as @e[type=minecraft:item_frame,nbt={Item:{id:"minecraft:blaze_rod",tag:{magnet:1b}}}] run tag @s add pullTo

#Tags all items within 8 blocks to be pulled
execute at @e[tag=pullTo] run tag @e[type=item,distance=..8,tag=!pullTo] add pulled

#Stores the position of all entities to be pulled in the scoreboard x y z
execute as @e[type=item,tag=pulled] store result score @s x run data get entity @s Pos[0] 100
execute as @e[type=item,tag=pulled] store result score @s y run data get entity @s Pos[1] 100
execute as @e[type=item,tag=pulled] store result score @s z run data get entity @s Pos[2] 100

#Stores the position of the nearest entity with the pullTo tag (relative to the tagged item) in the scoreboard dx dy dz
execute as @e[type=item,tag=pulled] at @s store result score @s dx run data get entity @e[tag=pullTo,limit=1,sort=nearest] Pos[0] 100
execute as @e[type=item,tag=pulled] at @s store result score @s dy run data get entity @e[tag=pullTo,limit=1,sort=nearest] Pos[1] 100
execute as @e[type=item,tag=pulled] at @s store result score @s dz run data get entity @e[tag=pullTo,limit=1,sort=nearest] Pos[2] 100

#Subtracts the entity's location by the item's location to find the direct x y z direction to move the items in
execute as @e[type=item,tag=pulled] run scoreboard players operation @s dx -= @s x
execute as @e[type=item,tag=pulled] run scoreboard players operation @s dy -= @s y
execute as @e[type=item,tag=pulled] run scoreboard players operation @s dz -= @s z

#Stores the scoreboard numbers as a motion in every entity to move it towards the designated player
execute as @e[type=item,tag=pulled] store result entity @s Motion[0] double 0.001 run scoreboard players get @s dx
execute as @e[type=item,tag=pulled] store result entity @s Motion[1] double 0.002 run scoreboard players get @s dy
execute as @e[type=item,tag=pulled] store result entity @s Motion[2] double 0.001 run scoreboard players get @s dz

#Removes all pulled item tags before the tick ends
tag @e[type=item,tag=pulled] remove pulled

#Removes all pullTo entity tags before the tick ends
execute as @e[tag=pullTo] run tag @s remove pullTo