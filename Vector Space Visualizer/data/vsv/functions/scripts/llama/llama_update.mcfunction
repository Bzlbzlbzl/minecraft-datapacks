# Updates the scoreboard values (run by toKill llama)
#If crafted number or 0
execute if data entity @s Items[{Slot:3b,tag:{vsv:1}}] store result score %1-1 values run data get entity @s Items[{Slot:3b}].tag.vsvNum
execute if data entity @s Items[{Slot:4b,tag:{vsv:1}}] store result score %1-2 values run data get entity @s Items[{Slot:4b}].tag.vsvNum
execute if data entity @s Items[{Slot:5b,tag:{vsv:1}}] store result score %1-3 values run data get entity @s Items[{Slot:5b}].tag.vsvNum
execute if data entity @s Items[{Slot:8b,tag:{vsv:1}}] store result score %2-1 values run data get entity @s Items[{Slot:8b}].tag.vsvNum
execute if data entity @s Items[{Slot:9b,tag:{vsv:1}}] store result score %2-2 values run data get entity @s Items[{Slot:9b}].tag.vsvNum
execute if data entity @s Items[{Slot:10b,tag:{vsv:1}}] store result score %2-3 values run data get entity @s Items[{Slot:10b}].tag.vsvNum
execute if data entity @s Items[{Slot:13b,tag:{vsv:1}}] store result score %3-1 values run data get entity @s Items[{Slot:13b}].tag.vsvNum
execute if data entity @s Items[{Slot:14b,tag:{vsv:1}}] store result score %3-2 values run data get entity @s Items[{Slot:14b}].tag.vsvNum
execute if data entity @s Items[{Slot:15b,tag:{vsv:1}}] store result score %3-3 values run data get entity @s Items[{Slot:15b}].tag.vsvNum

#If other number
# 3
execute if data entity @s Items[{Slot:3b,tag:{vsv:2,vsvType:1}}] store result score %1-1 values run data get entity @s Items[{Slot:3b}].Count
execute if data entity @s Items[{Slot:3b,tag:{vsv:2,vsvType:1}}] run scoreboard players operation %1-1 values *= %1000 values 
execute if data entity @s Items[{Slot:3b,tag:{vsv:2,vsvType:2}}] store result score %divide values run data get entity @s Items[{Slot:3b}].Count
execute if data entity @s Items[{Slot:3b,tag:{vsv:2,vsvType:2}}] run scoreboard players operation %1-1 values = %1000 values
execute if data entity @s Items[{Slot:3b,tag:{vsv:2,vsvType:2}}] run scoreboard players operation %1-1 values /= %divide values
execute if data entity @s Items[{Slot:3b,tag:{vsv:2,vsvType:3}}] store result score %1-1 values run data get entity @s Items[{Slot:3b}].Count
execute if data entity @s Items[{Slot:3b,tag:{vsv:2,vsvType:3}}] run scoreboard players operation %1-1 values *= %1000 values
execute if data entity @s Items[{Slot:3b,tag:{vsv:2,vsvType:3}}] run scoreboard players operation %1-1 values *= %-1 values
execute if data entity @s Items[{Slot:3b,tag:{vsv:2,vsvType:4}}] store result score %divide values run data get entity @s Items[{Slot:3b}].Count
execute if data entity @s Items[{Slot:3b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %1-1 values = %1000 values
execute if data entity @s Items[{Slot:3b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %1-1 values /= %divide values
execute if data entity @s Items[{Slot:3b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %1-1 values *= %-1 values


# 4
execute if data entity @s Items[{Slot:4b,tag:{vsv:2,vsvType:1}}] store result score %1-2 values run data get entity @s Items[{Slot:4b}].Count
execute if data entity @s Items[{Slot:4b,tag:{vsv:2,vsvType:1}}] run scoreboard players operation %1-2 values *= %1000 values 
execute if data entity @s Items[{Slot:4b,tag:{vsv:2,vsvType:2}}] store result score %divide values run data get entity @s Items[{Slot:4b}].Count
execute if data entity @s Items[{Slot:4b,tag:{vsv:2,vsvType:2}}] run scoreboard players operation %1-2 values = %1000 values
execute if data entity @s Items[{Slot:4b,tag:{vsv:2,vsvType:2}}] run scoreboard players operation %1-2 values /= %divide values
execute if data entity @s Items[{Slot:4b,tag:{vsv:2,vsvType:3}}] store result score %1-2 values run data get entity @s Items[{Slot:4b}].Count
execute if data entity @s Items[{Slot:4b,tag:{vsv:2,vsvType:3}}] run scoreboard players operation %1-2 values *= %1000 values
execute if data entity @s Items[{Slot:4b,tag:{vsv:2,vsvType:3}}] run scoreboard players operation %1-2 values *= %-1 values
execute if data entity @s Items[{Slot:4b,tag:{vsv:2,vsvType:4}}] store result score %divide values run data get entity @s Items[{Slot:4b}].Count
execute if data entity @s Items[{Slot:4b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %1-2 values = %1000 values
execute if data entity @s Items[{Slot:4b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %1-2 values /= %divide values
execute if data entity @s Items[{Slot:4b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %1-2 values *= %-1 values


# 5
execute if data entity @s Items[{Slot:5b,tag:{vsv:2,vsvType:1}}] store result score %1-3 values run data get entity @s Items[{Slot:5b}].Count
execute if data entity @s Items[{Slot:5b,tag:{vsv:2,vsvType:1}}] run scoreboard players operation %1-3 values *= %1000 values 
execute if data entity @s Items[{Slot:5b,tag:{vsv:2,vsvType:2}}] store result score %divide values run data get entity @s Items[{Slot:5b}].Count
execute if data entity @s Items[{Slot:5b,tag:{vsv:2,vsvType:2}}] run scoreboard players operation %1-3 values = %1000 values
execute if data entity @s Items[{Slot:5b,tag:{vsv:2,vsvType:2}}] run scoreboard players operation %1-3 values /= %divide values
execute if data entity @s Items[{Slot:5b,tag:{vsv:2,vsvType:3}}] store result score %1-3 values run data get entity @s Items[{Slot:5b}].Count
execute if data entity @s Items[{Slot:5b,tag:{vsv:2,vsvType:3}}] run scoreboard players operation %1-3 values *= %1000 values
execute if data entity @s Items[{Slot:5b,tag:{vsv:2,vsvType:3}}] run scoreboard players operation %1-3 values *= %-1 values
execute if data entity @s Items[{Slot:5b,tag:{vsv:2,vsvType:4}}] store result score %divide values run data get entity @s Items[{Slot:5b}].Count
execute if data entity @s Items[{Slot:5b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %1-3 values = %1000 values
execute if data entity @s Items[{Slot:5b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %1-3 values /= %divide values
execute if data entity @s Items[{Slot:5b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %1-3 values *= %-1 values


# 8
execute if data entity @s Items[{Slot:8b,tag:{vsv:2,vsvType:1}}] store result score %2-1 values run data get entity @s Items[{Slot:8b}].Count
execute if data entity @s Items[{Slot:8b,tag:{vsv:2,vsvType:1}}] run scoreboard players operation %2-1 values *= %1000 values 
execute if data entity @s Items[{Slot:8b,tag:{vsv:2,vsvType:2}}] store result score %divide values run data get entity @s Items[{Slot:8b}].Count
execute if data entity @s Items[{Slot:8b,tag:{vsv:2,vsvType:2}}] run scoreboard players operation %2-1 values = %1000 values
execute if data entity @s Items[{Slot:8b,tag:{vsv:2,vsvType:2}}] run scoreboard players operation %2-1 values /= %divide values
execute if data entity @s Items[{Slot:8b,tag:{vsv:2,vsvType:3}}] store result score %2-1 values run data get entity @s Items[{Slot:8b}].Count
execute if data entity @s Items[{Slot:8b,tag:{vsv:2,vsvType:3}}] run scoreboard players operation %2-1 values *= %1000 values
execute if data entity @s Items[{Slot:8b,tag:{vsv:2,vsvType:3}}] run scoreboard players operation %2-1 values *= %-1 values
execute if data entity @s Items[{Slot:8b,tag:{vsv:2,vsvType:4}}] store result score %divide values run data get entity @s Items[{Slot:8b}].Count
execute if data entity @s Items[{Slot:8b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %2-1 values = %1000 values
execute if data entity @s Items[{Slot:8b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %2-1 values /= %divide values
execute if data entity @s Items[{Slot:8b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %2-1 values *= %-1 values


# 9
execute if data entity @s Items[{Slot:9b,tag:{vsv:2,vsvType:1}}] store result score %2-2 values run data get entity @s Items[{Slot:9b}].Count
execute if data entity @s Items[{Slot:9b,tag:{vsv:2,vsvType:1}}] run scoreboard players operation %2-2 values *= %1000 values 
execute if data entity @s Items[{Slot:9b,tag:{vsv:2,vsvType:2}}] store result score %divide values run data get entity @s Items[{Slot:9b}].Count
execute if data entity @s Items[{Slot:9b,tag:{vsv:2,vsvType:2}}] run scoreboard players operation %2-2 values = %1000 values
execute if data entity @s Items[{Slot:9b,tag:{vsv:2,vsvType:2}}] run scoreboard players operation %2-2 values /= %divide values
execute if data entity @s Items[{Slot:9b,tag:{vsv:2,vsvType:3}}] store result score %2-2 values run data get entity @s Items[{Slot:9b}].Count
execute if data entity @s Items[{Slot:9b,tag:{vsv:2,vsvType:3}}] run scoreboard players operation %2-2 values *= %1000 values
execute if data entity @s Items[{Slot:9b,tag:{vsv:2,vsvType:3}}] run scoreboard players operation %2-2 values *= %-1 values
execute if data entity @s Items[{Slot:9b,tag:{vsv:2,vsvType:4}}] store result score %divide values run data get entity @s Items[{Slot:9b}].Count
execute if data entity @s Items[{Slot:9b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %2-2 values = %1000 values
execute if data entity @s Items[{Slot:9b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %2-2 values /= %divide values
execute if data entity @s Items[{Slot:9b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %2-2 values *= %-1 values


# 10
execute if data entity @s Items[{Slot:10b,tag:{vsv:2,vsvType:1}}] store result score %2-3 values run data get entity @s Items[{Slot:10b}].Count
execute if data entity @s Items[{Slot:10b,tag:{vsv:2,vsvType:1}}] run scoreboard players operation %2-3 values *= %1000 values 
execute if data entity @s Items[{Slot:10b,tag:{vsv:2,vsvType:2}}] store result score %divide values run data get entity @s Items[{Slot:10b}].Count
execute if data entity @s Items[{Slot:10b,tag:{vsv:2,vsvType:2}}] run scoreboard players operation %2-3 values = %1000 values
execute if data entity @s Items[{Slot:10b,tag:{vsv:2,vsvType:2}}] run scoreboard players operation %2-3 values /= %divide values
execute if data entity @s Items[{Slot:10b,tag:{vsv:2,vsvType:3}}] store result score %2-3 values run data get entity @s Items[{Slot:10b}].Count
execute if data entity @s Items[{Slot:10b,tag:{vsv:2,vsvType:3}}] run scoreboard players operation %2-3 values *= %1000 values
execute if data entity @s Items[{Slot:10b,tag:{vsv:2,vsvType:3}}] run scoreboard players operation %2-3 values *= %-1 values
execute if data entity @s Items[{Slot:10b,tag:{vsv:2,vsvType:4}}] store result score %divide values run data get entity @s Items[{Slot:10b}].Count
execute if data entity @s Items[{Slot:10b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %2-3 values = %1000 values
execute if data entity @s Items[{Slot:10b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %2-3 values /= %divide values
execute if data entity @s Items[{Slot:10b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %2-3 values *= %-1 values


# 13
execute if data entity @s Items[{Slot:13b,tag:{vsv:2,vsvType:1}}] store result score %3-1 values run data get entity @s Items[{Slot:13b}].Count
execute if data entity @s Items[{Slot:13b,tag:{vsv:2,vsvType:1}}] run scoreboard players operation %3-1 values *= %1000 values 
execute if data entity @s Items[{Slot:13b,tag:{vsv:2,vsvType:2}}] store result score %divide values run data get entity @s Items[{Slot:13b}].Count
execute if data entity @s Items[{Slot:13b,tag:{vsv:2,vsvType:2}}] run scoreboard players operation %3-1 values = %1000 values
execute if data entity @s Items[{Slot:13b,tag:{vsv:2,vsvType:2}}] run scoreboard players operation %3-1 values /= %divide values
execute if data entity @s Items[{Slot:13b,tag:{vsv:2,vsvType:3}}] store result score %3-1 values run data get entity @s Items[{Slot:13b}].Count
execute if data entity @s Items[{Slot:13b,tag:{vsv:2,vsvType:3}}] run scoreboard players operation %3-1 values *= %1000 values
execute if data entity @s Items[{Slot:13b,tag:{vsv:2,vsvType:3}}] run scoreboard players operation %3-1 values *= %-1 values
execute if data entity @s Items[{Slot:13b,tag:{vsv:2,vsvType:4}}] store result score %divide values run data get entity @s Items[{Slot:13b}].Count
execute if data entity @s Items[{Slot:13b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %3-1 values = %1000 values
execute if data entity @s Items[{Slot:13b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %3-1 values /= %divide values
execute if data entity @s Items[{Slot:13b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %3-1 values *= %-1 values


# 14
execute if data entity @s Items[{Slot:14b,tag:{vsv:2,vsvType:1}}] store result score %3-2 values run data get entity @s Items[{Slot:14b}].Count
execute if data entity @s Items[{Slot:14b,tag:{vsv:2,vsvType:1}}] run scoreboard players operation %3-2 values *= %1000 values 
execute if data entity @s Items[{Slot:14b,tag:{vsv:2,vsvType:2}}] store result score %divide values run data get entity @s Items[{Slot:14b}].Count
execute if data entity @s Items[{Slot:14b,tag:{vsv:2,vsvType:2}}] run scoreboard players operation %3-2 values = %1000 values
execute if data entity @s Items[{Slot:14b,tag:{vsv:2,vsvType:2}}] run scoreboard players operation %3-2 values /= %divide values
execute if data entity @s Items[{Slot:14b,tag:{vsv:2,vsvType:3}}] store result score %3-2 values run data get entity @s Items[{Slot:14b}].Count
execute if data entity @s Items[{Slot:14b,tag:{vsv:2,vsvType:3}}] run scoreboard players operation %3-2 values *= %1000 values
execute if data entity @s Items[{Slot:14b,tag:{vsv:2,vsvType:3}}] run scoreboard players operation %3-2 values *= %-1 values
execute if data entity @s Items[{Slot:14b,tag:{vsv:2,vsvType:4}}] store result score %divide values run data get entity @s Items[{Slot:14b}].Count
execute if data entity @s Items[{Slot:14b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %3-2 values = %1000 values
execute if data entity @s Items[{Slot:14b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %3-2 values /= %divide values
execute if data entity @s Items[{Slot:14b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %3-2 values *= %-1 values


# 15
execute if data entity @s Items[{Slot:15b,tag:{vsv:2,vsvType:1}}] store result score %3-3 values run data get entity @s Items[{Slot:15b}].Count
execute if data entity @s Items[{Slot:15b,tag:{vsv:2,vsvType:1}}] run scoreboard players operation %3-3 values *= %1000 values 
execute if data entity @s Items[{Slot:15b,tag:{vsv:2,vsvType:2}}] store result score %divide values run data get entity @s Items[{Slot:15b}].Count
execute if data entity @s Items[{Slot:15b,tag:{vsv:2,vsvType:2}}] run scoreboard players operation %3-3 values = %1000 values
execute if data entity @s Items[{Slot:15b,tag:{vsv:2,vsvType:2}}] run scoreboard players operation %3-3 values /= %divide values
execute if data entity @s Items[{Slot:15b,tag:{vsv:2,vsvType:3}}] store result score %3-3 values run data get entity @s Items[{Slot:15b}].Count
execute if data entity @s Items[{Slot:15b,tag:{vsv:2,vsvType:3}}] run scoreboard players operation %3-3 values *= %1000 values
execute if data entity @s Items[{Slot:15b,tag:{vsv:2,vsvType:3}}] run scoreboard players operation %3-3 values *= %-1 values
execute if data entity @s Items[{Slot:15b,tag:{vsv:2,vsvType:4}}] store result score %divide values run data get entity @s Items[{Slot:15b}].Count
execute if data entity @s Items[{Slot:15b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %3-3 values = %1000 values
execute if data entity @s Items[{Slot:15b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %3-3 values /= %divide values
execute if data entity @s Items[{Slot:15b,tag:{vsv:2,vsvType:4}}] run scoreboard players operation %3-3 values *= %-1 values


#Updates Item (WIP)

#Stores the inventory into a storage
data modify storage vsv llama set from entity @s Items
