#Crafts the number and gives to player, returns error coal block if not possible

scoreboard players set %numerator values 0
scoreboard players set %denominator values 0

# 6
execute if data entity @s Items[{Slot:6b,tag:{vsv:1}}] store result score %numerator values run data get entity @s Items[{Slot:6b}].tag.vsvNum
execute if data entity @s Items[{Slot:6b,tag:{vsv:2,vsvType:1}}] store result score %numerator values run data get entity @s Items[{Slot:6b}].Count
execute if data entity @s Items[{Slot:6b,tag:{vsv:2,vsvType:1}}] run scoreboard players operation %numerator values *= %100 values 
execute if data entity @s Items[{Slot:6b,tag:{vsv:2,vsvType:2}}] store result score %divide values run data get entity @s Items[{Slot:6b}].Count
execute if data entity @s Items[{Slot:6b,tag:{vsv:2,vsvType:2}}] run scoreboard players operation %numerator values = %100 values
execute if data entity @s Items[{Slot:6b,tag:{vsv:2,vsvType:2}}] run scoreboard players operation %numerator values /= %divide values
execute if data entity @s Items[{Slot:6b,tag:{vsv:2,vsvType:3}}] store result score %numerator values run data get entity @s Items[{Slot:6b}].Count
execute if data entity @s Items[{Slot:6b,tag:{vsv:2,vsvType:3}}] run scoreboard players operation %numerator values *= %100 values
execute if data entity @s Items[{Slot:6b,tag:{vsv:2,vsvType:3}}] run scoreboard players operation %numerator values *= %-1 values
execute if data entity @s Items[{Slot:6b,tag:{vsv:2,vsvType:4}}] store result score %divide values run data get entity @s Items[{Slot:6b}].Count
execute if data entity @s Items[{Slot:6b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %numerator values = %100 values
execute if data entity @s Items[{Slot:6b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %numerator values /= %divide values
execute if data entity @s Items[{Slot:6b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %numerator values *= %-1 values

# 16
execute if data entity @s Items[{Slot:16b,tag:{vsv:1}}] store result score %denominator values run data get entity @s Items[{Slot:16b}].tag.vsvNum
execute if data entity @s Items[{Slot:16b,tag:{vsv:2,vsvType:1}}] store result score %denominator values run data get entity @s Items[{Slot:16b}].Count
execute if data entity @s Items[{Slot:16b,tag:{vsv:2,vsvType:1}}] run scoreboard players operation %denominator values *= %100 values 
execute if data entity @s Items[{Slot:16b,tag:{vsv:2,vsvType:2}}] store result score %divide values run data get entity @s Items[{Slot:16b}].Count
execute if data entity @s Items[{Slot:16b,tag:{vsv:2,vsvType:2}}] run scoreboard players operation %denominator values = %100 values
execute if data entity @s Items[{Slot:16b,tag:{vsv:2,vsvType:2}}] run scoreboard players operation %denominator values /= %divide values
execute if data entity @s Items[{Slot:16b,tag:{vsv:2,vsvType:3}}] store result score %denominator values run data get entity @s Items[{Slot:16b}].Count
execute if data entity @s Items[{Slot:16b,tag:{vsv:2,vsvType:3}}] run scoreboard players operation %denominator values *= %100 values
execute if data entity @s Items[{Slot:16b,tag:{vsv:2,vsvType:3}}] run scoreboard players operation %denominator values *= %-1 values
execute if data entity @s Items[{Slot:16b,tag:{vsv:2,vsvType:4}}] store result score %divide values run data get entity @s Items[{Slot:16b}].Count
execute if data entity @s Items[{Slot:16b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %denominator values = %100 values
execute if data entity @s Items[{Slot:16b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %denominator values /= %divide values
execute if data entity @s Items[{Slot:16b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %denominator values *= %-1 values


execute unless score %denominator values matches 0 run scoreboard players operation %crafted values = %numerator values
execute unless score %denominator values matches 0 run scoreboard players operation %crafted values *= %100 values
execute unless score %denominator values matches 0 run scoreboard players operation %crafted values /= %denominator values

execute unless score %denominator values matches 0 run data merge entity @s {Items:[{Slot:6b, id:"minecraft:white_wool",Count:64b,tag:{display:{Name:'{"text":"CRAFTED WOOL","color":"white","bold":true,"italic":false}'},HideFlags:127,vsv:1,vsvNum:0,Enchantments:[{}]}}]}
execute unless score %denominator values matches 0 store result entity @s Items[{Slot:6b}].tag.vsvNum int 1 run scoreboard players get %crafted values

data merge entity @s {Items:[{Slot:16b, id:"minecraft:air",Count:0b,}]}
