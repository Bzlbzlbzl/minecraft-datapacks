# Removes forceload, kills marker and armor stand, summons item to ground (RUN BY presMarker marker)
execute at @s as @e[type=armor_stand,tag=presFlag] if score @s powers_id = @e[type=marker,limit=1,sort=nearest,tag=presMarker] powers_id run kill @s
execute at @s as @e[type=item,scores={pres_drop=1}] if score @s powers_id = @e[type=marker,limit=1,sort=nearest,tag=presMarker] powers_id run tag @s add returningBook
execute at @e[type=item,tag=returningBook] run forceload remove ~ ~ ~ ~
execute at @e[type=item,tag=returningBook] run particle minecraft:large_smoke ~ ~ ~ 0.3 0.3 0.3 0.15 20
execute at @e[type=item,tag=returningBook] run particle minecraft:firework ~ ~ ~ 0.1 0.1 0.1 0.15 10 normal
execute at @e[type=item,tag=returningBook] run playsound minecraft:entity.firework_rocket.blast master @a ~ ~ ~ 1 1

data remove entity @e[type=item,tag=returningBook,limit=1] Owner
data modify entity @e[type=item,tag=returningBook,limit=1] PickupDelay set value 0s
data modify entity @e[type=item,tag=returningBook,limit=1] Glowing set value 0b
data modify entity @e[type=item,tag=returningBook,limit=1] Age set value 2
data modify entity @e[type=item,tag=returningBook,limit=1] NoGravity set value 0b
data modify entity @e[type=item,tag=returningBook,limit=1] CustomNameVisible set value 0b
data modify entity @e[type=item,tag=returningBook,limit=1] Invulnerable set value 0b
scoreboard players reset @e[type=item,tag=returningBook,limit=1] pres_drop
execute as @e[type=item,tag=returningBook,limit=1] run function powers:songs/stop_all
tag @e[type=item,tag=returningBook] remove returningBook

execute at @s as @a[team=president,tag=claimed] if score @s powers_id = @e[type=marker,tag=presMarker,limit=1,sort=nearest] powers_id run tag @s add losingClaim
tag @a[tag=losingClaim] remove claimed
scoreboard players set @a[tag=losingClaim] pres_drop 0
scoreboard players set @a[tag=losingClaim] pres_cd 600
execute as @a[tag=losingClaim] at @s run playsound minecraft:item.goat_horn.sound.7 master @a ~ ~ ~ 0.7 1.4
tag @a[tag=losingClaim] remove losingClaim

kill @s