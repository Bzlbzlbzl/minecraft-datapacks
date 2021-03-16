#Unlocks all players from toggling explosive_drop (sets %lock back to 0)
scoreboard players set %lock ed_main 0
tellraw @a {"text":"Toggling has been unlocked!","color":"green"}