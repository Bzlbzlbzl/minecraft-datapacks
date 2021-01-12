# Ends the game (this should only be called from main function)

#Clearing inventory and effects; killing all traps and fireballs
clear @a[tag=inGame]
effect clear @a[tag=inGame]
kill @e[tag=archerTrap]
kill @e[tag=pyroFireball]

#Teleporting players back to spawn
spreadplayers 0.5 -28.5 0 4 false @a[tag=inGame]

#Untagging all players
tag @a[tag=inGame] remove inGame

#Setting %game to false
scoreboard players set %game wins 0
