# This simple one-liner makes sure multiple spawns on the same tick don't happen
execute if score %skeletons crazy_spawns matches 0 if predicate why:10_chance run function why:crazy_spawns/spawn_skeleton
tag @s add csProcessed
