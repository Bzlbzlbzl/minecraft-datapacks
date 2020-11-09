#Checks if pig is on fire or not. If so then tp's back to owner (if owner not in water) and resets fire. Takes damage when not on fire
execute store result score %fire p_prot_id run data get entity @s Fire
execute if score %fire p_prot_id matches 0 run effect give @s minecraft:wither 2 0 true
execute if score %fire p_prot_id matches 0 at @a[team=p-prot,limit=1,sort=nearest,gamemode=!spectator] unless block ~ ~ ~ water at @s run particle minecraft:poof ~ ~0.2 ~ 0.5 0.5 0.5 0.05 30
execute if score %fire p_prot_id matches 0 at @a[team=p-prot,limit=1,sort=nearest,gamemode=!spectator] unless block ~ ~ ~ water at @s run playsound minecraft:entity.generic.extinguish_fire master @a ~ ~ ~
execute if score %fire p_prot_id matches 0 at @a[team=p-prot,limit=1,sort=nearest,gamemode=!spectator] unless block ~ ~ ~ water at @s run tp @e[type=cat,tag=pAI,limit=1,sort=nearest] @a[team=p-prot,limit=1,sort=nearest,gamemode=!spectator]
execute if score %fire p_prot_id matches 0 run data modify entity @s Fire set value 1000000