# Why.
execute as @e on target if entity @s[type=minecraft:villager] unless score @s why matches 1.. at @s run playsound minecraft:block.portal.trigger master @a ~ ~ ~ 1 2
execute as @e on target if entity @s[type=minecraft:villager] unless score @s why matches 1.. at @s run particle minecraft:portal ~ ~1 ~ 0 0 0 4 1000
execute as @e on target if entity @s[type=minecraft:villager] unless score @s why matches 1.. run data modify entity @s NoAI set value 1b
execute as @e on target if entity @s[type=minecraft:villager] unless score @s why matches 1.. run tag @s add toExplode
execute as @e on target if entity @s[type=minecraft:villager] unless score @s why matches 1.. run scoreboard players set @s why 120

execute as @e[type=minecraft:villager] at @s on attacker if entity @s[type=player] as @e[limit=1,sort=nearest,type=minecraft:villager] unless score @s why matches 1.. at @s run playsound minecraft:block.portal.trigger master @a ~ ~ ~ 1 2
execute as @e[type=minecraft:villager] at @s on attacker if entity @s[type=player] as @e[limit=1,sort=nearest,type=minecraft:villager] unless score @s why matches 1.. at @s run particle minecraft:portal ~ ~1 ~ 0 0 0 4 1000
execute as @e[type=minecraft:villager] at @s on attacker if entity @s[type=player] as @e[limit=1,sort=nearest,type=minecraft:villager] unless score @s why matches 1.. run data modify entity @s NoAI set value 1b
execute as @e[type=minecraft:villager] at @s on attacker if entity @s[type=player] as @e[limit=1,sort=nearest,type=minecraft:villager] unless score @s why matches 1.. run tag @s add toExplode
execute as @e[type=minecraft:villager] at @s on attacker if entity @s[type=player] as @e[limit=1,sort=nearest,type=minecraft:villager] unless score @s why matches 1.. run scoreboard players set @s why 120

execute as @e[scores={why=80},type=villager] run data modify entity @s NoAI set value 0b
execute as @e[scores={why=80},type=villager] at @s run effect give @e[type=villager,distance=..15] resistance 2 4 true
execute as @e[scores={why=80},type=villager] run effect give @s regeneration 7 2 false
execute as @e[scores={why=80},type=villager] at @s run summon creeper ~ ~ ~ {Silent:1b,Invulnerable:1b,ExplosionRadius:8b,Fuse:0,CustomName:'{"text":"Villager"}'}
execute as @e[scores={why=80},type=villager] at @s run playsound minecraft:block.respawn_anchor.deplete master @a ~ ~ ~ 1 2

execute as @e[scores={why=1..},type=villager] run scoreboard players remove @s why 1