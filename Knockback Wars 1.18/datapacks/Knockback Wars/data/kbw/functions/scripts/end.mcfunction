# Ends the game (this should only be called from main function)

#Clearing inventory and effects; killing all traps and fireballs and scythes
clear @a[tag=inGame]
effect clear @a[tag=inGame]
kill @e[tag=archerTrap]
kill @e[tag=pyroFireball]
kill @e[tag=reapScythe]

#Teleporting players back to spawn
spreadplayers 0.5 -28.5 0 4 false @a[tag=inGame]

#Untagging all players; score reset (just for safety)
tag @a[tag=inGame] remove inGame
tag @a[tag=noScythe] remove noScythe
scoreboard players reset * score
scoreboard players reset * pyroFlail
scoreboard players reset * reap
scoreboard players reset * calculation

#Setting %game to false
scoreboard players set %game wins 0
