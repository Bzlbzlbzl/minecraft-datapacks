# # # Manhunt Datapack - Bzlbzlbzl # # #

#Summons the marker if it doesn't exist yet but should exist
execute as @a[tag=manhuntRunner,nbt={Dimension:"minecraft:overworld"},limit=1] at @s unless entity @e[tag=manhuntMarkerOW] run summon armor_stand ~ -5 ~ {Tags:["manhuntMarkerOW"],Marker:1b,Invisible:1b,Silent:1b}
execute as @a[tag=manhuntRunner,nbt={Dimension:"minecraft:the_nether"},limit=1] at @s unless entity @e[tag=manhuntMarkerN] run summon armor_stand ~ -5 ~ {Tags:["manhuntMarkerN"],Marker:1b,Invisible:1b,Silent:1b}

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

#Removes the manhuntRunner tag on all runners who died; resets manhunt_died score
execute as @a[scores={manhunt_died=1..},tag=manhuntRunner] run tag @s remove manhuntRunner
execute as @a[scores={manhunt_died=1..}] run scoreboard players reset @s manhunt_died

#Gives compass to the players who used the trigger command and don't already have one
execute as @a[scores={compass=1..}] if data entity @s Inventory[{id:"minecraft:compass"}] run tellraw @s {"text":"Silly hunter, you already have one!","color":"red"}
execute as @a[scores={compass=1..}] unless data entity @s Inventory[{id:"minecraft:compass"}] run give @s minecraft:compass

#Resets and reenables compass score for all players who don't have a score of 0
execute as @a unless score @s compass matches 0 run scoreboard players enable @a compass
execute as @a unless score @s compass matches 0 run scoreboard players set @a compass 0