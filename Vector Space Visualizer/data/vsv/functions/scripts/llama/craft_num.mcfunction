#Crafts the number and gives to player, returns error coal block if not possible

scoreboard players set %numerator values 0
scoreboard players set %denominator values 0

# 6
execute if data entity @s Items[{Slot:6b,tag:{vsv:1}}] store result score %numerator values run data get entity @s Items[{Slot:6b}].tag.vsvNum
execute if data entity @s Items[{Slot:6b,tag:{vsv:2,vsvType:1}}] store result score %numerator values run data get entity @s Items[{Slot:6b}].Count
execute if data entity @s Items[{Slot:6b,tag:{vsv:2,vsvType:1}}] run scoreboard players operation %numerator values *= %1000 values 
execute if data entity @s Items[{Slot:6b,tag:{vsv:2,vsvType:2}}] store result score %divide values run data get entity @s Items[{Slot:6b}].Count
execute if data entity @s Items[{Slot:6b,tag:{vsv:2,vsvType:2}}] run scoreboard players operation %numerator values = %1000 values
execute if data entity @s Items[{Slot:6b,tag:{vsv:2,vsvType:2}}] run scoreboard players operation %numerator values /= %divide values
execute if data entity @s Items[{Slot:6b,tag:{vsv:2,vsvType:3}}] store result score %numerator values run data get entity @s Items[{Slot:6b}].Count
execute if data entity @s Items[{Slot:6b,tag:{vsv:2,vsvType:3}}] run scoreboard players operation %numerator values *= %1000 values
execute if data entity @s Items[{Slot:6b,tag:{vsv:2,vsvType:3}}] run scoreboard players operation %numerator values *= %-1 values
execute if data entity @s Items[{Slot:6b,tag:{vsv:2,vsvType:4}}] store result score %divide values run data get entity @s Items[{Slot:6b}].Count
execute if data entity @s Items[{Slot:6b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %numerator values = %1000 values
execute if data entity @s Items[{Slot:6b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %numerator values /= %divide values
execute if data entity @s Items[{Slot:6b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %numerator values *= %-1 values

# 16
execute if data entity @s Items[{Slot:16b,tag:{vsv:1}}] store result score %denominator values run data get entity @s Items[{Slot:16b}].tag.vsvNum
execute if data entity @s Items[{Slot:16b,tag:{vsv:2,vsvType:1}}] store result score %denominator values run data get entity @s Items[{Slot:16b}].Count
execute if data entity @s Items[{Slot:16b,tag:{vsv:2,vsvType:1}}] run scoreboard players operation %denominator values *= %1000 values 
execute if data entity @s Items[{Slot:16b,tag:{vsv:2,vsvType:2}}] store result score %divide values run data get entity @s Items[{Slot:16b}].Count
execute if data entity @s Items[{Slot:16b,tag:{vsv:2,vsvType:2}}] run scoreboard players operation %denominator values = %1000 values
execute if data entity @s Items[{Slot:16b,tag:{vsv:2,vsvType:2}}] run scoreboard players operation %denominator values /= %divide values
execute if data entity @s Items[{Slot:16b,tag:{vsv:2,vsvType:3}}] store result score %denominator values run data get entity @s Items[{Slot:16b}].Count
execute if data entity @s Items[{Slot:16b,tag:{vsv:2,vsvType:3}}] run scoreboard players operation %denominator values *= %1000 values
execute if data entity @s Items[{Slot:16b,tag:{vsv:2,vsvType:3}}] run scoreboard players operation %denominator values *= %-1 values
execute if data entity @s Items[{Slot:16b,tag:{vsv:2,vsvType:4}}] store result score %divide values run data get entity @s Items[{Slot:16b}].Count
execute if data entity @s Items[{Slot:16b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %denominator values = %1000 values
execute if data entity @s Items[{Slot:16b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %denominator values /= %divide values
execute if data entity @s Items[{Slot:16b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %denominator values *= %-1 values


execute unless score %denominator values matches 0 run scoreboard players operation %crafted values = %numerator values
execute unless score %denominator values matches 0 run scoreboard players operation %crafted values *= %1000 values
execute unless score %denominator values matches 0 run scoreboard players operation %crafted values /= %denominator values

execute unless score %denominator values matches 0 run scoreboard players operation %crafted_num values = %crafted values
execute unless score %denominator values matches 0 if score %crafted values matches ..-1 run scoreboard players operation %crafted_num values *= %-1 values
execute unless score %denominator values matches 0 run scoreboard players operation %crafted_dec values = %crafted_num values
execute unless score %denominator values matches 0 run scoreboard players operation %crafted_num values /= %1000 values
execute unless score %denominator values matches 0 run scoreboard players operation %crafted_num values *= %1000 values
execute unless score %denominator values matches 0 run scoreboard players operation %crafted_dec values -= %crafted_num values
execute unless score %denominator values matches 0 run scoreboard players operation %crafted_num values /= %1000 values

execute in minecraft:overworld run forceload add 0 0 0 0

execute in minecraft:overworld run setblock 0 -63 0 minecraft:oak_sign
execute in minecraft:overworld run setblock 0 -64 0 minecraft:yellow_shulker_box

execute unless score %denominator values matches 0 run data merge block 0 -64 0 {Items:[{Slot:0b, id:"minecraft:white_wool",Count:64b,tag:{display:{Name:'{"text":"CRAFTED WOOL","color":"white","bold":true,"italic":false}'},HideFlags:127,vsv:1,vsvNum:0,Enchantments:[{}]}}]}
execute unless score %denominator values matches 0 store result block 0 -64 0 Items[{Slot:0b}].tag.vsvNum int 1 run scoreboard players get %crafted values

execute unless score %denominator values matches 0 if score %crafted values matches ..-1 run data merge block 0 -63 0 {Text2:'{"text":"-","color":"white","bold":true,"italic":false}'}

execute unless score %denominator values matches 0 if score %crafted_dec values matches 0..9 run data merge block 0 -63 0 {Text3:'{"text":"00","color":"white","bold":true,"italic":false}'}
execute unless score %denominator values matches 0 if score %crafted_dec values matches 10..99 run data merge block 0 -63 0 {Text3:'{"text":"0","color":"white","bold":true,"italic":false}'}

execute unless score %denominator values matches 0 run data merge block 0 -63 0 {Text1:'[{"nbt":"Text2","block":"0 -63 0","interpret":true,"color":"white","bold":true,"italic":false},{"score":{"name":"%crafted_num","objective":"values"},"color":"white","bold":true,"italic":false},{"text":".","color":"white","bold":true,"italic":false},{"nbt":"Text3","block":"0 -63 0","interpret":true,"color":"white","bold":true,"italic":false},{"score":{"name":"%crafted_dec","objective":"values"},"color":"white","bold":true,"italic":false}]'}
execute unless score %denominator values matches 0 run data modify block 0 -64 0 Items[{Slot:0b}].tag.display.Name set from block 0 -63 0 Text1

execute at @s in overworld run loot give @p mine 0 -64 0 minecraft:air{drop_contents:1b}

execute in minecraft:overworld run setblock 0 -63 0 minecraft:bedrock
execute in minecraft:overworld run setblock 0 -64 0 minecraft:bedrock

execute in minecraft:overworld run forceload remove 0 0 0 0

data merge entity @s {Items:[{Slot:6b, id:"minecraft:air",Count:0b,}]}
data merge entity @s {Items:[{Slot:16b, id:"minecraft:air",Count:0b,}]}
