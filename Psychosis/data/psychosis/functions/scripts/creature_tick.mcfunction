# Manages psychosis creature facing and inventory run every tick, also run by head
#Finds player
execute as @a if score @s psy_id = @e[limit=1,sort=nearest,tag=psyCreature] psy_id run tag @s add psyPlayer

#Quick sound stuff (because apparently player needs to be 16 blocks away to hear a sound)
execute if entity @s[type=minecraft:skeleton,tag=!psySounded] if entity @a[tag=psyPlayer,limit=1,distance=..15] run playsound minecraft:music_disc.13 ambient @a[tag=psyPlayer,limit=1] ~ ~ ~ 0.7 0
execute if entity @s[type=minecraft:skeleton,tag=!psySounded] if entity @a[tag=psyPlayer,limit=1,distance=..15] run tag @s add psySounded

#Face player (both skeleton and enderman)
execute anchored eyes run tp @s ~ ~ ~ facing entity @a[tag=psyPlayer,limit=1] eyes

#Skeleton inventory
execute if entity @s[type=minecraft:skeleton] run item replace entity @s weapon.mainhand from entity @a[tag=psyPlayer,limit=1] weapon.mainhand
execute if entity @s[type=minecraft:skeleton] run item replace entity @s weapon.offhand from entity @a[tag=psyPlayer,limit=1] weapon.offhand
execute if entity @s[type=minecraft:skeleton] run item replace entity @s armor.head from entity @a[tag=psyPlayer,limit=1] armor.head
execute if entity @s[type=minecraft:skeleton] run item replace entity @s armor.chest from entity @a[tag=psyPlayer,limit=1] armor.chest
execute if entity @s[type=minecraft:skeleton] run item replace entity @s armor.legs from entity @a[tag=psyPlayer,limit=1] armor.legs
execute if entity @s[type=minecraft:skeleton] run item replace entity @s armor.feet from entity @a[tag=psyPlayer,limit=1] armor.feet

#Enderman head move only once
execute if entity @s[type=minecraft:enderman] at @s as @e[tag=psyHead,type=armor_stand,limit=1,sort=nearest] rotated ~ 0 positioned ^ ^-0.7 ^0.8 run tp @s ~ ~ ~ facing entity @a[tag=psyPlayer,limit=1] eyes
#execute if entity @s[type=minecraft:enderman] at @s rotated ~ 0 positioned ^ ^-0.7 ^0.8 as @e[tag=psyHead,type=armor_stand,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ ~ 0
execute if entity @s[type=minecraft:enderman,tag=!psyDone] run tag @s add psyDone

execute as @e[tag=psyPlayer] run tag @s remove psyPlayer