#Calculations for chicken shooting
execute as @e[type=chicken] at @s run tp @s ~ ~ ~ facing entity @a[team=!p-prot,gamemode=!spectator,limit=1,sort=nearest] eyes
execute as @e[type=chicken] at @s run summon armor_stand ^ ^ ^0.2 {CustomNameVisible:1b,Team:"p-prot",Invulnerable:1b,ShowArms:1b,Tags:["pEgg"],DisabledSlots:4144959}

execute as @e[type=chicken] at @s store result score @s p_pos run data get entity @s Pos[0] 10000
execute as @e[type=chicken] at @s positioned ^ ^ ^0.2 store result score @s p_dpos run data get entity @e[type=armor_stand,limit=1,sort=nearest,tag=pEgg] Pos[0] 10000
execute as @e[type=chicken] run scoreboard players operation @s p_dpos -= @s p_pos
execute as @e[type=chicken] at @s positioned ^ ^ ^0.2 store result entity @e[type=armor_stand,limit=1,sort=nearest,tag=pEgg] Motion[0] double 0.0006 run scoreboard players get @s p_dpos

execute as @e[type=chicken] at @s store result score @s p_pos run data get entity @s Pos[1] 10000
execute as @e[type=chicken] at @s positioned ^ ^ ^0.2 store result score @s p_dpos run data get entity @e[type=armor_stand,limit=1,sort=nearest,tag=pEgg] Pos[1] 10000
execute as @e[type=chicken] run scoreboard players operation @s p_dpos -= @s p_pos
execute as @e[type=chicken] at @s positioned ^ ^ ^0.2 store result entity @e[type=armor_stand,limit=1,sort=nearest,tag=pEgg] Motion[1] double 0.0009 run scoreboard players get @s p_dpos

execute as @e[type=chicken] at @s store result score @s p_pos run data get entity @s Pos[2] 10000
execute as @e[type=chicken] at @s positioned ^ ^ ^0.2 store result score @s p_dpos run data get entity @e[type=armor_stand,limit=1,sort=nearest,tag=pEgg] Pos[2] 10000
execute as @e[type=chicken] run scoreboard players operation @s p_dpos -= @s p_pos
execute as @e[type=chicken] at @s positioned ^ ^ ^0.2 store result entity @e[type=armor_stand,limit=1,sort=nearest,tag=pEgg] Motion[2] double 0.0006 run scoreboard players get @s p_dpos