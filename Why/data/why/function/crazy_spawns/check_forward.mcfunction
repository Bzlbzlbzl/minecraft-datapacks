# Recursive function to look forward 14 blocks, increment of 0.5. 
# Assumes %forward has been already set to 28, and %blocked had reset to 0 before running
execute unless block ^ ^ ^ #minecraft:air run scoreboard players set %blocked crazy_spawns 1
scoreboard players remove %forward crazy_spawns 1
execute if score %forward crazy_spawns matches 1.. unless score %blocked crazy_spawns matches 1 positioned ^ ^ ^0.5 run function why:crazy_spawns/check_forward
