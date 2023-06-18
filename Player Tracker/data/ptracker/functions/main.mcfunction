# # # Player Tracker - Bzlbzlbzl # # #

#Gives every player their own unique ptracker_id, makes sure ptracker_tracking is 0 or more
execute as @a unless score @s ptracker_id matches 1.. run function ptracker:scripts/update_id
execute as @a unless score @s ptracker_tracking matches 0.. run scoreboard players set @s ptracker_tracking 0

#Unforceloads chunks, kills marker, summons the new marker on all players, forceloads chunks; for all 3 dimensions
# Overworld
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:overworld"},tag=!ptIgnore] at @s as @e[type=minecraft:armor_stand,tag=trackerMarkerO] if score @s ptracker_id = @p ptracker_id at @s run forceload remove ~ ~ ~ ~
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:overworld"},tag=!ptIgnore] at @s as @e[type=minecraft:armor_stand,tag=trackerMarkerO] if score @s ptracker_id = @p ptracker_id run kill @s
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:overworld"},tag=!ptIgnore] at @s run summon armor_stand ~ -70 ~ {Tags:["trackerMarkerO"],Marker:1b,Invisible:1b,Silent:1b}
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:overworld"},tag=!ptIgnore] at @s positioned ~ -70 ~ run scoreboard players operation @e[type=minecraft:armor_stand,tag=trackerMarkerO,limit=1,sort=nearest] ptracker_id = @s ptracker_id
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:overworld"},tag=!ptIgnore] at @s as @e[type=minecraft:armor_stand,tag=trackerMarkerO] if score @s ptracker_id = @p ptracker_id at @s run forceload add ~ ~ ~ ~
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:overworld"},tag=!ptIgnore] at @s run function ptracker:scripts/set_name
# Nether
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:the_nether"},tag=!ptIgnore] at @s as @e[type=minecraft:armor_stand,tag=trackerMarkerN] if score @s ptracker_id = @p ptracker_id at @s run forceload remove ~ ~ ~ ~
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:the_nether"},tag=!ptIgnore] at @s as @e[type=minecraft:armor_stand,tag=trackerMarkerN] if score @s ptracker_id = @p ptracker_id run kill @s
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:the_nether"},tag=!ptIgnore] at @s run summon armor_stand ~ -6 ~ {Tags:["trackerMarkerN"],Marker:1b,Invisible:1b,Silent:1b}
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:the_nether"},tag=!ptIgnore] at @s positioned ~ -6 ~ run scoreboard players operation @e[type=minecraft:armor_stand,tag=trackerMarkerN,limit=1,sort=nearest] ptracker_id = @s ptracker_id
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:the_nether"},tag=!ptIgnore] at @s as @e[type=minecraft:armor_stand,tag=trackerMarkerN] if score @s ptracker_id = @p ptracker_id at @s run forceload add ~ ~ ~ ~
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:the_nether"},tag=!ptIgnore] at @s run function ptracker:scripts/set_name
# End
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:the_end"},tag=!ptIgnore] at @s as @e[type=minecraft:armor_stand,tag=trackerMarkerE] if score @s ptracker_id = @p ptracker_id at @s run forceload remove ~ ~ ~ ~
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:the_end"},tag=!ptIgnore] at @s as @e[type=minecraft:armor_stand,tag=trackerMarkerE] if score @s ptracker_id = @p ptracker_id run kill @s
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:the_end"},tag=!ptIgnore] at @s run summon armor_stand ~ -6 ~ {Tags:["trackerMarkerE"],Marker:1b,Invisible:1b,Silent:1b}
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:the_end"},tag=!ptIgnore] at @s positioned ~ -6 ~ run scoreboard players operation @e[type=minecraft:armor_stand,tag=trackerMarkerE,limit=1,sort=nearest] ptracker_id = @s ptracker_id
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:the_end"},tag=!ptIgnore] at @s as @e[type=minecraft:armor_stand,tag=trackerMarkerE] if score @s ptracker_id = @p ptracker_id at @s run forceload add ~ ~ ~ ~
execute if score %delay ptracker_delay matches 0 as @a[nbt={Dimension:"minecraft:the_end"},tag=!ptIgnore] at @s run function ptracker:scripts/set_name

#Executes the track function on any player holding a ptracker compass, every 12 ticks
# Overworld
execute if score %delay ptracker_delay matches 8 as @a[nbt={SelectedItem:{id:"minecraft:compass",tag:{ptracker:1b}},Dimension:"minecraft:overworld"}] if score @s ptracker_delay matches ..1 at @s run function ptracker:scripts/track_o
execute if score %delay ptracker_delay matches 8 as @a[nbt={Inventory:[{Slot:-106b, id:"minecraft:compass",tag:{ptracker:1b}}],Dimension:"minecraft:overworld"}] if score @s ptracker_delay matches ..1 at @s run function ptracker:scripts/track_o
execute if score %delay ptracker_delay matches 2 as @a[nbt={SelectedItem:{id:"minecraft:compass",tag:{ptracker:1b}},Dimension:"minecraft:overworld"}] if score @s ptracker_delay matches ..1 at @s run function ptracker:scripts/track_o
#execute if score %delay ptracker_delay matches 2 as @a[nbt={Inventory:[{Slot:-106b, id:"minecraft:compass",tag:{ptracker:1b}}],Dimension:"minecraft:overworld"}] if score @s ptracker_delay matches ..1 at @s run function ptracker:scripts/track_o
# Nether
execute if score %delay ptracker_delay matches 8 as @a[nbt={SelectedItem:{id:"minecraft:compass",tag:{ptracker:1b}},Dimension:"minecraft:the_nether"}] if score @s ptracker_delay matches ..1 at @s run function ptracker:scripts/track_n
execute if score %delay ptracker_delay matches 8 as @a[nbt={Inventory:[{Slot:-106b, id:"minecraft:compass",tag:{ptracker:1b}}],Dimension:"minecraft:the_nether"}] if score @s ptracker_delay matches ..1 at @s run function ptracker:scripts/track_n
execute if score %delay ptracker_delay matches 2 as @a[nbt={SelectedItem:{id:"minecraft:compass",tag:{ptracker:1b}},Dimension:"minecraft:the_nether"}] if score @s ptracker_delay matches ..1 at @s run function ptracker:scripts/track_n
#execute if score %delay ptracker_delay matches 2 as @a[nbt={Inventory:[{Slot:-106b, id:"minecraft:compass",tag:{ptracker:1b}}],Dimension:"minecraft:the_nether"}] if score @s ptracker_delay matches ..1 at @s run function ptracker:scripts/track_n
# End
execute if score %delay ptracker_delay matches 8 as @a[nbt={SelectedItem:{id:"minecraft:compass",tag:{ptracker:1b}},Dimension:"minecraft:the_end"}] if score @s ptracker_delay matches ..1 at @s run function ptracker:scripts/track_e
execute if score %delay ptracker_delay matches 8 as @a[nbt={Inventory:[{Slot:-106b, id:"minecraft:compass",tag:{ptracker:1b}}],Dimension:"minecraft:the_end"}] if score @s ptracker_delay matches ..1 at @s run function ptracker:scripts/track_e
execute if score %delay ptracker_delay matches 2 as @a[nbt={SelectedItem:{id:"minecraft:compass",tag:{ptracker:1b}},Dimension:"minecraft:the_end"}] if score @s ptracker_delay matches ..1 at @s run function ptracker:scripts/track_e
#execute if score %delay ptracker_delay matches 2 as @a[nbt={Inventory:[{Slot:-106b, id:"minecraft:compass",tag:{ptracker:1b}}],Dimension:"minecraft:the_end"}] if score @s ptracker_delay matches ..1 at @s run function ptracker:scripts/track_e

#Increments the ptracker_tracking score every time the player drops the compass OR if they try to get a new compass and currently have no available target
execute as @a[scores={compass=1..}] if score @s ptracker_tracking matches 0 unless data entity @s Inventory[{id:"minecraft:compass",tag:{ptracker:1b}}] run scoreboard players add @s ptracker_inc 1
execute as @a[scores={compass=1..}] if score @s ptracker_tracking matches 0 unless data entity @s Inventory[{id:"minecraft:compass",tag:{ptracker:1b}}] run scoreboard players set @s ptracker_tracking 1
execute as @a[scores={ptracker_inc=1..}] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:compass",tag:{ptracker:1b}}},distance=..5] run scoreboard players add @s ptracker_tracking 1
execute as @a[scores={ptracker_inc=1..}] if score @s ptracker_tracking = @s ptracker_id run scoreboard players add @s ptracker_tracking 1
execute as @a[scores={ptracker_inc=1..}] if score @s ptracker_tracking >= %next_id ptracker_id run scoreboard players set @s ptracker_tracking 1
execute as @a[scores={ptracker_inc=1..}] if score @s ptracker_tracking = @s ptracker_id run scoreboard players add @s ptracker_tracking 1
execute as @a[scores={ptracker_inc=1..}] if score @s ptracker_tracking >= %next_id ptracker_id run scoreboard players set @s ptracker_tracking 0
execute as @a[scores={ptracker_inc=1..}] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:compass",tag:{ptracker:1b}}},distance=..5] run function ptracker:scripts/get_compass
execute as @a[scores={ptracker_inc=1..}] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:compass",tag:{ptracker:1b}}},distance=..5] at @s run kill @e[type=item,limit=1,nbt={Item:{id:"minecraft:compass",tag:{ptracker:1b}}}]
execute as @a[scores={ptracker_inc=1..}] run scoreboard players set @s ptracker_inc 0

#Increments %delay's score by 1 every tick, and resets %delay's score to 0 at 12 ticks
scoreboard players add %delay ptracker_delay 1
execute if score %delay ptracker_delay matches 12 run scoreboard players set %delay ptracker_delay 0

#Gives compass to the players who used the trigger command and don't already have one
execute as @a[scores={compass=1..}] if data entity @s Inventory[{id:"minecraft:compass",tag:{ptracker:1b}}] at @s run function ptracker:scripts/clear_compass
execute as @a[scores={compass=1..}] unless data entity @s Inventory[{id:"minecraft:compass",tag:{ptracker:1b}}] at @s run function ptracker:scripts/get_compass

#Increments all players holding a compass down ptracker_delay to 0, but if not holding compass resets to 5, calls activate function at 1
execute as @a unless entity @s[nbt={SelectedItem:{id:"minecraft:compass",tag:{ptracker:1b}}}] unless entity @s[nbt={Inventory:[{Slot:-106b, id:"minecraft:compass",tag:{ptracker:1b}}]}] unless score @s ptracker_delay matches 5 run scoreboard players set @s ptracker_delay 5
execute as @a[nbt={SelectedItem:{id:"minecraft:compass",tag:{ptracker:1b}}}] if score @s ptracker_delay matches 1.. run scoreboard players remove @s ptracker_delay 1
execute as @a[nbt={Inventory:[{Slot:-106b, id:"minecraft:compass",tag:{ptracker:1b}}]}] if score @s ptracker_delay matches 1.. run scoreboard players remove @s ptracker_delay 1
execute as @a[scores={ptracker_delay=1}] at @s run function ptracker:scripts/activate

#Resets and reenables compass score for all players who don't have a score of 0
execute as @a unless score @s compass matches 0 run scoreboard players enable @a compass
execute as @a unless score @s compass matches 0 run scoreboard players set @a compass 0

#Forceload enforcement
execute as @e[type=minecraft:armor_stand,tag=trackerMarkerO] at @s run function ptracker:scripts/check_forceload
execute as @e[type=minecraft:armor_stand,tag=trackerMarkerN] at @s run function ptracker:scripts/check_forceload
execute as @e[type=minecraft:armor_stand,tag=trackerMarkerE] at @s run function ptracker:scripts/check_forceload
