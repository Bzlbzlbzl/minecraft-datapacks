# # # Explosive Drop - Bzlbzlbzl # # #
# use </trigger explosive_drop> to toggle on and off. Using /trigger explosive_drop set 0 will disable you from toggling explosive_drop
#Enables the explosive_drop trigger for anyone who accidentally sets their score to negative
execute as @a if score @s explosive_drop matches ..-1 run scoreboard players enable @s explosive_drop
execute as @a if score @s explosive_drop matches ..-1 run scoreboard players set @s explosive_drop 0

#Changes %explosive (to 1 or 0 depending on %explosive currently) when a player triggers the explosive_drop scoreboard
execute as @a[scores={explosive_drop=1..},limit=1] if score %explosive explosive_drop matches 0 run tellraw @a ["",{"selector":"@s","bold":true,"color":"green"},{"text":" enabled explosive drops!","bold":true,"color":"green"}]
execute as @a[scores={explosive_drop=1..},limit=1] if score %explosive explosive_drop matches 1 run tellraw @a ["",{"selector":"@s","bold":true,"color":"red"},{"text":" disabled explosive drops!","bold":true,"color":"red"}]
execute as @a[scores={explosive_drop=1..},limit=1] run scoreboard players add %explosive explosive_drop 1
execute as @a[scores={explosive_drop=1..},limit=1] if score %explosive explosive_drop matches 2.. run scoreboard players set %explosive explosive_drop 0
execute as @a[scores={explosive_drop=1..},limit=1] run scoreboard players enable * explosive_drop
execute as @a[scores={explosive_drop=1..},limit=1] run scoreboard players set @a explosive_drop 0

#Dropped item displays (hardcoded cuz it might be even more inefficient to do it based on data, especially when im only hardcoding 3 seconds)
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:0s}] if data entity @s Thrower run data modify entity @s CustomNameVisible set value 1b
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:0s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"3.0","color":"red","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:2s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"2.9","color":"red","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:4s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"2.8","color":"red","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:6s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"2.7","color":"white","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:8s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"2.6","color":"white","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:10s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"2.5","color":"white","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:12s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"2.4","color":"red","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:14s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"2.3","color":"red","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:16s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"2.2","color":"red","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:18s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"2.1","color":"white","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:20s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"2.0","color":"white","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:22s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"1.9","color":"white","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:24s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"1.8","color":"red","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:26s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"1.7","color":"red","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:28s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"1.6","color":"red","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:30s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"1.5","color":"white","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:32s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"1.4","color":"white","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:34s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"1.3","color":"white","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:36s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"1.2","color":"red","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:38s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"1.1","color":"red","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:40s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"1.0","color":"red","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:42s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"0.9","color":"white","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:44s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"0.8","color":"white","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:46s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"0.7","color":"white","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:48s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"0.6","color":"red","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:50s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"0.5","color":"red","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:52s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"0.4","color":"red","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:54s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"0.3","color":"white","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:56s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"0.2","color":"white","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:58s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"0.1","color":"white","bold":true}'
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:60s}] if data entity @s Thrower run data modify entity @s CustomName set value '{"text":"0.0","color":"red","bold":true}'

#Dropped item exploding (summons in void so the creeper isn't seen when spawned)
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:60s}] if data entity @s Thrower at @s run summon creeper ~ ~-5 ~ {Invulnerable:1b,CustomNameVisible:0b,ExplosionRadius:3b,Fuse:0,ignited:1b,Tags:["ed_explosion"],CustomName:'{"text":"Item"}'}
execute if score %explosive explosive_drop matches 1 as @e[type=item,nbt={Age:60s}] if data entity @s Thrower at @s positioned ~ ~-5 ~ run tp @e[type=minecraft:creeper,limit=1,sort=nearest,tag=ed_explosion] @s