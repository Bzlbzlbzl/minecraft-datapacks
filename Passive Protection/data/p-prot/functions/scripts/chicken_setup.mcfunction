# Setup for chicken projectiles

#For some reason I need to have the execute at @s part when summoning or it doesn't update with head rotation
execute if entity @a[team=!p-prot,gamemode=!spectator,limit=1,sort=nearest,distance=5..12] run tp @s ~ ~ ~ facing entity @a[team=!p-prot,gamemode=!spectator,limit=1,sort=nearest] eyes
execute if entity @a[team=!p-prot,gamemode=!spectator,limit=1,sort=nearest,distance=..5] run tp @s ~ ~ ~ facing entity @a[team=!p-prot,gamemode=!spectator,limit=1,sort=nearest] feet

execute at @s run summon slime ~ ~ ~ {Silent:1b,Invulnerable:1b,Team:"p-prot",PersistenceRequired:1b,Size:0,Tags:["pEgg"],ActiveEffects:[{Id:14b,Amplifier:0b,Duration:2147483647,ShowParticles:0b},{Id:19b,Amplifier:0b,Duration:2147483647,ShowParticles:1b}],NoAI:1b}
execute at @s run summon armor_stand ~ ~-2 ~ {Glowing:1b,Team:"p-prot",Marker:1b,Invisible:1b,Tags:["pProj"],DisabledSlots:4144959,ArmorItems:[{},{},{},{id:"minecraft:turtle_egg",Count:1b}]}

execute at @s as @e[type=armor_stand,tag=pProj,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ facing entity @a[team=!p-prot,gamemode=!spectator,limit=1,sort=nearest] feet

execute as @e[type=slime,limit=1,sort=nearest,tag=pEgg] run scoreboard players set @s p_mod 0
scoreboard players operation @e[type=slime,limit=1,sort=nearest,tag=pEgg] p_prot_id = @s p_prot_id