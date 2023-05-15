#Transforms the position per tick by vsv_txyz. NOTE THE Y-Z SWAP
# x
execute store result score @s _transform run data get entity @s Pos[0] 100
scoreboard players operation @s _transform += @s vsv_tx
execute store result entity @s Pos[0] double 0.01 run scoreboard players get @s _transform

# y
execute store result score @s _transform run data get entity @s Pos[2] 100
scoreboard players operation @s _transform += @s vsv_ty
execute store result entity @s Pos[0] double 0.01 run scoreboard players get @s _transform

# z
execute store result score @s _transform run data get entity @s Pos[1] 100
scoreboard players operation @s _transform += @s vsv_tz
execute store result entity @s Pos[0] double 0.01 run scoreboard players get @s _transform
