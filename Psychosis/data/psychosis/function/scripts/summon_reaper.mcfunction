#Summons the wither skeleton RUN BY PLAYER. Uses psyMarker because of spawning spreadplayers interpolation which is annoying
tag @s add psyPlayer
tag @s add psyHaunted

summon area_effect_cloud ~ ~4 ~ {Tags:["psyMarker"]}
execute as @e[tag=psyMarker,limit=1] at @s if dimension the_nether run spreadplayers ~ ~ 0 1 under 119 false @s
execute as @e[tag=psyMarker,limit=1] at @s unless dimension the_nether run spreadplayers ~ ~ 0 1 false @s

execute as @e[tag=psyMarker] run function psychosis:scripts/tp_down_single
execute as @e[tag=psyMarker] at @s if block ~ ~-1 ~ #psychosis:half_block_down run tp @s ~ ~-0.5 ~
execute as @e[tag=psyMarker] at @s if block ~ ~-1 ~ #psychosis:two_block_down run tp @s ~ ~-2 ~

execute at @e[tag=psyMarker,limit=1] run summon wither_skeleton ~ ~ ~ {Silent:1b,DeathLootTable:"minecraft:empty",Invulnerable:1b,PersistenceRequired:1b,NoAI:1b,CanPickUpLoot:0b,Tags:["psyCreature","psySpawned"],HandItems:[{id:"minecraft:netherite_hoe",count:1,components:{"minecraft:unbreakable":{},"minecraft:enchantments":{levels:{"minecraft:sharpness":10}}}},{}],HandDropChances:[0.000F,0.085F],ArmorItems:[{},{},{id:"minecraft:leather_chestplate",count:1,components:{"minecraft:unbreakable":{},"minecraft:dyed_color":0}},{id:"minecraft:leather_helmet",count:1,components:{"minecraft:unbreakable":{},"minecraft:dyed_color":0}}],ArmorDropChances:[0.085F,0.085F,0.000F,0.000F]}
kill @e[tag=psyMarker]

scoreboard players operation @e[tag=psySpawned,tag=psyCreature,type=wither_skeleton,limit=1] psy_id = @s psy_id

execute as @e[type=wither_skeleton,tag=psySpawned] at @s run tp @s ~ ~ ~ facing entity @p[tag=psyPlayer]
#execute as @e[type=wither_skeleton,tag=psySpawned] at @s run playsound minecraft:entity.blaze.shoot ambient @a ~ ~ ~ 0.1 1
execute as @e[type=wither_skeleton,tag=psySpawned] at @s run particle minecraft:smoke ~ ~0.8 ~ 0.2 0.8 0.2 0.01 30 normal
execute as @e[type=wither_skeleton,tag=psySpawned] run scoreboard players set @s psy_sound 160

execute as @e[type=wither_skeleton,tag=psySpawned] at @s run forceload add ~ ~

execute as @e[tag=psyPlayer] run tag @s remove psyPlayer
execute as @e[tag=psySpawned] run tag @s remove psySpawned
