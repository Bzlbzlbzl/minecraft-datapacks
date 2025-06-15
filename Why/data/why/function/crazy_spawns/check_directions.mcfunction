# Run by air force instructor to check in 4 directions to see if can spawn pilot zombie
scoreboard players set %blocked crazy_spawns 0
scoreboard players set %forward crazy_spawns 28
execute at @s anchored eyes facing ~12 ~7 ~ run function why:crazy_spawns/check_forward
execute unless score %blocked crazy_spawns matches 1 run tag @s add crazy+X

scoreboard players set %blocked crazy_spawns 0
scoreboard players set %forward crazy_spawns 28
execute at @s anchored eyes facing ~-12 ~7 ~ run function why:crazy_spawns/check_forward
execute unless score %blocked crazy_spawns matches 1 run tag @s add crazy-X

scoreboard players set %blocked crazy_spawns 0
scoreboard players set %forward crazy_spawns 28
execute at @s anchored eyes facing ~ ~7 ~12 run function why:crazy_spawns/check_forward
execute unless score %blocked crazy_spawns matches 1 run tag @s add crazy+Z

scoreboard players set %blocked crazy_spawns 0
scoreboard players set %forward crazy_spawns 28
execute at @s anchored eyes facing ~ ~7 ~-12 run function why:crazy_spawns/check_forward
execute unless score %blocked crazy_spawns matches 1 run tag @s add crazy-Z