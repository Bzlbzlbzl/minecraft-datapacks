# Summons psychosis creatures RUN BY PLAYER
#Sounds
playsound minecraft:ambient.cave ambient @s ~ ~ ~ 1 1.3 1
playsound minecraft:ambient.soul_sand_valley.mood ambient @s ~ ~ ~ 1 0 1

#Summoning skeleton
execute as @e[tag=psyMarker] at @s run summon skeleton ~ ~ ~ {Silent:1b,Invulnerable:1b,DeathLootTable:"minecraft:empty",NoAI:1b,Tags:["psyCreature","psySpawned"],CanPickUpLoot:0b,PersistenceRequired:1b,HandDropChances:[0.000F,0.000F],ArmorDropChances:[0.000F,0.000F,0.000F,0.000F]}
execute as @e[tag=psyMarker] at @s run particle minecraft:smoke ~ ~0.8 ~ 0.2 0.8 0.2 0.01 20 normal
execute as @e[tag=psyMarker] at @s run playsound minecraft:entity.blaze.shoot ambient @a ~ ~ ~ 0.4 1

#Enderman based on psychosis level
execute if score @s psychosis matches 72001.. as @e[tag=psySpawned,limit=1] at @s run summon enderman ~ ~ ~2 {Silent:1b,Invulnerable:1b,DeathLootTable:"minecraft:empty",PersistenceRequired:1b,NoAI:1b,CanPickUpLoot:0b,Tags:["psyCreature","psySpawned"],HandDropChances:[0.000F,0.000F],ArmorDropChances:[0.000F,0.000F,0.000F,0.000F],carriedBlockState:{Name:"minecraft:structure_void"}}
execute if dimension the_nether if score @s psychosis matches 72001.. as @e[tag=psySpawned,type=skeleton,limit=1] at @s run spreadplayers ~ ~ 2 2 under 119 false @e[tag=psySpawned]
execute unless dimension the_nether if score @s psychosis matches 72001.. as @e[tag=psySpawned,type=skeleton,limit=1] at @s run spreadplayers ~ ~ 2 2 false @e[tag=psySpawned]

#Teleport down if block is grass or some other stuff
execute as @e[tag=psySpawned] run function psychosis:scripts/tp_down_single
execute as @e[tag=psySpawned] at @s if block ~ ~-1 ~ #psychosis:half_block_down run tp @s ~ ~-0.5 ~
execute as @e[tag=psySpawned] at @s if block ~ ~-1 ~ #psychosis:two_block_down run tp @s ~ ~-2 ~

#Enderman static facing, and head holding item positions, then face directly towards skeleton (because of visual glitch, will rotate after)
execute as @e[tag=psySpawned,type=enderman,limit=1] at @s run tp @s ~ ~ ~ facing entity @e[tag=psySpawned,type=skeleton,limit=1] feet
execute as @e[tag=psySpawned,type=enderman,limit=1] at @s rotated ~60 0 positioned ^ ^-0.7 ^0.8 run summon armor_stand ~ ~ ~ {Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,PersistenceRequired:1b,Tags:["psyHead","psySpawned"],ArmorItems:[{},{},{},{id:"minecraft:player_head",count:1,components:{"minecraft:profile":{name:"Catxolotl"}}}]}
loot replace entity @e[tag=psySpawned,tag=psyHead,type=armor_stand,limit=1] armor.head loot minecraft:blocks/psy_player_head
execute as @e[tag=psySpawned,tag=psyHead,type=armor_stand] at @s run tp @s ~ ~ ~ facing entity @e[tag=psySpawned,type=skeleton,limit=1] feet

execute as @e[tag=psySpawned] at @s run forceload add ~ ~ ~ ~
scoreboard players operation @e[tag=psySpawned] psy_id = @s psy_id

#Kills duplicates on spawn
execute as @e[tag=psySpawned,type=skeleton] at @s as @e[tag=psyCreature,type=skeleton,tag=!psySpawned] if score @s psy_id = @e[tag=psySpawned,type=skeleton,limit=1,sort=nearest] psy_id at @s run function psychosis:scripts/kill_creature

execute as @e[tag=psySpawned] run tag @s remove psySpawned
tag @s add psychosis
