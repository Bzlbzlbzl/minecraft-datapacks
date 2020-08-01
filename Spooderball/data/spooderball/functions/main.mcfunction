execute as @e[type=minecraft:snowball,nbt={Item:{tag:{spooder:1b}}}] at @s if block ~ ~ ~ water run kill @s

execute as @e[type=minecraft:snowball,nbt={Item:{tag:{spooder:1b}}}] at @s unless block ^0.8 ^ ^ air run fill ~ ~ ~ ~ ~ ~ cobweb replace air
execute as @e[type=minecraft:snowball,nbt={Item:{tag:{spooder:1b}}}] at @s unless block ^0.8 ^ ^ air run playsound minecraft:entity.spider.ambient master @a

execute as @e[type=minecraft:snowball,nbt={Item:{tag:{spooder:1b}}}] at @s unless block ^-0.8 ^ ^ air run fill ~ ~ ~ ~ ~ ~ cobweb replace air
execute as @e[type=minecraft:snowball,nbt={Item:{tag:{spooder:1b}}}] at @s unless block ^-0.8 ^ ^ air run playsound minecraft:entity.spider.ambient master @a

execute as @e[type=minecraft:snowball,nbt={Item:{tag:{spooder:1b}}}] at @s unless block ^ ^0.8 ^ air run fill ~ ~ ~ ~ ~ ~ cobweb replace air
execute as @e[type=minecraft:snowball,nbt={Item:{tag:{spooder:1b}}}] at @s unless block ^ ^0.8 ^ air run playsound minecraft:entity.spider.ambient master @a

execute as @e[type=minecraft:snowball,nbt={Item:{tag:{spooder:1b}}}] at @s unless block ^ ^-0.8 ^ air run fill ~ ~ ~ ~ ~ ~ cobweb replace air
execute as @e[type=minecraft:snowball,nbt={Item:{tag:{spooder:1b}}}] at @s unless block ^ ^-0.8 ^ air run playsound minecraft:entity.spider.ambient master @a

execute as @e[type=minecraft:snowball,nbt={Item:{tag:{spooder:1b}}}] at @s unless block ^ ^ ^0.8 air run fill ~ ~ ~ ~ ~ ~ cobweb replace air
execute as @e[type=minecraft:snowball,nbt={Item:{tag:{spooder:1b}}}] at @s unless block ^ ^ ^0.8 air run playsound minecraft:entity.spider.ambient master @a

execute as @e[type=minecraft:snowball,nbt={Item:{tag:{spooder:1b}}}] at @s unless block ^ ^ ^-0.8 air run fill ~ ~ ~ ~ ~ ~ cobweb replace air
execute as @e[type=minecraft:snowball,nbt={Item:{tag:{spooder:1b}}}] at @s unless block ^ ^ ^-0.8 air run playsound minecraft:entity.spider.ambient master @a
