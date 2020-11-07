# # # Passive Protection - Bzlbzlbzl # # #

#Tags any nearby cow with pProt and turns them into a pProt cow
execute as @a[team=p-prot] at @s as @e[type=cow,distance=..8,tag=!pProt,nbt={Age:0}] run data merge entity @s {CustomNameVisible:1b,CustomName:'{"text":"Cow Protector","color":"green","bold":true}',ActiveEffects:[{Id:10b,Amplifier:0b,Duration:2147483647}],Attributes:[{Name:generic.armor,Base:12}],Team:"p-prot"}
execute as @a[team=p-prot] at @s as @e[type=cow,distance=..8,tag=!pProt,nbt={Age:0}] run function p-prot:assign_next
execute as @a[team=p-prot] at @s run tag @e[type=cow,distance=..8,tag=!pProt,nbt={Age:0}] add pProt

#Summons a pAI cat for all pProt without pPassive or pAgressive tags (will default to pPassive therefore)
execute as @e[tag=pProt,tag=!pAgressive,tag=!pPassive] at @s run summon cat ~ ~ ~ {Silent:1b,Invulnerable:1b,Team:"p-prot",Age:-2147483647,Tags:["pAI"],ActiveEffects:[{Id:14b,Amplifier:0b,Duration:2147483647,ShowParticles:0b}]}
execute as @e[tag=pProt,tag=!pAgressive,tag=!pPassive] at @s run scoreboard players operation @e[type=cat,limit=1,sort=nearest,tag=pAI] p_prot_id = @s p_prot_id
execute as @e[tag=pProt,tag=!pAgressive,tag=!pPassive] at @s run data modify entity @e[type=cat,limit=1,sort=nearest,tag=pAI] Owner set from entity @a[team=p-prot,limit=1,sort=nearest] UUID
tag @e[tag=pProt,tag=!pAgressive,tag=!pPassive] add pPassive

#Teleports all pProt to their respective pAI
execute as @e[tag=pProt,tag=pPassive] at @e[type=cat,tag=pAI] if score @s p_prot_id = @e[type=cat,tag=pAI,limit=1,sort=nearest] p_prot_id run tp @s @e[type=cat,tag=pAI,limit=1,sort=nearest]

#Prevents any pAI cat from sitting
execute as @e[type=cat,tag=pAI,nbt={Sitting:1b}] run data modify entity @s Sitting set value 0b

#Tags any all pAI with toKill and then removes it if there is no pProt mob with their score (the pProt mob died); in this case, unless is not the inverse of if, so I have to do it this way
tag @e[tag=pAI] add toKill
execute as @e[tag=pAI] at @e[tag=pProt] if score @e[tag=pProt,limit=1,sort=nearest] p_prot_id = @s p_prot_id run tag @s remove toKill

#Kills any tagged with toKill; also sets the Owner of cat to [I; 0, 0, 0, 0] so no death messages (data remove doesn't work; sorry to whoever has [I; 0, 0, 0, 0] UUID who will get that spam)
execute as @e[type=cat,tag=pAI,tag=toKill] run data merge entity @s {Owner:[I; 0, 0, 0, 0]}
execute as @e[tag=toKill] at @s run tp @s ~ -5 ~
kill @e[tag=toKill]
