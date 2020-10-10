#Recursively runs until all players in survival have been assigned their own ID
scoreboard players add %next death_swap 1
scoreboard players operation @s death_swap = %next death_swap
execute as @r[gamemode=survival,scores={death_swap=-1}] run function death-swap:reset