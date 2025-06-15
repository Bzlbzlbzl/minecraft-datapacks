# Random uniform picking %zomb_type 1-3
scoreboard players set %zomb_type crazy_spawns 0
execute if predicate why:1-3_chance run scoreboard players set %zomb_type crazy_spawns 1
execute unless score %zomb_type crazy_spawns matches 1.. if predicate why:50_chance run scoreboard players set %zomb_type crazy_spawns 2
execute unless score %zomb_type crazy_spawns matches 1.. run scoreboard players set %zomb_type crazy_spawns 3
