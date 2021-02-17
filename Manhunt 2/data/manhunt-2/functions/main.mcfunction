# # # Manhunt Datapack - Bzlbzlbzl # # #

#Summons the marker if it doesn't exist yet but should exist
execute as @a[tag=manhuntRunner,nbt={Dimension:"minecraft:overworld"},limit=1] at @s unless entity @e[tag=manhuntMarkerOW] run summon armor_stand ~ ~ ~ {Tags:["manhuntMarkerOW"],Marker:1b,Invisible:1b,Silent:1b}
execute as @a[tag=manhuntRunner,nbt={Dimension:"minecraft:the_nether"},limit=1] at @s unless entity @e[tag=manhuntMarkerN] run summon armor_stand ~ ~ ~ {Tags:["manhuntMarkerN"],Marker:1b,Invisible:1b,Silent:1b}

#Executes track function on a player holding a compass and don't have the tag manhuntRunner, every 12 ticks. (LIMIT ONE)
execute as @a[tag=!manhuntRunner,nbt={SelectedItem:{id:"minecraft:compass"},Dimension:"minecraft:overworld"},limit=1] at @s if entity @e[tag=manhuntMarkerOW] if score %delay manhunt_delay matches 0 run function manhunt-2:scripts/track_ow
execute as @a[tag=!manhuntRunner,nbt={Inventory:[{Slot:-106b, id:"minecraft:compass"}],Dimension:"minecraft:overworld"},limit=1] at @s if entity @e[tag=manhuntMarkerOW] if score %delay manhunt_delay matches 6 run function manhunt-2:scripts/track_ow
execute as @a[tag=!manhuntRunner,nbt={SelectedItem:{id:"minecraft:compass"},Dimension:"minecraft:the_nether"},limit=1] at @s if entity @e[tag=manhuntMarkerN] if score %delay manhunt_delay matches 0 run function manhunt-2:scripts/track_n
execute as @a[tag=!manhuntRunner,nbt={Inventory:[{Slot:-106b, id:"minecraft:compass"}],Dimension:"minecraft:the_nether"},limit=1] at @s if entity @e[tag=manhuntMarkerN] if score %delay manhunt_delay matches 6 run function manhunt-2:scripts/track_n

#Executes point function on all players holding a compass and don't have the tag manhuntRunner, every 12 ticks
execute as @a[tag=!manhuntRunner,nbt={SelectedItem:{id:"minecraft:compass"},Dimension:"minecraft:overworld"}] at @s if entity @e[tag=manhuntMarkerOW] if score %delay manhunt_delay matches 0 facing entity @e[tag=manhuntMarkerOW,limit=1,sort=nearest] eyes positioned ~ ~0.8 ~ rotated ~ 0 run function manhunt-2:scripts/point
execute as @a[tag=!manhuntRunner,nbt={Inventory:[{Slot:-106b, id:"minecraft:compass"}],Dimension:"minecraft:overworld"}] at @s if entity @e[tag=manhuntMarkerOW] if score %delay manhunt_delay matches 6 facing entity @e[tag=manhuntMarkerOW,limit=1,sort=nearest] eyes positioned ~ ~0.8 ~ rotated ~ 0 run function manhunt-2:scripts/point
execute as @a[tag=!manhuntRunner,nbt={SelectedItem:{id:"minecraft:compass"},Dimension:"minecraft:the_nether"}] at @s if entity @e[tag=manhuntMarkerN] if score %delay manhunt_delay matches 0 facing entity @e[tag=manhuntMarkerN,limit=1,sort=nearest] eyes positioned ~ ~0.8 ~ rotated ~ 0 run function manhunt-2:scripts/point
execute as @a[tag=!manhuntRunner,nbt={Inventory:[{Slot:-106b, id:"minecraft:compass"}],Dimension:"minecraft:the_nether"}] at @s if entity @e[tag=manhuntMarkerN] if score %delay manhunt_delay matches 6 facing entity @e[tag=manhuntMarkerN,limit=1,sort=nearest] eyes positioned ~ ~0.8 ~ rotated ~ 0 run function manhunt-2:scripts/point

#Increments %delay's score by 1 every tick, and resets %delay's score to 0 at 12 ticks
scoreboard players add %delay manhunt_delay 1
execute if score %delay manhunt_delay matches 12 run scoreboard players set %delay manhunt_delay 0