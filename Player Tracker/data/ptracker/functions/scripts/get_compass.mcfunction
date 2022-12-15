# Finds the correct name to give the compass, then gives the compass

forceload add 0 0 0 0

#Place shulker box and merge compass data
execute if data entity @s {Dimension:"minecraft:overworld"} run setblock 0 -64 0 minecraft:yellow_shulker_box
execute if data entity @s {Dimension:"minecraft:overworld"} run data merge block 0 -64 0 {Items:[{Count:1b,Slot:0b,id:"minecraft:compass",tag:{LodestoneDimension:"minecraft:overworld",display:{Lore:['[{"translate":"Drop","color":"light_purple"},{"translate":" the compass to","color":"gold"}]','{"translate":"rotate between targets. ","color":"gold"}'],Name:'[{"text":"No Target Available","color":"red","bold":true,"italic":false}]'},ptracker:1b}}]}
execute unless data entity @s {Dimension:"minecraft:overworld"} run setblock 0 0 0 minecraft:yellow_shulker_box
execute unless data entity @s {Dimension:"minecraft:overworld"} run data merge block 0 0 0 {Items:[{Count:1b,Slot:0b,id:"minecraft:compass",tag:{LodestoneDimension:"minecraft:overworld",display:{Lore:['[{"translate":"Drop","color":"light_purple"},{"translate":" the compass to","color":"gold"}]','{"translate":"rotate between targets. ","color":"gold"}'],Name:'[{"text":"No Target Available","color":"red","bold":true,"italic":false}]'},ptracker:1b}}]}

#Tag target with ptTarget
execute unless entity @e[tag=ptTarget] at @s as @e[type=armor_stand,tag=trackerMarkerO] if score @s ptracker_id = @p ptracker_tracking run tag @s add ptTarget
execute unless entity @e[tag=ptTarget] at @s as @e[type=armor_stand,tag=trackerMarkerN] if score @s ptracker_id = @p ptracker_tracking run tag @s add ptTarget
execute unless entity @e[tag=ptTarget] at @s as @e[type=armor_stand,tag=trackerMarkerE] if score @s ptracker_id = @p ptracker_tracking run tag @s add ptTarget

#Modify compass name from ptTarget, then remove tag
execute if data entity @s {Dimension:"minecraft:overworld"} run data modify block 0 -64 0 Items[{Slot: 0b}].tag.display.Name set from entity @e[tag=ptTarget,limit=1] CustomName
execute unless data entity @s {Dimension:"minecraft:overworld"} run data modify block 0 0 0 Items[{Slot: 0b}].tag.display.Name set from entity @e[tag=ptTarget,limit=1] CustomName
execute as @e[tag=ptTarget] run tag @s remove ptTarget

#Gives item to player
execute if data entity @s {Dimension:"minecraft:overworld"} if data entity @s SelectedItem run loot give @s mine 0 -64 0 minecraft:air{drop_contents:1b}
execute if data entity @s {Dimension:"minecraft:overworld"} unless data entity @s SelectedItem run loot replace entity @s weapon.mainhand mine 0 -64 0 minecraft:air{drop_contents:1b}
execute unless data entity @s {Dimension:"minecraft:overworld"} if data entity @s SelectedItem run loot give @s mine 0 0 0 minecraft:air{drop_contents:1b}
execute unless data entity @s {Dimension:"minecraft:overworld"} unless data entity @s SelectedItem run loot replace entity @s weapon.mainhand mine 0 0 0 minecraft:air{drop_contents:1b}

#Replace bedrock
execute if data entity @s {Dimension:"minecraft:overworld"} run setblock 0 -64 0 minecraft:bedrock
execute unless data entity @s {Dimension:"minecraft:overworld"} run setblock 0 0 0 minecraft:bedrock

forceload remove 0 0 0 0