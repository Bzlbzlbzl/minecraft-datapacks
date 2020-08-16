#Teleports all players to their tpArrow (keeping rotation)
data modify entity @s Rotation set from entity @p Rotation
particle minecraft:witch ~ ~ ~ 0.4 0 0.4 1 100
particle minecraft:reverse_portal ~ ~1 ~ 0.3 0.7 0.3 0.4 50
tp @p @s
