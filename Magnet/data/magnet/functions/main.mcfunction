# # # Item Magnet - By Bzlbzlbzl # # #

## Pulling To Magnet
#Adds the magnetic tag to anyone with a magnet in their main hand or offhand
execute as @a[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{magnet:1b}}}] run tag @s add magnetic
execute as @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:blaze_rod",tag:{magnet:1b}}]}] run tag @s add magnetic
execute as @e[nbt={HandItems:[{id:"minecraft:blaze_rod",tag:{magnet:1b}}]}] run tag @s add magnetic
execute as @e[type=item,nbt={Item:{id:"minecraft:blaze_rod",tag:{magnet:1b}}}] run tag @s add magnetic
execute as @e[type=minecraft:item_frame,nbt={Item:{id:"minecraft:blaze_rod",tag:{magnet:1b}}}] run tag @s add magnetic

#Tags all items within 8 blocks to be pulled
execute at @e[tag=magnetic] run tag @e[type=item,distance=..8,tag=!magnetic] add pulled

#Stores the position of all entities to be pulled in the scoreboard magnet_x magnet_y magnet_z
execute as @e[type=item,tag=pulled] store result score @s magnet_x run data get entity @s Pos[0] 100
execute as @e[type=item,tag=pulled] store result score @s magnet_y run data get entity @s Pos[1] 100
execute as @e[type=item,tag=pulled] store result score @s magnet_z run data get entity @s Pos[2] 100

#Stores the position of the nearest entity with the magnetic tag (relative to the tagged item) in the scoreboard magnet_dx magnet_dy magnet_dz
execute as @e[type=item,tag=pulled] at @s store result score @s magnet_dx run data get entity @e[tag=magnetic,limit=1,sort=nearest] Pos[0] 100
execute as @e[type=item,tag=pulled] at @s store result score @s magnet_dy run data get entity @e[tag=magnetic,limit=1,sort=nearest] Pos[1] 100
execute as @e[type=item,tag=pulled] at @s store result score @s magnet_dz run data get entity @e[tag=magnetic,limit=1,sort=nearest] Pos[2] 100

#Subtracts the entity's location by the item's location to find the direct x y z direction to move the items in
execute as @e[type=item,tag=pulled] run scoreboard players operation @s magnet_dx -= @s magnet_x
execute as @e[type=item,tag=pulled] run scoreboard players operation @s magnet_dy -= @s magnet_y
execute as @e[type=item,tag=pulled] run scoreboard players operation @s magnet_dz -= @s magnet_z

#Stores the scoreboard numbers as a motion in every entity to move it towards the designated player
execute as @e[type=item,tag=pulled] store result entity @s Motion[0] double 0.001 run scoreboard players get @s magnet_dx
execute as @e[type=item,tag=pulled] store result entity @s Motion[1] double 0.002 run scoreboard players get @s magnet_dy
execute as @e[type=item,tag=pulled] store result entity @s Motion[2] double 0.001 run scoreboard players get @s magnet_dz

#Removes all pulled item tags
tag @e[type=item,tag=pulled] remove pulled

## Repelling Other Magnets Items
#Tagging all magnet items within 8 blocks of a magnet entity to be repelled (Note: 0.2-8 because we don't want it to target itself)
execute as @e[type=item,nbt={Item:{id:"minecraft:blaze_rod",tag:{magnet:1b}}}] at @s if entity @e[tag=magnetic,distance=0.2..8] run tag @s add repelled

#Stores nearest magnet repelling coordinates (relative to the magnet item being repelled)
execute as @e[type=item,tag=repelled] at @s store result score @s magnet_x run data get entity @e[tag=magnetic,limit=1,sort=nearest,distance=0.2..8] Pos[0] 100
execute as @e[type=item,tag=repelled] at @s store result score @s magnet_y run data get entity @e[tag=magnetic,limit=1,sort=nearest,distance=0.2..8] Pos[1] 100
execute as @e[type=item,tag=repelled] at @s store result score @s magnet_z run data get entity @e[tag=magnetic,limit=1,sort=nearest,distance=0.2..8] Pos[2] 100

#Stores repelled magnet item's coordinates
execute as @e[type=item,tag=repelled] store result score @s magnet_dx run data get entity @s Pos[0] 100
execute as @e[type=item,tag=repelled] store result score @s magnet_dy run data get entity @s Pos[1] 100
execute as @e[type=item,tag=repelled] store result score @s magnet_dz run data get entity @s Pos[2] 100

#Subtracts the magnet repelling's location by the repelled magnet's location to find the direct x y z difference in coordinates
execute as @e[type=item,tag=repelled] run scoreboard players operation @s magnet_x -= @s magnet_dx
execute as @e[type=item,tag=repelled] run scoreboard players operation @s magnet_y -= @s magnet_dy
execute as @e[type=item,tag=repelled] run scoreboard players operation @s magnet_z -= @s magnet_dz

#Duplicating the x y z values so we have a copy of them for later (all store the dx dy dz, do not get confused)
execute as @e[type=item,tag=repelled] run scoreboard players operation @s magnet_dx = @s magnet_x
execute as @e[type=item,tag=repelled] run scoreboard players operation @s magnet_dy = @s magnet_y
execute as @e[type=item,tag=repelled] run scoreboard players operation @s magnet_dz = @s magnet_z

#Squaring each difference in coordinates, then adding them together for the distance squared, then re-scaling the distance back to normal
execute as @e[type=item,tag=repelled] run scoreboard players operation @s magnet_x *= @s magnet_x
execute as @e[type=item,tag=repelled] run scoreboard players operation @s magnet_y *= @s magnet_y
execute as @e[type=item,tag=repelled] run scoreboard players operation @s magnet_z *= @s magnet_z
execute as @e[type=item,tag=repelled] run scoreboard players operation @s magnet_sq_dist += @s magnet_x
execute as @e[type=item,tag=repelled] run scoreboard players operation @s magnet_sq_dist += @s magnet_y
execute as @e[type=item,tag=repelled] run scoreboard players operation @s magnet_sq_dist += @s magnet_z
# I'm just doing this so I dont have to make a new scoreboard for a 10000 number
execute as @e[type=item,tag=repelled] run scoreboard players set @s magnet_sq_inc 10000
execute as @e[type=item,tag=repelled] run scoreboard players operation @s magnet_sq_dist /= @s magnet_sq_inc
execute as @e[type=item,tag=repelled] run scoreboard players set @s magnet_sq_inc 1

#Running sqrt.mcfunction to have a recursion to find the correct square root of the distance squared
execute as @e[type=item,tag=repelled] if score @s magnet_sq_dist > @s magnet_sq_count run function magnet:sqrt

#Dividing each dx dy dz by magnet_distance to get the direction unit vector of the repelled magnet pos
execute as @e[type=item,tag=repelled] run scoreboard players operation @s magnet_dx /= @s magnet_distance
execute as @e[type=item,tag=repelled] run scoreboard players operation @s magnet_dy /= @s magnet_distance
execute as @e[type=item,tag=repelled] run scoreboard players operation @s magnet_dz /= @s magnet_distance

#Making each magnet_distance inverted, then multiplying it by the x y z directions to get the correct amount of power
execute as @e[type=item,tag=repelled] run scoreboard players remove @s magnet_distance 8
execute as @e[type=item,tag=repelled] run scoreboard players remove @s magnet_distance 8
execute as @e[type=item,tag=repelled] run scoreboard players remove @s magnet_distance 8
execute as @e[type=item,tag=repelled] run scoreboard players operation @s magnet_dx *= @s magnet_distance
execute as @e[type=item,tag=repelled] run scoreboard players operation @s magnet_dy *= @s magnet_distance
execute as @e[type=item,tag=repelled] run scoreboard players operation @s magnet_dz *= @s magnet_distance

#Applying the motion to the repelled magnet items
execute as @e[type=item,tag=repelled] store result entity @s Motion[0] double 0.00016 run scoreboard players get @s magnet_dx
execute as @e[type=item,tag=repelled] store result entity @s Motion[1] double 0.00003 run scoreboard players get @s magnet_dy
execute as @e[type=item,tag=repelled] store result entity @s Motion[2] double 0.00016 run scoreboard players get @s magnet_dz

#Resetting the scores involved in repelling
execute as @e[type=item,tag=repelled] run scoreboard players set @s magnet_sq_dist 0
execute as @e[type=item,tag=repelled] run scoreboard players set @s magnet_sq_count 0
execute as @e[type=item,tag=repelled] run scoreboard players set @s magnet_sq_inc 0
execute as @e[type=item,tag=repelled] run scoreboard players set @s magnet_distance 0

#Removes all magnetic entity tags, and all repelled tags
execute as @e[tag=magnetic] run tag @s remove magnetic
execute as @e[tag=repelled] run tag @s remove repelled