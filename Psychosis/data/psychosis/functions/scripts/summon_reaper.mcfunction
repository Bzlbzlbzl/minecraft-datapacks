#Summons the wither skeleton RUN BY PLAYER. Uses psyMarker because of spawning spreadplayers interpolation which is annoying
tag @s add psyPlayer
tag @s add psyHaunted

summon area_effect_cloud ~ ~4 ~ {Tags:["psyMarker"]}
execute as @e[tag=psyMarker,limit=1] at @s if dimension the_nether run spreadplayers ~ ~ 0 1 under 119 false @s
execute as @e[tag=psyMarker,limit=1] at @s unless dimension the_nether run spreadplayers ~ ~ 0 1 false @s

execute at @e[tag=psyMarker,limit=1] run summon wither_skeleton ~ ~ ~ {Silent:1b,DeathLootTable:"minecraft:empty",Invulnerable:1b,PersistenceRequired:1b,NoAI:1b,CanPickUpLoot:0b,Tags:["psyCreature","psySpawned"],HandItems:[{id:"minecraft:netherite_hoe",Count:1b,tag:{display:{Name:'{"text":"Soul Reaper","color":"black","italic":false}',Lore:['{"text":"This mysterious scythe has"}','{"text":"strange powers. Not even you"}','{"text":"have complete mastery of it. "}']},HideFlags:6,Unbreakable:1b,Enchantments:[{id:"minecraft:sharpness",lvl:10s},{id:"minecraft:knockback",lvl:2s}]}},{}],ArmorItems:[{},{},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{Name:'{"text":"Reaper\'s Robe","color":"black","italic":false}',Lore:['{"text":"Your body isn\'t as"}','{"text":"tangible as the living."}'],color:0},HideFlags:5,Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.knockback_resistance",Name:"generic.knockback_resistance",Amount:0.1,Operation:0,UUID:[I;2140370788,122831175,-1117071607,1877739167],Slot:"chest"}]}},{id:"minecraft:leather_helmet",Count:1b,tag:{display:{Name:'{"text":"Reaper\'s Hood","color":"black","italic":false}',Lore:['{"text":"Nobody knows what\'s under"}','{"text":"this hood... not even you."}'],color:0},HideFlags:5,Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.movement_speed",Name:"generic.movement_speed",Amount:0.1,Operation:1,UUID:[I;-734874255,604457540,-1498911138,-520511022],Slot:"head"}]}}],HandDropChances:[0.000F,0.000F],ArmorDropChances:[0.000F,0.000F,0.000F,0.000F]}
kill @e[tag=psyMarker]

scoreboard players operation @e[tag=psySpawned,tag=psyCreature,type=wither_skeleton,limit=1] psy_id = @s psy_id

execute as @e[type=wither_skeleton,tag=psySpawned] at @s run tp @s ~ ~ ~ facing entity @p[tag=psyPlayer]
execute as @e[type=wither_skeleton,tag=psySpawned] at @s run playsound minecraft:entity.blaze.shoot ambient @a ~ ~ ~ 0.1 1
execute as @e[type=wither_skeleton,tag=psySpawned] at @s run particle minecraft:smoke ~ ~0.8 ~ 0.2 0.8 0.2 0.01 30 normal
execute as @e[type=wither_skeleton,tag=psySpawned] run scoreboard players set @s psy_sound 200

execute as @e[type=wither_skeleton,tag=psySpawned] at @s run forceload add ~ ~

execute as @e[tag=psyPlayer] run tag @s remove psyPlayer
execute as @e[tag=psySpawned] run tag @s remove psySpawned
