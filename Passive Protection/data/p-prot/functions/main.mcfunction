# # # Passive Protection - Bzlbzlbzl # # #

#Tags any all pAI with toKill and then removes it if there is no pProt mob with their score (their pProt mob died); in this case, unless is not the inverse of if, so I have to do it this way
tag @e[tag=pAI] add toKill
execute as @e[tag=pAI] at @e[tag=pProt] if score @e[tag=pProt,limit=1,sort=nearest] p_prot_id = @s p_prot_id run tag @s remove toKill

#Tags any nearby cow with pProt and turns them into a pProt cow
execute as @a[team=p-prot] at @s as @e[type=cow,distance=..8,tag=!pProt,nbt={Age:0}] run data merge entity @s {CustomNameVisible:1b,CustomName:'{"text":"Cow Protector","color":"green","bold":true}',ActiveEffects:[{Id:10b,Amplifier:0b,Duration:2147483647}],Attributes:[{Name:generic.armor,Base:12}],Team:"p-prot"}
execute as @a[team=p-prot] at @s as @e[type=cow,distance=..8,tag=!pProt,nbt={Age:0}] run function p-prot:assign_next
execute as @a[team=p-prot] at @s run tag @e[type=cow,distance=..8,tag=!pProt,nbt={Age:0}] add pProt

#Enters pPassive mode (all); summons a pAI cat for all pProt without pPassive or pAgressive tags (will default to pPassive therefore)
execute as @e[tag=pProt,tag=!pAgressive,tag=!pPassive] at @s run summon cat ~ ~ ~ {Silent:1b,Invulnerable:1b,Team:"p-prot",Age:-2147483647,Tags:["pAI"],ActiveEffects:[{Id:14b,Amplifier:0b,Duration:2147483647,ShowParticles:0b}]}
execute as @e[tag=pProt,tag=!pAgressive,tag=!pPassive] at @s run scoreboard players operation @e[type=cat,limit=1,sort=nearest,tag=pAI] p_prot_id = @s p_prot_id
execute as @e[tag=pProt,tag=!pAgressive,tag=!pPassive] at @s run data modify entity @e[type=cat,limit=1,sort=nearest,tag=pAI] Owner set from entity @a[team=p-prot,limit=1,sort=nearest] UUID
tag @e[tag=pProt,tag=!pAgressive,tag=!pPassive] add pPassive

#Enters pAgressive mode (cows); summons a pAI vindicator for all pProt pPassive cows within 18 blocks of an enemy player; red cow name
execute as @e[type=cow,tag=pProt,tag=pPassive] at @s if entity @a[team=!p-prot,distance=..18] run tag @e[tag=pAI,type=cat,limit=1,sort=nearest] add toKill
execute as @e[type=cow,tag=pProt,tag=pPassive] at @s if entity @a[team=!p-prot,distance=..18] run summon vindicator ~ ~ ~ {Silent:1b,Invulnerable:1b,Team:"p-prot",CanPickUpLoot:0b,PersistenceRequired:1b,CanJoinRaid:0b,Tags:["pAI"],CustomName:'{"text":"Cow Protector","color":"red","bold":true}',HandItems:[{id:"minecraft:iron_axe",Count:1b},{}],ActiveEffects:[{Id:14b,Amplifier:0b,Duration:2147483647,ShowParticles:0b},{Id:30b,Amplifier:10b,Duration:2147483647,ShowParticles:0b}],Attributes:[{Name:generic.follow_range,Base:20},{Name:generic.movement_speed,Base:0.41},{Name:generic.attack_damage,Base:2},{Name:generic.attack_knockback,Base:9}]}
execute as @e[type=cow,tag=pProt,tag=pPassive] at @s if entity @a[team=!p-prot,distance=..18] run scoreboard players operation @e[type=vindicator,limit=1,sort=nearest,tag=pAI] p_prot_id = @s p_prot_id
execute as @e[type=cow,tag=pProt,tag=pPassive] at @s if entity @a[team=!p-prot,distance=..18] run data merge entity @s {CustomName:'{"text":"Cow Protector","color":"red","bold":true}'}
execute as @e[type=cow,tag=pProt,tag=pPassive] at @s if entity @a[team=!p-prot,distance=..18] run tag @s add pAgressive
execute as @e[type=cow,tag=pProt,tag=pPassive] at @s if entity @a[team=!p-prot,distance=..18] run tag @s remove pPassive

#Leaves pPassive mode (cows); kills pAI vindicator and tp's to p-prot player if not within 18 blocks of an enemy player; green cow name
execute as @e[type=cow,tag=pProt,tag=pAgressive] at @s unless entity @a[team=!p-prot,distance=..18] run tag @e[type=vindicator,tag=pAI,sort=nearest,limit=1] add toKill
execute as @e[type=cow,tag=pProt,tag=pAgressive] at @s unless entity @a[team=!p-prot,distance=..18] run data merge entity @s {CustomName:'{"text":"Cow Protector","color":"green","bold":true}'}
execute as @e[type=cow,tag=pProt,tag=pAgressive] at @s unless entity @a[team=!p-prot,distance=..18] run tag @s remove pAgressive
execute as @e[type=vindicator,tag=pAI,tag=toKill] unless entity @a[team=p-prot,distance=..16] run tp @s @a[team=p-prot,limit=1,sort=nearest]

#Teleports all pProt to their respective pAI
execute as @e[tag=pProt] at @e[tag=pAI] if score @s p_prot_id = @e[tag=pAI,limit=1,sort=nearest] p_prot_id run tp @s @e[tag=pAI,limit=1,sort=nearest]

#Prevents any pAI cat from sitting
execute as @e[type=cat,tag=pAI,nbt={Sitting:1b}] run data modify entity @s Sitting set value 0b

#Kills any tagged with toKill; also sets the Owner of cat to [I; 0, 0, 0, 0] so no death messages (data remove doesn't work; sorry to whoever has [I; 0, 0, 0, 0] UUID who will get that spam)
execute as @e[type=cat,tag=pAI,tag=toKill] run data merge entity @s {Owner:[I; 0, 0, 0, 0]}
execute as @e[tag=toKill] at @s run tp @s ~ -5 ~
kill @e[tag=toKill]
