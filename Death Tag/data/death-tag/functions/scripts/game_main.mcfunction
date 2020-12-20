# The main function if the game is running #

#Effects applied to respective players
effect give @a[tag=dtIt] minecraft:strength 1 100 true
effect give @a[tag=!dtIt] minecraft:glowing 1 0 true

#Updates bossbar value
execute store result bossbar minecraft:dt_timer value run scoreboard players get %timer death_tag

#Puts all players with dt_death = 1 or more into spectator and resets their deaths if not dtIt
execute as @a[tag=!dtIt] if score @s dt_death matches 1.. run gamemode spectator @s
execute as @a[tag=!dtIt] if score @s dt_death matches 1.. run scoreboard players set @s dt_death 0

#Stops the game if there are no more players without dtIt left (in survival); winner messages
execute unless entity @a[tag=!dtIt,gamemode=survival] as @a[tag=dtIt] run tellraw @a {"text":"","color":"red","bold":true,"extra":[{"selector":"@s"},{"text":" has won the game!"}]}
execute unless entity @a[tag=!dtIt,gamemode=survival] run function death-tag:scripts/stop

#Stops the game if %timer is at 0; winner messages
execute if score %timer death_tag matches 0 as @a[tag=!dtIt,gamemode=survival] run tellraw @a {"text":"","color":"gold","bold":true,"extra":[{"selector":"@s"},{"text":" has won the game!"}]}
execute if score %timer death_tag matches 0 run function death-tag:scripts/stop

#Decreases %timer by 1 (if >= 0)
scoreboard players remove %timer death_tag 1