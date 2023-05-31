#Summons psychosis creatures
playsound minecraft:ambient.cave ambient @s ~ ~ ~ 1 1.3 1
playsound minecraft:ambient.soul_sand_valley.mood ambient @s ~ ~ ~ 1 0 1
summon area_effect_cloud ~ ~-4 ~ {Tags:["psyMarker"]}

function psychosis:scripts/spread_far

execute as @e[tag=psyMarker] at @s run summon skeleton ~ ~ ~ {Silent:1b,Invulnerable:1b,DeathLootTable:"minecraft:empty",NoAI:1b,Tags:["psyCreature","psySpawned"],CanPickUpLoot:0b,PersistenceRequired:1b,HandDropChances:[0.000F,0.000F],ArmorDropChances:[0.000F,0.000F,0.000F,0.000F]}
execute as @e[tag=psyMarker] at @s run particle minecraft:smoke ~ ~0.8 ~ 0.2 0.8 0.2 0.01 20 normal
execute as @e[tag=psyMarker] at @s run playsound minecraft:entity.blaze.shoot ambient @a ~ ~ ~ 0.4 1
kill @e[tag=psyMarker]

#Additions based on psy_level


execute as @e[tag=psySpawned] at @s run forceload add ~ ~ ~ ~
scoreboard players operation @e[tag=psySpawned] psy_id = @s psy_id

execute as @e[tag=psySpawned] run tag @s remove psySpawned
tag @s add psychosis
