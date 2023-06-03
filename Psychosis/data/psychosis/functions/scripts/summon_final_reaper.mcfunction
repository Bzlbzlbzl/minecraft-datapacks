#Summons the "same" reaper behind skeleton but just tag is psyReaper instead of psyCreature, also kills all other reapers RUN BY PLAYER AT BEHIND SKELE

#Kills reaper
execute at @s as @e[tag=psyCreature,type=wither_skeleton] if score @s psy_id = @p[scores={psychosis=72003}] psy_id run function psychosis:scripts/kill_creature

#Summons reaper
summon area_effect_cloud ~ ~4 ~ {Tags:["psyMarker"]}
execute as @e[tag=psyMarker,limit=1] at @s if dimension the_nether run spreadplayers ~ ~ 0 1 under 119 false @s
execute as @e[tag=psyMarker,limit=1] at @s unless dimension the_nether run spreadplayers ~ ~ 0 1 false @s

execute at @e[tag=psyMarker,limit=1] run summon wither_skeleton ~ ~ ~ {Silent:1b,DeathLootTable:"minecraft:empty",Invulnerable:1b,PersistenceRequired:1b,NoAI:1b,CanPickUpLoot:0b,Tags:["psyReaper","psySpawned"],ArmorItems:[{},{},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{Name:'{"text":"Reaper\'s Robe","color":"black","italic":false}',Lore:['{"text":"Your body isn\'t as"}','{"text":"tangible as the living."}'],color:0},HideFlags:5,Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.knockback_resistance",Name:"generic.knockback_resistance",Amount:0.1,Operation:0,UUID:[I;2140370788,122831175,-1117071607,1877739167],Slot:"chest"}]}},{id:"minecraft:leather_helmet",Count:1b,tag:{display:{Name:'{"text":"Reaper\'s Hood","color":"black","italic":false}',Lore:['{"text":"Nobody knows what\'s under"}','{"text":"this hood... not even you."}'],color:0},HideFlags:5,Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.movement_speed",Name:"generic.movement_speed",Amount:0.1,Operation:1,UUID:[I;-734874255,604457540,-1498911138,-520511022],Slot:"head"}]}}],HandDropChances:[0.000F,0.000F],ArmorDropChances:[0.000F,0.000F,0.000F,0.000F]}
kill @e[tag=psyMarker]

scoreboard players operation @e[tag=psySpawned,tag=psyReaper,type=wither_skeleton,limit=1] psy_id = @s psy_id

execute at @s as @e[type=skeleton,tag=psyDying] if score @s psy_id = @p[scores={psychosis=72003}] psy_id run tag @s add psySkele

execute as @e[type=wither_skeleton,tag=psySpawned] at @s anchored eyes run tp @s ~ ~ ~ facing entity @e[type=skeleton,tag=psyDying,tag=psySkele,limit=1] eyes
execute as @e[type=wither_skeleton,tag=psySpawned] at @s run playsound minecraft:entity.blaze.shoot ambient @a ~ ~ ~ 0.4 1
execute as @e[type=wither_skeleton,tag=psySpawned] at @s run particle minecraft:large_smoke ~ ~0.8 ~ 0.2 0.8 0.2 0.01 30 normal
execute as @e[type=wither_skeleton,tag=psySpawned] at @s run playsound minecraft:entity.wither.spawn ambient @a ~ ~ ~ 1 2

execute as @e[type=wither_skeleton,tag=psySpawned] at @s run forceload add ~ ~

execute as @e[tag=psySkele] run tag @s remove psySkele
execute as @e[tag=psySpawned] run tag @s remove psySpawned



