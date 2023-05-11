# Creates a simple vector at current position
summon block_display ~ ~ ~ {Tags:["vsvVectorTip","vsvSpawned"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.0f,0.0f,0.0f],scale:[0.0f,0.0f,0.0f]},block_state:{Name:"minecraft:orange_concrete"}}
execute as @e[tag=vsvVectorTip,tag=vsvSpawned] at @s run tp @s ~ ~ ~ facing entity @e[type=armor_stand,tag=vsvOrigin,limit=1] feet
execute as @e[tag=vsvVectorTip,tag=vsvSpawned] run function vsv:scripts/vector/assign_next_id
execute as @e[tag=vsvVectorTip,tag=vsvSpawned] run scoreboard players set @s values 5

execute as @e[type=armor_stand,tag=vsvOrigin,limit=1] at @s run summon block_display ~ ~ ~ {Tags:["vsvVectorTail","vsvSpawned"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.1f,-0.1f,-0.1f],scale:[0.2f,0.2f,0.2f]},block_state:{Name:"minecraft:orange_concrete"}}
execute as @e[tag=vsvVectorTail,tag=vsvSpawned] at @s anchored eyes run tp @s ~ ~ ~ facing entity @e[tag=vsvVectorTip,tag=vsvSpawned,limit=1] feet
execute as @e[tag=vsvVectorTail,tag=vsvSpawned] run scoreboard players operation @s vsv_id = @e[tag=vsvVectorTip,tag=vsvSpawned,limit=1] vsv_id
execute as @e[tag=vsvVectorTail,tag=vsvSpawned] run scoreboard players set @s values 11

execute as @e[tag=vsvVectorTip,tag=vsvSpawned] run function vsv:scripts/vector/calculate_values

execute as @e[type=block_display,tag=vsvSpawned] run tag @s remove vsvSpawned
