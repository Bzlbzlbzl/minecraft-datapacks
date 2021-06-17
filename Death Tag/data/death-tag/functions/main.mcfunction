# # # Death Tag Datapack - Bzlbzlbzl # # #

#Runs function death-tag:scripts/game_main if the game is running (I do this so I don't have to check before every line of code)
execute if score %timer death_tag matches 0.. run function death-tag:scripts/game_main

#Changes %time to the specified amount when a player triggers the dtTimer scoreboard
execute as @a[scores={dtTimer=1..},limit=1] run tellraw @a ["",{"selector":"@s","color":"white","bold":true},{"text":" changed the timer to ","color":"gray"},{"score":{"name":"@s","objective":"dtTimer"},"color":"gold","bold":true},{"text":" minute(s)!","color":"gray"}]
execute as @a[scores={dtTimer=1..},limit=1] run scoreboard players operation @s dtTimer *= %ticksPerMin death_tag
execute as @a[scores={dtTimer=1..},limit=1] run scoreboard players operation %time death_tag = @s dtTimer

#Enables the dtTimer trigger for anyone who just joined or set score to negative or triggered the command (DISABLED WHEN %timelock is 1)
execute unless score %timelock death_tag matches 1 as @a unless score @s dtTimer matches 0 run scoreboard players enable @a dtTimer
execute unless score %timelock death_tag matches 1 as @a unless score @s dtTimer matches 0 run scoreboard players set @a dtTimer 0

#Starts the game to the specified gamemode when a player triggers the dtStart scoreboard
execute as @a[scores={dtStart=1},limit=1] run tellraw @a ["",{"selector":"@s","color":"white","bold":true},{"text":" started death tag!","color":"gold"}]
execute as @a[scores={dtStart=1},limit=1] run scoreboard players set %game death_tag 1
execute as @a[scores={dtStart=1},limit=1] run scoreboard players set %starting death_tag 60

execute as @a[scores={dtStart=2},limit=1] run tellraw @a ["",{"selector":"@s","color":"white","bold":true},{"text":" started death tag survivor!","color":"gold"}]
execute as @a[scores={dtStart=2},limit=1] run scoreboard players set %game death_tag 2
execute as @a[scores={dtStart=2},limit=1] run scoreboard players set %starting death_tag 60

#Enables the dtStart trigger for anyone who just joined or set score to negative or triggered the command (DISABLED WHEN %startlock is 1)
execute unless score %startlock death_tag matches 1 as @a unless score @s dtStart matches 0 run scoreboard players enable @a dtStart
execute unless score %startlock death_tag matches 1 as @a unless score @s dtStart matches 0 run scoreboard players set @a dtStart 0

#Countdown for game start, and click command for set_it
execute if score %starting death_tag matches 60 run tellraw @a ["",{"text":"Starting in ","color":"gold"},{"text":"3","bold":true,"color":"red"},{"text":"... ","color":"red"},{"text":"[","color":"dark_aqua","clickEvent":{"action":"run_command","value":"/function death-tag:scripts/set_it"}},{"text":"Click Here","bold":true,"color":"aqua","clickEvent":{"action":"run_command","value":"/function death-tag:scripts/set_it"}},{"text":"]","bold":true,"color":"dark_aqua","clickEvent":{"action":"run_command","value":"/function death-tag:scripts/set_it"}},{"text":" to be a tagger!","color":"gold"}]
execute if score %starting death_tag matches 40 run tellraw @a ["",{"text":"Starting in ","color":"gold"},{"text":"2","bold":true,"color":"red"},{"text":"... ","color":"red"},{"text":"[","color":"dark_aqua","clickEvent":{"action":"run_command","value":"/function death-tag:scripts/set_it"}},{"text":"Click Here","bold":true,"color":"aqua","clickEvent":{"action":"run_command","value":"/function death-tag:scripts/set_it"}},{"text":"]","bold":true,"color":"dark_aqua","clickEvent":{"action":"run_command","value":"/function death-tag:scripts/set_it"}},{"text":" to be a tagger!","color":"gold"}]
execute if score %starting death_tag matches 20 run tellraw @a ["",{"text":"Starting in ","color":"gold"},{"text":"1","bold":true,"color":"red"},{"text":"... ","color":"red"},{"text":"[","color":"dark_aqua","clickEvent":{"action":"run_command","value":"/function death-tag:scripts/set_it"}},{"text":"Click Here","bold":true,"color":"aqua","clickEvent":{"action":"run_command","value":"/function death-tag:scripts/set_it"}},{"text":"]","bold":true,"color":"dark_aqua","clickEvent":{"action":"run_command","value":"/function death-tag:scripts/set_it"}},{"text":" to be a tagger!","color":"gold"}]
execute if score %starting death_tag matches 1 if score %game death_tag matches 1 run tellraw @a ["",{"text":"Starting... ","color":"gold"},{"text":"Death Tag!","bold":true,"color":"red"}]
execute if score %starting death_tag matches 1 if score %game death_tag matches 1 run function death-tag:scripts/start
execute if score %starting death_tag matches 1 if score %game death_tag matches 2 run tellraw @a ["",{"text":"Starting... ","color":"gold"},{"text":"Death Tag Survivor!","bold":true,"color":"gray"}]
execute if score %starting death_tag matches 1 if score %game death_tag matches 2 run function death-tag:scripts/survivor_start
execute if score %starting death_tag matches 1.. run scoreboard players remove %starting death_tag 1

