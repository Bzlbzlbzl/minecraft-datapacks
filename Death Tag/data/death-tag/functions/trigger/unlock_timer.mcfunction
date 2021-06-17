#Unlocks all players from toggling dtTimer (sets %timelock back to 0)
scoreboard players set %timelock death_tag 0
tellraw @a {"text":"Changing the timer has been enabled!","color":"green"}