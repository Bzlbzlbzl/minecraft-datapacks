# Summon scythe and positioning and stuff. Run by psyDying. 
tag @s add psySkele

execute at @s as @e[tag=psyReaper] if score @s psy_id = @e[tag=psySkele,limit=1] psy_id facing entity @s feet rotated ~30 0 positioned ^ ^ ^6 run summon armor_stand ~ ~ ~ {Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,PersistenceRequired:1b,Tags:["psyScythe","psySpawned"],Pose:{RightArm:[-90f,0f,0f]},HandItems:[{id:"minecraft:netherite_hoe",Count:1b,tag:{Enchantments:[{}]}},{}]}
execute as @e[tag=psySpawned] at @s run tp @s ~ ~ ~ facing entity @e[tag=psySkele,limit=1] feet
execute as @e[tag=psySpawned] at @s run tp @s ^0.35 ^ ^

#Calculate values for move_scythe


#psychosis score will be incrment for psyScythe
execute as @e[tag=psySpawned] run scoreboard players set @s psychosis -30

execute as @e[tag=psySpawned] at @s run tag @s remove psySpawned
execute as @e[tag=psySkele] at @s run tag @s remove psySkele