# The main function if the game is running #

#Effects applied to respective players
effect give @a[tag=dtIt] minecraft:strength 1 100 true
effect give @a[tag=!dtIt] minecraft:glowing 1 0 true

#Puts all players with dt_death = 1 or more into spectator and resets their deaths if not dtIt
execute as @a[tag=!dtIt] if score @s dt_death matches 1.. run gamemode spectator @s
execute as @a[tag=!dtIt] if score @s dt_death matches 1.. run scoreboard players set @s dt_death 0

#Stops the game if there are no more players without dtIt left; winner messages

#Stops the game if %timer is at 0; winner messages

#Decreases %timer by 1 (if >= 0)
scoreboard players remove %timer death_tag 1