# Recursive crafting of the Spooderballs
#Summoning Spooderball Item
summon item ~ ~ ~ {PickupDelay:20,Item:{id:"minecraft:snowball",Count:1b,tag:{display:{Name:'{"text":"Spooderball","color":"yellow","italic":false}'},HideFlags:1,spooder:1b,Enchantments:[{id:"minecraft:protection",lvl:0s}]}}}

#Storing the count as a scoreboard then subtracting one then setting new score as count for both string and snowball; kill's self if score is 0 (because for some reason servers don't let you set item count to 0)
execute store result score @e[type=item,nbt={Item:{id:"minecraft:string"}},distance=..1,limit=1,sort=nearest] spooderball run data get entity @e[type=item,nbt={Item:{id:"minecraft:string"}},distance=..1,limit=1,sort=nearest] Item.Count 1
scoreboard players remove @e[type=item,nbt={Item:{id:"minecraft:string"}},distance=..1,limit=1,sort=nearest] spooderball 1
execute store result entity @e[type=item,nbt={Item:{id:"minecraft:string"}},distance=..1,limit=1,sort=nearest] Item.Count byte 1 run scoreboard players get @e[type=item,nbt={Item:{id:"minecraft:string"}},distance=..1,limit=1,sort=nearest] spooderball
execute if score @e[type=item,nbt={Item:{id:"minecraft:string"}},distance=..1,limit=1,sort=nearest] spooderball matches ..0 run kill @e[type=item,nbt={Item:{id:"minecraft:string"}},distance=..1,limit=1,sort=nearest]

execute store result score @s spooderball run data get entity @s Item.Count 1
scoreboard players remove @s spooderball 1
execute store result entity @s Item.Count byte 1 run scoreboard players get @s spooderball
execute if score @s spooderball matches ..0 run kill @s

#Recursively runs again, if there is a snowball near the string on a crafting table
execute as @e[type=item,nbt={Item:{id:"minecraft:string"}},distance=..1,limit=1,sort=nearest] as @e[type=item,nbt={Item:{id:"minecraft:snowball"}},nbt=!{Item:{tag:{spooder:1b}}},distance=..1,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:crafting_table run function spooderball:scripts/spoodercraft


