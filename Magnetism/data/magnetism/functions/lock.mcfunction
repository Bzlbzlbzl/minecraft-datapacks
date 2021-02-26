#Locks all players from toggling magnetism (since I'm resetting magnetism, %magnetism gets messed up so I'm using %temp in magnetism_dist to store it temporarily)
scoreboard players operation %temp magnetism_dist = %magnetism magnetism
scoreboard players reset * magnetism
scoreboard players operation %magnetism magnetism = %temp magnetism_dist