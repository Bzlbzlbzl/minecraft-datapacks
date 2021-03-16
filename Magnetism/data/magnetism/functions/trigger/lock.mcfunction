#Locks all players from toggling magnetism (resets score and sets %lock to 1)
scoreboard players reset * magnetism
scoreboard players set %lock magnetism_dist 1
tellraw @a {"text":"Toggling has been locked!","color":"red"}