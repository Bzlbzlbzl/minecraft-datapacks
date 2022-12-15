#Sets the name of the current armor stand to playername
forceload add 0 0 0 0
setblock 0 -63 0 minecraft:oak_sign
tag @s add me
data modify block 0 -63 0 Text1 set value '{"selector":"@a[tag=me,limit=1]"}'
tag @s remove me
execute positioned ~ -70 ~ run data modify entity @e[type=minecraft:armor_stand,limit=1,sort=nearest] CustomName set from block 0 -63 0 Text1
setblock 0 -63 0 minecraft:bedrock
forceload remove 0 0 0 0