#Locks all players from toggling jump (since I'm resetting jump, %jump gets messed up so I'm using %temp in fallDistance to store it temporarily)
scoreboard players operation %temp fallDistance = %jump jump
scoreboard players reset * jump
scoreboard players operation %jump jump = %temp fallDistance 