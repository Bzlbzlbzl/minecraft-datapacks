# Random uniform picking %enchantment 1-3
scoreboard players set %enchantment crazy_spawns 0
execute if predicate why:1-3_chance run scoreboard players set %enchantment crazy_spawns 1
execute unless score %enchantment crazy_spawns matches 1.. if predicate why:50_chance run scoreboard players set %enchantment crazy_spawns 2
execute unless score %enchantment crazy_spawns matches 1.. run scoreboard players set %enchantment crazy_spawns 3

scoreboard players set %ench_lvl crazy_spawns 1
execute if predicate why:50_chance run scoreboard players set %ench_lvl crazy_spawns 2