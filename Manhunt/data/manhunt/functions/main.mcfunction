# # # Manhunt Datapack - Bzlbzlbzl # # #

#Executes track function on all players holding a compass and don't have the tag manhuntRunner, every 12 ticks
execute as @a[tag=!manhuntRunner,nbt={SelectedItem:{id:"minecraft:compass"}}] at @s if score %manhunt_delay manhunt_delay matches 0 facing entity @e[tag=manhuntRunner,limit=1] eyes positioned ^ ^0.8 ^1 rotated ~ 0 run function manhunt:track
execute as @a[tag=!manhuntRunner,nbt={Inventory:[{Slot:-106b, id:"minecraft:compass"}]}] at @s if score %manhunt_delay manhunt_delay matches 6 facing entity @e[tag=manhuntRunner,limit=1] eyes positioned ^ ^0.8 ^1 rotated ~ 0 run function manhunt:track

#Increments %manhunt_delay's score by 1 every tick, and resets %manhunt_delay's score to 0 at 12 ticks
scoreboard players add %manhunt_delay manhunt_delay 1
execute if score %manhunt_delay manhunt_delay matches 12 run scoreboard players set %manhunt_delay manhunt_delay 0