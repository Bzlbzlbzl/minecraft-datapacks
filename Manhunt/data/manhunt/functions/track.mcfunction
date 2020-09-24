#Makes particles towards the tracked player recursively until is 2.8 blocks away from player
particle minecraft:dust 1 0 0 1.5 ^ ^ ^ 0 0 0 10 1 normal @s
execute positioned ^ ^ ^0.4 if entity @s[distance=..2.8] run function manhunt:track