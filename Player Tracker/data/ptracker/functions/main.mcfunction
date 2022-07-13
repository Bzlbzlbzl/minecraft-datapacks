# # # Player Tracker - Bzlbzlbzl # # #

#Gives every player their own unique ptracker_id, makes sure ptracker_tracking is 0 or more
execute as @a unless score @s ptracker_id matches 0.. run function ptracker:scripts/update_id
execute as @a unless score @s ptracker_tracking matches 0.. run scoreboard players set @s ptracker_tracking 0

#Unforceloads chunks, kills marker, summons the new marker on all players, forceloads chunks; for all 3 dimensions
# Overworld
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:overworld"},tag=!ptIgnore] at @s as @e[type=minecraft:armor_stand,tag=trackerMarkerO] if score @s ptracker_id = @p ptracker_id at @s run forceload remove ~ ~ ~ ~
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:overworld"},tag=!ptIgnore] at @s as @e[type=minecraft:armor_stand,tag=trackerMarkerO] if score @s ptracker_id = @p ptracker_id run kill @s
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:overworld"},tag=!ptIgnore] at @s run summon armor_stand ~ -70 ~ {Tags:["trackerMarkerO"],Marker:1b,Invisible:1b,Silent:1b}
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:overworld"},tag=!ptIgnore] at @s positioned ~ -70 ~ run scoreboard players operation @e[type=minecraft:armor_stand,tag=trackerMarkerO,limit=1,sort=nearest] ptracker_id = @s ptracker_id
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:overworld"},tag=!ptIgnore] at @s as @e[type=minecraft:armor_stand,tag=trackerMarkerO] if score @s ptracker_id = @p ptracker_id at @s run forceload add ~ ~ ~ ~
# Nether
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:the_nether"},tag=!ptIgnore] at @s as @e[type=minecraft:armor_stand,tag=trackerMarkerN] if score @s ptracker_id = @p ptracker_id at @s run forceload remove ~ ~ ~ ~
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:the_nether"},tag=!ptIgnore] at @s as @e[type=minecraft:armor_stand,tag=trackerMarkerN] if score @s ptracker_id = @p ptracker_id run kill @s
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:the_nether"},tag=!ptIgnore] at @s run summon armor_stand ~ -70 ~ {Tags:["trackerMarkerN"],Marker:1b,Invisible:1b,Silent:1b}
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:the_nether"},tag=!ptIgnore] at @s positioned ~ -70 ~ run scoreboard players operation @e[type=minecraft:armor_stand,tag=trackerMarkerN,limit=1,sort=nearest] ptracker_id = @s ptracker_id
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:the_nether"},tag=!ptIgnore] at @s as @e[type=minecraft:armor_stand,tag=trackerMarkerN] if score @s ptracker_id = @p ptracker_id at @s run forceload add ~ ~ ~ ~
# End
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:the_end"},tag=!ptIgnore] at @s as @e[type=minecraft:armor_stand,tag=trackerMarkerE] if score @s ptracker_id = @p ptracker_id at @s run forceload remove ~ ~ ~ ~
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:the_end"},tag=!ptIgnore] at @s as @e[type=minecraft:armor_stand,tag=trackerMarkerE] if score @s ptracker_id = @p ptracker_id run kill @s
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:the_end"},tag=!ptIgnore] at @s run summon armor_stand ~ -70 ~ {Tags:["trackerMarkerE"],Marker:1b,Invisible:1b,Silent:1b}
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:the_end"},tag=!ptIgnore] at @s positioned ~ -70 ~ run scoreboard players operation @e[type=minecraft:armor_stand,tag=trackerMarkerE,limit=1,sort=nearest] ptracker_id = @s ptracker_id
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:the_end"},tag=!ptIgnore] at @s as @e[type=minecraft:armor_stand,tag=trackerMarkerE] if score @s ptracker_id = @p ptracker_id at @s run forceload add ~ ~ ~ ~

#Executes the track function on any player holding a ptracker compass, every 12 ticks
# Overworld
execute if score %delay ptracker_delay matches 0 as @a[nbt={SelectedItem:{id:"minecraft:compass",tag:{ptracker:1b}},Dimension:"minecraft:overworld"}] at @s run function ptracker:scripts/track_o
execute if score %delay ptracker_delay matches 6 as @a[nbt={Inventory:[{Slot:-106b, id:"minecraft:compass",tag:{ptracker:1b}}],Dimension:"minecraft:overworld"}] at @s run function ptracker:scripts/track_o
# Nether
execute if score %delay ptracker_delay matches 0 as @a[nbt={SelectedItem:{id:"minecraft:compass",tag:{ptracker:1b}},Dimension:"minecraft:the_nether"}] at @s run function ptracker:scripts/track_n
execute if score %delay ptracker_delay matches 6 as @a[nbt={Inventory:[{Slot:-106b, id:"minecraft:compass",tag:{ptracker:1b}}],Dimension:"minecraft:the_nether"}] at @s run function ptracker:scripts/track_n
# End
execute if score %delay ptracker_delay matches 0 as @a[nbt={SelectedItem:{id:"minecraft:compass",tag:{ptracker:1b}},Dimension:"minecraft:the_end"}] at @s run function ptracker:scripts/track_e
execute if score %delay ptracker_delay matches 6 as @a[nbt={Inventory:[{Slot:-106b, id:"minecraft:compass",tag:{ptracker:1b}}],Dimension:"minecraft:the_end"}] at @s run function ptracker:scripts/track_e

#Increments %delay's score by 1 every tick, and resets %delay's score to 0 at 12 ticks
scoreboard players add %delay ptracker_delay 1
execute if score %delay ptracker_delay matches 12 run scoreboard players set %delay ptracker_delay 0

#Gives compass to the players who used the trigger command and don't already have one
execute as @a[scores={compass=1..}] if data entity @s Inventory[{id:"minecraft:compass",tag:{ptracker:1b}}] run tellraw @s {"text":"Silly player, you already have one!","color":"red"}
execute as @a[scores={compass=1..}] unless data entity @s Inventory[{id:"minecraft:compass",tag:{ptracker:1b}}] run give @s minecraft:compass{LodestoneDimension:"minecraft:overworld",ptracker:1b}

#Resets and reenables compass score for all players who don't have a score of 0
execute as @a unless score @s compass matches 0 run scoreboard players enable @a compass
execute as @a unless score @s compass matches 0 run scoreboard players set @a compass 0