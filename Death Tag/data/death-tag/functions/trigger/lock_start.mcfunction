#Locks all players from toggling dtStart (resets score and sets %startlock to 1)
scoreboard players reset * dtStart
scoreboard players set %startlock death_tag 1
tellraw @a {"text":"Starting the game has been disabled!","color":"red"}