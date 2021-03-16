#Locks all players from toggling explosive_drop (resets score and sets %lock to 1)
scoreboard players reset * explosive_drop
scoreboard players set %lock ed_main 1
tellraw @a {"text":"Toggling has been locked!","color":"red"}