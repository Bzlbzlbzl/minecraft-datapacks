#Tags the correct crafting ingredients to magnetCraft
execute as @e[type=item,nbt={Item:{id:"minecraft:blaze_rod"}},nbt=!{Item:{tag:{magnet:1b}}},limit=1,sort=nearest] run tag @s add magnetCraft
execute as @e[type=item,nbt={Item:{id:"minecraft:blaze_rod"}},nbt=!{Item:{tag:{magnet:1b}}},limit=1,sort=nearest] at @s run execute as @e[type=item,nbt={Item:{id:"minecraft:compass"}},limit=1,sort=nearest,distance=0..1] run tag @s add magnetCraft
execute as @e[type=item,nbt={Item:{id:"minecraft:blaze_rod"}},nbt=!{Item:{tag:{magnet:1b}}},limit=1,sort=nearest] at @s run execute as @e[type=item,nbt={Item:{id:"minecraft:compass"}},limit=1,sort=nearest,distance=0..1] run execute as @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},limit=1,sort=nearest,distance=0..1] run tag @s add magnetCraft

#Removes all previous magnetCrafted tags and summons a new magnet with the tag (this allows only one magnet at a time to have magnetCrafted)
tag @e[tag=magnetCrafted,distance=0..1] remove magnetCrafted
summon item ~ ~ ~ {Item:{id:"minecraft:blaze_rod",Count:1b,tag:{display:{Name:'{"text":"Magnet","color":"red","italic":false}'},magnet:1b}},Tags:["magnetCrafted"]}

#Stores the item count in a scoreboard, removes one from it, then modifies the count to the scoreboard value
execute as @e[tag=magnetCraft] store result score @s magnet_craft run data get entity @s Item.Count
execute as @e[tag=magnetCraft] run scoreboard players remove @s magnet_craft 1
execute as @e[tag=magnetCraft] store result entity @s Item.Count byte 1 run scoreboard players get @s magnet_craft

#Removes the magnetCraft from the ingredients and runs function magnet:multicraft if can craft again
tag @e[tag=magnetCraft] remove magnetCraft
execute as @e[type=item,nbt={Item:{id:"minecraft:blaze_rod"}},nbt=!{Item:{tag:{magnet:1b}}}] at @s run execute as @e[type=item,nbt={Item:{id:"minecraft:compass"}},limit=1,sort=nearest,distance=0..1] run execute as @e[type=item,nbt={Item:{id:"minecraft:gold_ingot"}},limit=1,sort=nearest,distance=0..1] run function magnet:multicraft
