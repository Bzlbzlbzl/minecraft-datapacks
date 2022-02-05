#Unlocks all players from toggling double_jump (sets %lock back to 0)
scoreboard players set %lock double_jump 0
tellraw @a {"text":"Toggling has been unlocked!","color":"green"}