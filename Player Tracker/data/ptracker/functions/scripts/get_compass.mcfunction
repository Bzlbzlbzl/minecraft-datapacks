#Tags the desired player with me, sets a styled sign with the name of tagged player, creates a shulker box with a compass, modifies the data of the compass, then mines the shulker box to give to the player
forceload add 0 0 0 0
setblock 0 -64 0 minecraft:yellow_shulker_box
setblock 0 -63 0 minecraft:oak_sign
execute at @s as @a if score @s ptracker_id = @p ptracker_tracking run tag @s add me
data modify block 0 -63 0 Text1 set value '{"text":"Now Tracking: ","bold":true,"italic":false,"color":"red"},{"selector":"@a[tag=me,limit=1]","bold":false,"italic":true,"color":"aqua"}'
execute as @a[tag=me] run tag @s remove me
data merge block 0 -64 0 {Items:[{Count:1b,Slot:0b,id:"minecraft:compass",tag:{LodestoneDimension:"minecraft:overworld",display:{Lore:['{"translate":"Compass that generates particles to","color":"dark_red"}','{"text":"point towards the selected player. ","color":"dark_red"}','[{"text":"Drop","color":"light_purple"},{"text":" the compass to rotate between targets. ","color":"gold"}]'],Name:'[{"text":"Now Tracking: ","color":"red","bold":true,"italic":false},{"text":"Catxolotl","color":"aqua","bold":false,"italic":true}]'},ptracker:1b}}]}
data modify block 0 -64 0 Items[{Slot: 0b}].tag.display.Name set from block 0 -63 0 Text1
execute if data entity @s SelectedItem run loot give @s mine 0 -64 0 minecraft:air{drop_contents:1b}
execute unless data entity @s SelectedItem run loot replace entity @s weapon.mainhand mine 0 -64 0 minecraft:air{drop_contents:1b}
setblock 0 -63 0 minecraft:bedrock
setblock 0 -64 0 minecraft:bedrock
forceload remove 0 0 0 0
