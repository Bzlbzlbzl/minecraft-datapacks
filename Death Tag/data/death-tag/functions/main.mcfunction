# # # Death Tag Datapack - Bzlbzlbzl # # #

#Runs function death-tag:scripts/game_main if the game is running (I do this so I don't have to check before every line of code)
execute if score %timer death_tag matches 0.. run function death-tag:scripts/game_main

#Changes %time to the specified amount when a player triggers the dtTimer scoreboard
execute as @a[scores={dtTimer=1..},limit=1] run tellraw @a ["",{"selector":"@s","color":"green","bold":true},{"text":" changed the timer to ","color":"gray"},{"score":{"name":"@s","objective":"dtTimer"},"color":"gold","bold":true},{"text":" minute(s)!","color":"gray"}]
execute as @a[scores={dtTimer=1..},limit=1] run scoreboard players operation @s dtTimer *= %ticksPerMin death_tag
execute as @a[scores={dtTimer=1..},limit=1] run scoreboard players operation %time death_tag = @s dtTimer

#Enables the dtTimer trigger for anyone who just joined or set score to negative or triggered the command (DISABLED WHEN %timelock is 1)
execute unless score %timelock death_tag matches 1 as @a unless score @s dtTimer matches 0 run scoreboard players enable @a dtTimer
execute unless score %timelock death_tag matches 1 as @a unless score @s dtTimer matches 0 run scoreboard players set @a dtTimer 0

