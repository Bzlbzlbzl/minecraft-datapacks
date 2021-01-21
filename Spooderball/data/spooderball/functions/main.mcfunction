# # # Spooderball Datapack - By Bzlbzlbzl # # #
#Visual fix
execute as @e[type=minecraft:snowball,nbt={Item:{tag:{spooder:2b}}},tag=newSpooderball] run data modify entity @s Air set value 1s
execute as @e[type=minecraft:snowball,nbt={Item:{tag:{spooder:2b}}},tag=newSpooderball] run data modify entity @s Air set value 0s
execute as @e[type=minecraft:snowball,nbt={Item:{tag:{spooder:2b}}},tag=newSpooderball] run data modify entity @s Air set value 1s
execute as @e[type=minecraft:snowball,nbt={Item:{tag:{spooder:2b}}},tag=newSpooderball] run tag @s remove newSpooderball

#Snowball AOE cloud; data modify Motion; kill self
execute as @e[type=minecraft:snowball,nbt={Item:{tag:{spooder:1b}}}] at @s run summon snowball ~ ~ ~ {Passengers:[{id:"minecraft:area_effect_cloud",Duration:2147483647,Age:0,Tags:["spooderball"]}],Item:{id:"minecraft:cobweb",Count:1b,tag:{spooder:2b,Enchantments:[{}]}},Tags:["newSpooderball"]}
execute as @e[type=minecraft:snowball,nbt={Item:{tag:{spooder:1b}}}] at @s run data modify entity @e[type=minecraft:snowball,limit=1,sort=nearest,nbt={Item:{tag:{spooder:2b}}}] Motion set from entity @s Motion
execute as @e[type=minecraft:snowball,nbt={Item:{tag:{spooder:1b}}}] run kill @s

#AOE cloud sound; replace cobweb; kill self
execute as @e[tag=spooderball,type=minecraft:area_effect_cloud,predicate=!spooderball:riding_snowball] at @s if block ~ ~ ~ air run playsound minecraft:entity.spider.ambient master @a ~ ~ ~ 0.3 1
execute as @e[tag=spooderball,type=minecraft:area_effect_cloud,predicate=!spooderball:riding_snowball] at @s run fill ~ ~ ~ ~ ~ ~ cobweb replace air
execute as @e[tag=spooderball,type=minecraft:area_effect_cloud,predicate=!spooderball:riding_snowball] run kill @s