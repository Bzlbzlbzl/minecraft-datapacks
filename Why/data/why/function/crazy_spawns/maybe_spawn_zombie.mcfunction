# This simple one-liner makes sure multiple spawns on the same tick don't happen
execute if score %time crazy_spawns matches 12600..23400 if score %zombies crazy_spawns matches 0 if predicate why:10_chance run function why:crazy_spawns/spawn_zombie
tag @s add csProcessed
