#Unlocks all players from toggling throw (sets %lock back to 0)
scoreboard players set %lock throw_main 0
tellraw @a {"text":"Toggling has been unlocked!","color":"green"}