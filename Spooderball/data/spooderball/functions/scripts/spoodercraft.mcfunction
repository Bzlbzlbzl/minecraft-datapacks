# Recursive crafting of the Spooderballs
#Summoning Spooderball Item
summon item ~ ~ ~ {PickupDelay:20,Item:{id:"minecraft:snowball",Count:1b,tag:{display:{Name:'{"text":"Spooderball","color":"yellow","italic":false}'},HideFlags:1,spooder:1b,Enchantments:[{id:"minecraft:protection",lvl:0s}]}}}

#Storing the count as a scoreboard then subtracting one then setting new score as count for both snowball and string
execute store result score @s spooderball run data get entity @s Item.Count 1
scoreboard players remove @s spooderball 1
execute store result entity @s Item.Count byte 1 run scoreboard players get @s spooderball

execute store result score @e[type=item,nbt={Item:{id:"minecraft:string"}},distance=..1,limit=1,sort=nearest] spooderball run data get entity @e[type=item,nbt={Item:{id:"minecraft:string"}},distance=..1,limit=1,sort=nearest] Item.Count 1
scoreboard players remove @e[type=item,nbt={Item:{id:"minecraft:string"}},distance=..1,limit=1,sort=nearest] spooderball 1
execute store result entity @e[type=item,nbt={Item:{id:"minecraft:string"}},distance=..1,limit=1,sort=nearest] Item.Count byte 1 run scoreboard players get @e[type=item,nbt={Item:{id:"minecraft:string"}},distance=..1,limit=1,sort=nearest] spooderball

#Recursively runs again, if can run again (will always run as the correct snowball because the command is run AT the snowball AS the STRING then AS nearest snowball (which it is already at)
execute as @e[type=item,nbt={Item:{id:"minecraft:string"}},distance=..1,limit=1,sort=nearest] as @e[type=item,nbt={Item:{id:"minecraft:snowball"}},nbt=!{Item:{tag:{spooder:1b}}},limit=1,sort=nearest] run function spooderball:scripts/spoodercraft


