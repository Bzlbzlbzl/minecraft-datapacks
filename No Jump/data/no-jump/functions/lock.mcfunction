#Locks all players from toggling jump (resets score and sets %lock to 1)
scoreboard players reset * jump
scoreboard players set %lock nj_fallDistance 1
tellraw @a {"text":"Toggling has been locked!","color":"red"}