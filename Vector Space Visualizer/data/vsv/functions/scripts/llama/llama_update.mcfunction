# Updates the scoreboard values (run by toKill llama)
execute if data entity @s Items[{Slot:3b,tag:{vsv:1}}] store result score %1-1 values run data get entity @s Items[{Slot:3b}].tag.vsvNum
execute if data entity @s Items[{Slot:4b,tag:{vsv:1}}] store result score %1-2 values run data get entity @s Items[{Slot:4b}].tag.vsvNum
execute if data entity @s Items[{Slot:5b,tag:{vsv:1}}] store result score %1-3 values run data get entity @s Items[{Slot:5b}].tag.vsvNum
execute if data entity @s Items[{Slot:8b,tag:{vsv:1}}] store result score %2-1 values run data get entity @s Items[{Slot:8b}].tag.vsvNum
execute if data entity @s Items[{Slot:9b,tag:{vsv:1}}] store result score %2-2 values run data get entity @s Items[{Slot:9b}].tag.vsvNum
execute if data entity @s Items[{Slot:10b,tag:{vsv:1}}] store result score %2-3 values run data get entity @s Items[{Slot:10b}].tag.vsvNum
execute if data entity @s Items[{Slot:13b,tag:{vsv:1}}] store result score %3-1 values run data get entity @s Items[{Slot:13b}].tag.vsvNum
execute if data entity @s Items[{Slot:14b,tag:{vsv:1}}] store result score %3-2 values run data get entity @s Items[{Slot:14b}].tag.vsvNum
execute if data entity @s Items[{Slot:15b,tag:{vsv:1}}] store result score %3-3 values run data get entity @s Items[{Slot:15b}].tag.vsvNum
