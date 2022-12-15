# Sets the name of the current armor stand to player compass name

forceload add 0 0 0 0

#Sets sign
execute if data entity @s {Dimension:"minecraft:overworld"} run setblock 0 -64 0 minecraft:oak_sign
execute unless data entity @s {Dimension:"minecraft:overworld"} run setblock 0 0 0 minecraft:oak_sign

#Tag ptTarget, then modify sign data
tag @s add ptTarget
execute if data entity @s {Dimension:"minecraft:overworld"} run data modify block 0 -64 0 Text1 set value '{ "text": "Now Tracking: ", "color": "red", "bold": true, "italic": false, "extra": [ { "selector": "@a[tag=ptTarget,limit=1]", "color": "aqua", "bold": false, "italic": true } ] }'
execute unless data entity @s {Dimension:"minecraft:overworld"} run data modify block 0 0 0 Text1 set value '{ "text": "Now Tracking: ", "color": "red", "bold": true, "italic": false, "extra": [ { "selector": "@a[tag=ptTarget,limit=1]", "color": "aqua", "bold": false, "italic": true } ] }'
tag @s remove ptTarget

#Modify name data from sign (NOT PERFECT DETECTION, but more efficient and close enough)
execute if data entity @s {Dimension:"minecraft:overworld"} positioned ~ -70 ~ run data modify entity @e[type=minecraft:armor_stand,limit=1,sort=nearest] CustomName set from block 0 -64 0 Text1
execute unless data entity @s {Dimension:"minecraft:overworld"} positioned ~ -6 ~ run data modify entity @e[type=minecraft:armor_stand,limit=1,sort=nearest] CustomName set from block 0 0 0 Text1

#Replace bedrock
execute if data entity @s {Dimension:"minecraft:overworld"} run setblock 0 -64 0 minecraft:bedrock
execute unless data entity @s {Dimension:"minecraft:overworld"} run setblock 0 0 0 minecraft:bedrock

forceload remove 0 0 0 0
