# Activates either vegvisir or fail depending on whether or not target exists in dimension

scoreboard players set %activate ptracker_delay 0

# Overworld
execute if entity @s[nbt={Dimension:"minecraft:overworld"}] at @s as @e[type=armor_stand,tag=trackerMarkerO] if score @s ptracker_id = @p ptracker_tracking run scoreboard players set %activate ptracker_delay 1
# Nether
execute if entity @s[nbt={Dimension:"minecraft:the_nether"}] at @s as @e[type=armor_stand,tag=trackerMarkerN] if score @s ptracker_id = @p ptracker_tracking run scoreboard players set %activate ptracker_delay 1
# End
execute if entity @s[nbt={Dimension:"minecraft:the_end"}] at @s as @e[type=armor_stand,tag=trackerMarkerE] if score @s ptracker_id = @p ptracker_tracking run scoreboard players set %activate ptracker_delay 1

execute if score %activate ptracker_delay matches 1 positioned ~-0.1 ~ ~0.1 run function ptracker:scripts/vegvisir
execute if score %activate ptracker_delay matches 0 positioned ~ ~ ~0.3 run function ptracker:scripts/fail