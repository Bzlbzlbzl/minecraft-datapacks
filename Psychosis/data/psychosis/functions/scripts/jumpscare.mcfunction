#A fun little jumpscare hehe for the very end
effect give @s minecraft:jump_boost 1 128 true
effect give @s minecraft:slowness 1 100 true
effect give @s minecraft:blindness 2 0 true

execute at @s run tp @s ~ ~ ~ 0 0
execute at @s anchored eyes run summon wither_skull ^ ^-0.2 ^1 {Silent:1b,Glowing:1b,life:5,Tags:["psySpawned","psyScare"]}

execute at @s run playsound minecraft:entity.elder_guardian.curse ambient @s ~ ~ ~ 1 1.2 1
execute at @s run playsound minecraft:entity.wither.ambient ambient @s ~ ~ ~ 1 1.5 1

scoreboard players set @e[type=wither_skull,tag=psySpawned] psychosis 5

execute as @e[tag=psySpawned] run tag @s remove psySpawned