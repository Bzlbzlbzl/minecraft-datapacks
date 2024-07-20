# Removes forceload, kills marker and armor stand, summons item to self, and untags self (RUN BY PRESIDENT)
execute at @s as @e[type=armor_stand,tag=presFlag] if score @s powers_id = @a[team=president,limit=1,sort=nearest] powers_id run kill @s
execute at @s as @e[type=marker,tag=presMarker] if score @s powers_id = @a[team=president,limit=1,sort=nearest] powers_id run kill @s
execute at @s as @e[type=item,scores={pres_drop=1}] if score @s powers_id = @a[team=president,limit=1,sort=nearest] powers_id run tag @s add returningBook
execute at @e[type=item,tag=returningBook] run forceload remove ~ ~ ~ ~
execute at @e[type=item,tag=returningBook] run particle totem_of_undying ~ ~ ~ 0.5 0.5 0.5 0.5 50 force
execute at @e[type=item,tag=returningBook] run playsound minecraft:entity.firework_rocket.blast master @a ~ ~ ~ 1 1

data modify entity @e[type=item,tag=returningBook,limit=1] PickupDelay set value 0s
data modify entity @e[type=item,tag=returningBook,limit=1] Glowing set value 0b
data modify entity @e[type=item,tag=returningBook,limit=1] Age set value 2
data modify entity @e[type=item,tag=returningBook,limit=1] NoGravity set value 0b
data modify entity @e[type=item,tag=returningBook,limit=1] CustomNameVisible set value 0b
tp @e[type=item,tag=returningBook] @s

tag @e[type=item,tag=returningBook] remove returningBook
tag @s remove claimed
tag @s remove returnBook
scoreboard players set @s pres_drop 0
