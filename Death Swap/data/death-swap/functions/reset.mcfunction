#Recursively runs until all players in survival have been assigned their own ID
scoreboard players operation @s death_swap = %next death_swap
scoreboard players add %next death_swap 1
execute as @r[gamemode=survival,scores={death_swap=-1}] run function death_swap:reset