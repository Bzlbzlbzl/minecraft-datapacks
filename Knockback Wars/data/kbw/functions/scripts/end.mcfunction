# Ends the game (this should only be called from main function)

#Clearing inventory and effects; killing all traps and fireballs and scythes, clearing all builder blocks
clear @a[tag=inGame]
effect clear @a[tag=inGame]
kill @e[tag=archerTrap]
kill @e[tag=pyroFireball]
kill @e[tag=reapScythe]
fill 20 64 -20 -20 73 20 minecraft:air replace minecraft:tube_coral_block
fill 20 64 -20 -20 73 20 minecraft:air replace minecraft:dead_tube_coral_block

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
