#Summons psychosis creatures
playsound minecraft:ambient.cave ambient @s ~ ~ ~ 1 1.3 1
summon skeleton ~5 ~10 ~5 {Silent:1b,Invulnerable:1b,DeathLootTable:"minecraft:empty",NoAI:1b,Tags:["psyCreature","psySpawned"],ActiveEffects:[{Id:14,Amplifier:0b,Duration:20,ShowParticles:0b}]}

function psychosis:scripts/spread_far

execute as @e[tag=psySpawned] at @s run particle minecraft:smoke ~ ~0.8 ~ 0.2 0.8 0.2 0.01 20 normal

#Additions based on psy_level


execute as @e[tag=psySpawned] at @s run forceload add ~ ~ ~ ~
scoreboard players operation @e[tag=psySpawned] psy_id = @s psy_id

tag @s add psychosis
