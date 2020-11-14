# Calculations for chicken projectiles - Slime is the one with physics apploed to it

#For some reason I need to have the execute at @s part when summoning or it doesn't update with head rotation
tp @s ~ ~ ~ facing entity @a[team=!p-prot,gamemode=!spectator,limit=1,sort=nearest] eyes
execute at @s run summon slime ^ ^ ^0.2 {Silent:1b,Invulnerable:1b,Team:"p-prot",PersistenceRequired:1b,Size:0,Tags:["pProj"]}
execute at @s run summon armor_stand ^ ^ ^0.2 {Team:"p-prot",Invulnerable:1b,ShowArms:1b,Marker:1b,Tags:["pProj"],DisabledSlots:4144959}
execute positioned ^ ^ ^0.2 as @e[type=slime,limit=1,sort=nearest,tag=pProj] run scoreboard players set @s p_mod 0

execute store result score @s p_pos run data get entity @s Pos[0] 10000
execute positioned ^ ^ ^0.2 store result score @s p_dpos run data get entity @e[type=slime,limit=1,sort=nearest,tag=pProj] Pos[0] 10000
scoreboard players operation @s p_dpos -= @s p_pos
execute positioned ^ ^ ^0.2 store result entity @e[type=slime,limit=1,sort=nearest,tag=pProj] Motion[0] double 0.0007 run scoreboard players get @s p_dpos

execute store result score @s p_pos run data get entity @s Pos[1] 10000
execute positioned ^ ^ ^0.2 store result score @s p_dpos run data get entity @e[type=slime,limit=1,sort=nearest,tag=pProj] Pos[1] 10000
scoreboard players operation @s p_dpos -= @s p_pos
execute positioned ^ ^ ^0.2 store result entity @e[type=slime,limit=1,sort=nearest,tag=pProj] Motion[1] double 0.0009 run scoreboard players get @s p_dpos

execute store result score @s p_pos run data get entity @s Pos[2] 10000
execute positioned ^ ^ ^0.2 store result score @s p_dpos run data get entity @e[type=slime,limit=1,sort=nearest,tag=pProj] Pos[2] 10000
scoreboard players operation @s p_dpos -= @s p_pos
execute positioned ^ ^ ^0.2 store result entity @e[type=slime,limit=1,sort=nearest,tag=pProj] Motion[2] double 0.0007 run scoreboard players get @s p_dpos