# Sets the name of the current armor stand to player compass name

execute in overworld run forceload add 0 0 0 0

#Sets sign
execute in overworld run setblock 0 -64 0 minecraft:oak_sign

#Tag ptTarget, then modify sign data, then move sign data to a storage (sign needs to apply the selector before putting in storage)
tag @s add ptTarget
execute in overworld run data modify block 0 -64 0 Text1 set value '{ "text": "Now Tracking: ", "color": "red", "bold": true, "italic": false, "extra": [ { "selector": "@a[tag=ptTarget,limit=1]", "color": "aqua", "bold": false, "italic": true } ] }'
execute in overworld run data modify storage minecraft:ptracker Text1 set from block 0 -64 0 Text1
tag @s remove ptTarget

#Modify name data from storage (NOT PERFECT DETECTION, but more efficient and honestly close enough)
execute if data entity @s {Dimension:"minecraft:overworld"} positioned ~ -70 ~ run data modify entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=trackerMarkerO] CustomName set from storage minecraft:ptracker Text1
execute if data entity @s {Dimension:"minecraft:the_nether"} positioned ~ -6 ~ run data modify entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=trackerMarkerN] CustomName set from storage minecraft:ptracker Text1
execute if data entity @s {Dimension:"minecraft:the_end"} positioned ~ -6 ~ run data modify entity @e[type=minecraft:armor_stand,limit=1,sort=nearest,tag=trackerMarkerE] CustomName set from storage minecraft:ptracker Text1

#Replace bedrock
execute in overworld run setblock 0 -64 0 minecraft:bedrock

execute in overworld run forceload remove 0 0 0 0
