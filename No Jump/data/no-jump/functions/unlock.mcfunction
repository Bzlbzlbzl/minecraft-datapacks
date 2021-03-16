#Unlocks all players from toggling jump (sets %lock back to 0)
scoreboard players set %lock nj_fallDistance 0
tellraw @a {"text":"Toggling has been unlocked!","color":"green"}