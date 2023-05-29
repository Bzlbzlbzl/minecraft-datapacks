#Transforms the position per tick by vsv_txyz. NOTE THE Y-Z SWAP
# x
execute store result score @s _transform run data get entity @s Pos[0] 1000
scoreboard players operation @s _transform += @s vsv_tx
execute store result entity @s Pos[0] double 0.001 run scoreboard players get @s _transform

# y
execute store result score @s _transform run data get entity @s Pos[2] 1000
scoreboard players operation @s _transform += @s vsv_ty
execute store result entity @s Pos[2] double 0.001 run scoreboard players get @s _transform

# z
execute store result score @s _transform run data get entity @s Pos[1] 1000
scoreboard players operation @s _transform += @s vsv_tz
execute store result entity @s Pos[1] double 0.001 run scoreboard players get @s _transform

execute unless score %no_orient values matches 1 at @s run tp @s ~ ~ ~ facing entity @e[type=armor_stand,tag=vsvOrigin,limit=1] feet
