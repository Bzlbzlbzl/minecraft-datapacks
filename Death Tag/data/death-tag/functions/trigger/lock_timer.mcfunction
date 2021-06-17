#Locks all players from toggling dtTimer (resets score and sets %timelock to 1)
scoreboard players reset * dtTimer
scoreboard players set %timelock death_tag 1
tellraw @a {"text":"Changing the timer has been disabled!","color":"red"}