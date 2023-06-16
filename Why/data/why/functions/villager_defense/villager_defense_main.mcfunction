# Villager defense
execute as @e[type=minecraft:villager,nbt={HurtTime:10s}] at @s unless entity @s[nbt={ActiveEffects:[{Id:11, Amplifier:4b}]}] unless score @s villager_defense matches 1.. at @s run playsound minecraft:block.portal.trigger master @a ~ ~ ~ 1 2
execute as @e[type=minecraft:villager,nbt={HurtTime:10s}] at @s unless entity @s[nbt={ActiveEffects:[{Id:11, Amplifier:4b}]}] unless score @s villager_defense matches 1.. at @s run particle minecraft:portal ~ ~1 ~ 0 0 0 4 1000
execute as @e[type=minecraft:villager,nbt={HurtTime:10s}] at @s unless entity @s[nbt={ActiveEffects:[{Id:11, Amplifier:4b}]}] unless score @s villager_defense matches 1.. run data modify entity @s NoAI set value 1b
execute as @e[type=minecraft:villager,nbt={HurtTime:10s}] at @s unless entity @s[nbt={ActiveEffects:[{Id:11, Amplifier:4b}]}] unless score @s villager_defense matches 1.. run scoreboard players set @s villager_defense 120

execute as @e[scores={villager_defense=80},type=villager] run data modify entity @s NoAI set value 0b
execute as @e[scores={villager_defense=80},type=villager] at @s run effect give @e[type=villager,distance=..15] resistance 2 4 true
execute as @e[scores={villager_defense=80},type=villager] run effect give @s regeneration 7 2 false
execute as @e[scores={villager_defense=80},type=villager] at @s run summon creeper ~ ~ ~ {Silent:1b,Invulnerable:1b,ExplosionRadius:8b,Fuse:0,CustomName:'{"text":"Villager"}'}
execute as @e[scores={villager_defense=80},type=villager] at @s run playsound minecraft:block.respawn_anchor.deplete master @a ~ ~ ~ 1 2

execute as @e[scores={villager_defense=1..},type=villager] run scoreboard players remove @s villager_defense 1