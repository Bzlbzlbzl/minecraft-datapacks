#A fun little jumpscare hehe for the very end (jump boost removed because 1. Glitch that LAUNCHES player when damaged and 2. Jumpscare not that long anyways)
#effect give @s minecraft:jump_boost 1 128 true
effect give @s minecraft:slowness 1 100 true
effect give @s minecraft:blindness 2 0 true
effect give @s minecraft:resistance 1 4 true
effect give @s minecraft:wither 1 2 true

execute at @s run tp @s ~ ~ ~ 0 0
execute at @s anchored eyes run summon wither_skull ^ ^-0.2 ^1 {Silent:1b,Glowing:1b,life:10,Tags:["psySpawned","psyScare"]}

execute at @s run playsound minecraft:entity.elder_guardian.curse ambient @s ~ ~ ~ 1 1.2 1
execute at @s run playsound minecraft:entity.wither.ambient ambient @s ~ ~ ~ 1 1.5 1

#Velocity cancel and tps
execute at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Age: -2147483648, Duration: -1, WaitTime: -2147483648, Tags:["psySpawned","psyScare"]}
tp @s @e[tag=psyTp,limit=1,sort=nearest]
execute at @e[type=area_effect_cloud,tag=psySpawned,limit=1] run scoreboard players operation @e[type=area_effect_cloud,tag=psySpawned,limit=1,sort=nearest] psy_id = @s psy_id

scoreboard players set @e[tag=psySpawned] psychosis 15
execute as @e[tag=psySpawned] at @s run forceload add ~ ~ ~ ~

execute as @e[tag=psySpawned] run tag @s remove psySpawned
