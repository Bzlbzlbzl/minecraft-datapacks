#Locks all players from toggling explosive_drop (since I'm resetting explosive_drop, %explosive gets messed up so I'm using %temp in ed_temp to store it temporarily)
scoreboard players operation %temp ed_temp = %explosive explosive_drop
scoreboard players reset * explosive_drop
scoreboard players operation %explosive explosive_drop = %temp ed_temp
tellraw @a {"text":"Toggling has been locked!","color":"red"}