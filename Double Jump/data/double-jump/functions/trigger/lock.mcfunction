#Locks all players from toggling double_jump (resets score and sets %lock to 1)
scoreboard players reset * double_jump
scoreboard players set %lock double_jump 1
tellraw @a {"text":"Toggling has been locked!","color":"red"}