#Summons the special tp bow
summon item ~ ~ ~ {Item:{id:"minecraft:bow",Count:1b,tag:{display:{Name:'{"text":"TP Bow","color":"dark_purple","italic":false}'},tp-bow:1b}},Tags:["tpCrafted"]}

#Kills the nearest ingredient items
execute as @e[type=item,tag=tpCrafted] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:bow",tag:{Damage:0}}},nbt=!{Item:{tag:{tp-bow:1b}}},limit=1,sort=nearest] 
execute as @e[type=item,tag=tpCrafted] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:chorus_flower",Count:1b}},limit=1,sort=nearest] 
execute as @e[type=item,tag=tpCrafted] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:end_crystal",Count:1b}},limit=1,sort=nearest]

#Plays sound effects and makes particles
execute as @e[type=item,tag=tpCrafted] at @s run playsound minecraft:entity.enderman.scream master @a ~ ~ ~ 1
execute as @e[type=item,tag=tpCrafted] at @s run playsound minecraft:entity.enderman.stare master @a ~ ~ ~ 1
execute as @e[type=item,tag=tpCrafted] at @s run playsound minecraft:block.anvil.use master @a ~ ~ ~ 0.7
execute as @e[type=item,tag=tpCrafted] at @s run particle minecraft:portal ~ ~ ~ 0.1 0.1 0.1 1.5 15
execute as @e[type=item,tag=tpCrafted] at @s run function tp-bow:circle
execute as @e[type=item,tag=tpCrafted] at @s run particle minecraft:witch ~ ~ ~ 0 0 0 1 8
execute as @e[type=item,tag=tpCrafted] at @s run particle minecraft:portal ~ ~ ~ 0.1 0.1 0.1 0.7 15