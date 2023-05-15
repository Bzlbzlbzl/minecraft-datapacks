# Creates a simple vector at current position (run by players or vsvOrigin)
summon block_display ~ ~ ~ {Tags:["vsvVector","vsvSpawned"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.0f,0.0f,0.0f],scale:[0.0f,0.0f,0.0f]},block_state:{Name:"minecraft:orange_concrete"}}
execute as @e[tag=vsvVector,tag=vsvSpawned] at @s run tp @s ~ ~ ~ facing entity @e[type=armor_stand,tag=vsvOrigin,limit=1] feet
execute as @e[tag=vsvVector,tag=vsvSpawned] run scoreboard players set @s values 5

execute as @e[tag=vsvVector,tag=vsvSpawned] run function vsv:scripts/vector/calculate_values
#Set vector size to player input
execute if entity @s[type=player] run scoreboard players operation %vector_size values = @s vector

execute as @e[tag=vsvVector,tag=vsvSpawned] run tag @s remove vsvSpawned
