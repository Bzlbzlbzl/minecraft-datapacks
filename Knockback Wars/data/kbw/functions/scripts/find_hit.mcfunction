#Finds the player who was hit, then tags them with hit
scoreboard players remove @s calculation 1
execute as @e[dx=0,tag=!me,nbt={HurtTime:10s},type=!minecraft:fireball,type=!minecraft:armor_stand,type=!minecraft:turtle] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] run tag @s add hit
#fallback 1: raycast missed
execute if score @s calculation matches 0 unless entity @e[tag=hit] positioned ^ ^ ^-1.2 run tag @e[distance=..5,limit=1,tag=!me,nbt={HurtTime:10s},sort=nearest,type=!minecraft:fireball,type=!minecraft:armor_stand,type=!minecraft:turtle] add hit
#fallback 2: hit block
execute unless block ^ ^ ^0.1 air unless entity @e[tag=hit] positioned ^ ^ ^-1.2 run tag @e[distance=..5,limit=1,tag=!me,nbt={HurtTime:10s},sort=nearest,type=!minecraft:fireball,type=!minecraft:armor_stand,type=!minecraft:turtle] add hit
#recursion
execute unless entity @e[tag=hit] unless score @s calculation matches 0 if block ^ ^ ^0.08 air positioned ^ ^ ^0.1 run function kbw:scripts/find_hit
