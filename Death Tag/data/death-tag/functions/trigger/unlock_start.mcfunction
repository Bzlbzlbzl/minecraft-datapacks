#Unlocks all players from toggling dtStart (sets %startlock back to 0)
scoreboard players set %startlock death_tag 0
tellraw @a {"text":"Starting the game has been enabled!","color":"green"}