#Makes particles towards the tracked player by 0.4 blocks recursively until is 3 blocks away from player
particle minecraft:dust 1 0 0 1.5 ^ ^ ^ 0 0 0 10 1 normal @s
execute positioned ^ ^ ^0.4 if entity @s[distance=..3] run function manhunt-2.0:scripts/point