# Makes the egg "stuck" (I need this as a separate function because this needs to happen immediately)

data modify entity @s NoAI set value 1b
tp @e[type=pufferfish,tag=pProj,limit=1,sort=nearest,tag=!pStuck] @s
tp @e[type=armor_stand,tag=pProj,limit=1,sort=nearest,tag=!pStuck] ~ ~-2 ~
execute positioned ~ ~-2 ~ as @e[type=armor_stand,tag=pProj,limit=1,sort=nearest,tag=!pStuck] at @s rotated ~ 0 run tp @s ^ ^ ^0.3
tag @e[type=pufferfish,tag=pProj,limit=1,sort=nearest,tag=!pStuck] add pStuck
tag @e[type=armor_stand,tag=pProj,limit=1,sort=nearest,tag=!pStuck] add pStuck
tag @s add pStuck