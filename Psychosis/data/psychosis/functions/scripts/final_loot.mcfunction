#Generates the final loot (which is same as others) and passes on the "score decreasing" to the player via psychosis to 72123. THIS IS RUN BY psyDying SKELE
summon item ~ ~ ~ {Glowing:1b,Motion:[0.0,0.5,0.0],Tags:["psyItem","psyMore"],Item:{id:"minecraft:phantom_membrane",Count:1b}}
summon item ~ ~ ~ {Glowing:1b,Motion:[0.0,0.5,0.0],Tags:["psyItem"],Item:{id:"minecraft:phantom_membrane",Count:1b}}
execute as @e[tag=psyItem,sort=random,limit=1] if entity @s[tag=psyMore] run summon item ~ ~ ~ {Glowing:1b,Motion:[0.0,0.5,0.0],Tags:["psyItem"],Item:{id:"minecraft:phantom_membrane",Count:1b}}
execute as @e[tag=psyItem,sort=random,limit=1] if entity @s[tag=psyMore] run summon item ~ ~ ~ {Glowing:1b,Motion:[0.0,0.5,0.0],Tags:["psyItem"],Item:{id:"minecraft:phantom_membrane",Count:1b}}
execute as @e[tag=psyItem,sort=random,limit=1] if entity @s[tag=psyMore] run summon item ~ ~ ~ {Glowing:1b,Motion:[0.0,0.5,0.0],Tags:["psyItem"],Item:{id:"minecraft:phantom_membrane",Count:1b}}

execute at @s as @a[scores={psychosis=72003}] if score @s psy_id = @e[tag=psyDying,scores={psychosis=808},limit=1,sort=nearest] psy_id run scoreboard players set @s psychosis 72123

execute at @s as @e[tag=psyScythe] if score @s psy_id = @e[tag=psyDying,scores={psychosis=808},limit=1,sort=nearest] psy_id run kill @s
function psychosis:scripts/kill_creature

execute as @e[tag=psyItem] run tag @s remove psyItem
execute as @e[tag=psyMore] run tag @s remove psyMore
