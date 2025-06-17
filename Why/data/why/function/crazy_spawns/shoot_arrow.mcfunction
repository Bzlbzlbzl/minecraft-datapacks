# Shoot arrow, run by skeleton (will be run multiple times)
# Doing this tp thing because for some reason doing tp on arrow messes with Y velocity (its a glitch?)
tp @s ~ ~1.62 ~

execute store result score %x crazy_spawns run data get entity @s Pos[0] 1000
execute store result score %y crazy_spawns run data get entity @s Pos[1] 1000
execute store result score %z crazy_spawns run data get entity @s Pos[2] 1000

tp @s ~ ~ ~

execute if entity @s[type=!stray,type=!bogged] positioned ~ ~1.62 ~ run summon arrow ^ ^ ^0.1 {damage:3.5d,shake:1b,Tags:["csSpawned","csArrow"]}
execute if entity @s[type=stray] positioned ~ ~1.62 ~ run summon arrow ^ ^ ^0.1 {damage:3.5d,shake:1b,Tags:["csSpawned","csArrow"],item:{id:"minecraft:potion",count:1,components:{"minecraft:potion_contents":{potion:"minecraft:long_slowness"}}}}
execute if entity @s[type=bogged] positioned ~ ~1.62 ~ run summon arrow ^ ^ ^0.1 {damage:3.5d,shake:1b,Tags:["csSpawned","csArrow"],item:{id:"minecraft:potion",count:1,components:{"minecraft:potion_contents":{potion:"minecraft:long_poison"}}}}

execute store result score %dx crazy_spawns run data get entity @e[tag=csSpawned,limit=1,type=arrow] Pos[0] 1000
execute store result score %dy crazy_spawns run data get entity @e[tag=csSpawned,limit=1,type=arrow] Pos[1] 1000
execute store result score %dz crazy_spawns run data get entity @e[tag=csSpawned,limit=1,type=arrow] Pos[2] 1000

execute store result entity @e[tag=csSpawned,limit=1,type=arrow] Motion[0] double 0.03 run scoreboard players operation %dx crazy_spawns -= %x crazy_spawns
execute store result entity @e[tag=csSpawned,limit=1,type=arrow] Motion[1] double 0.03 run scoreboard players operation %dy crazy_spawns -= %y crazy_spawns
execute store result entity @e[tag=csSpawned,limit=1,type=arrow] Motion[2] double 0.03 run scoreboard players operation %dz crazy_spawns -= %z crazy_spawns

data modify entity @e[tag=csSpawned,limit=1,type=arrow] Owner set from entity @s UUID

tag @e[tag=csSpawned,limit=1,type=arrow] remove csSpawned
