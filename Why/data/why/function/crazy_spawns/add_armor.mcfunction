# Recursive adds armor until armor matches 2 or more
execute if predicate why:50_chance if score %helmet crazy_spawns matches 0 run scoreboard players set %helmet crazy_spawns 2
execute if predicate why:50_chance if score %chestplate crazy_spawns matches 0 run scoreboard players set %chestplate crazy_spawns 2
execute if predicate why:50_chance if score %leggings crazy_spawns matches 0 run scoreboard players set %leggings crazy_spawns 2
execute if predicate why:50_chance if score %boots crazy_spawns matches 0 run scoreboard players set %boots crazy_spawns 2

execute if score %helmet crazy_spawns matches 2 run scoreboard players add %armors crazy_spawns 1
execute if score %chestplate crazy_spawns matches 2 run scoreboard players add %armors crazy_spawns 1
execute if score %leggings crazy_spawns matches 2 run scoreboard players add %armors crazy_spawns 1
execute if score %boots crazy_spawns matches 2 run scoreboard players add %armors crazy_spawns 1

execute if score %helmet crazy_spawns matches 2 run data merge entity @s {equipment:{head:{id:"minecraft:leather_helmet",count:1,components:{"minecraft:enchantments":{"minecraft:mending":1,"minecraft:unbreaking":3}}}},drop_chances:{head:1.000}}
execute if score %chestplate crazy_spawns matches 2 run data merge entity @s {equipment:{chest:{id:"minecraft:leather_chestplate",count:1,components:{"minecraft:enchantments":{"minecraft:mending":1,"minecraft:unbreaking":3}}}},drop_chances:{chest:1.000}}
execute if score %leggings crazy_spawns matches 2 run data merge entity @s {equipment:{legs:{id:"minecraft:leather_leggings",count:1,components:{"minecraft:enchantments":{"minecraft:mending":1,"minecraft:unbreaking":3}}}},drop_chances:{legs:1.000}}
execute if score %boots crazy_spawns matches 2 run data merge entity @s {equipment:{feet:{id:"minecraft:leather_boots",count:1,components:{"minecraft:enchantments":{"minecraft:mending":1,"minecraft:unbreaking":3}}}},drop_chances:{feet:1.000}}

execute if score %helmet crazy_spawns matches 2 run function why:crazy_spawns/rand_ench
execute if score %helmet crazy_spawns matches 2 if score %enchantment crazy_spawns matches 1 if score %ench_lvl crazy_spawns matches 1 run data merge entity @s {equipment:{head:{id:"minecraft:leather_helmet",count:1,components:{"minecraft:enchantments":{"minecraft:blast_protection":1}}}}}
execute if score %helmet crazy_spawns matches 2 if score %enchantment crazy_spawns matches 1 if score %ench_lvl crazy_spawns matches 2 run data merge entity @s {equipment:{head:{id:"minecraft:leather_helmet",count:1,components:{"minecraft:enchantments":{"minecraft:blast_protection":2}}}}}
execute if score %helmet crazy_spawns matches 2 if score %enchantment crazy_spawns matches 2 if score %ench_lvl crazy_spawns matches 1 run data merge entity @s {equipment:{head:{id:"minecraft:leather_helmet",count:1,components:{"minecraft:enchantments":{"minecraft:fire_protection":1}}}}}
execute if score %helmet crazy_spawns matches 2 if score %enchantment crazy_spawns matches 2 if score %ench_lvl crazy_spawns matches 2 run data merge entity @s {equipment:{head:{id:"minecraft:leather_helmet",count:1,components:{"minecraft:enchantments":{"minecraft:fire_protection":2}}}}}
execute if score %helmet crazy_spawns matches 2 if score %enchantment crazy_spawns matches 3 if score %ench_lvl crazy_spawns matches 1 run data merge entity @s {equipment:{head:{id:"minecraft:leather_helmet",count:1,components:{"minecraft:enchantments":{"minecraft:projectile_protection":1}}}}}
execute if score %helmet crazy_spawns matches 2 if score %enchantment crazy_spawns matches 3 if score %ench_lvl crazy_spawns matches 2 run data merge entity @s {equipment:{head:{id:"minecraft:leather_helmet",count:1,components:{"minecraft:enchantments":{"minecraft:projectile_protection":2}}}}}

execute if score %chestplate crazy_spawns matches 2 run function why:crazy_spawns/rand_ench
execute if score %chestplate crazy_spawns matches 2 if score %enchantment crazy_spawns matches 1 if score %ench_lvl crazy_spawns matches 1 run data merge entity @s {equipment:{chest:{id:"minecraft:leather_chestplate",count:1,components:{"minecraft:enchantments":{"minecraft:blast_protection":1}}}}}
execute if score %chestplate crazy_spawns matches 2 if score %enchantment crazy_spawns matches 1 if score %ench_lvl crazy_spawns matches 2 run data merge entity @s {equipment:{chest:{id:"minecraft:leather_chestplate",count:1,components:{"minecraft:enchantments":{"minecraft:blast_protection":2}}}}}
execute if score %chestplate crazy_spawns matches 2 if score %enchantment crazy_spawns matches 2 if score %ench_lvl crazy_spawns matches 1 run data merge entity @s {equipment:{chest:{id:"minecraft:leather_chestplate",count:1,components:{"minecraft:enchantments":{"minecraft:fire_protection":1}}}}}
execute if score %chestplate crazy_spawns matches 2 if score %enchantment crazy_spawns matches 2 if score %ench_lvl crazy_spawns matches 2 run data merge entity @s {equipment:{chest:{id:"minecraft:leather_chestplate",count:1,components:{"minecraft:enchantments":{"minecraft:fire_protection":2}}}}}
execute if score %chestplate crazy_spawns matches 2 if score %enchantment crazy_spawns matches 3 if score %ench_lvl crazy_spawns matches 1 run data merge entity @s {equipment:{chest:{id:"minecraft:leather_chestplate",count:1,components:{"minecraft:enchantments":{"minecraft:projectile_protection":1}}}}}
execute if score %chestplate crazy_spawns matches 2 if score %enchantment crazy_spawns matches 3 if score %ench_lvl crazy_spawns matches 2 run data merge entity @s {equipment:{chest:{id:"minecraft:leather_chestplate",count:1,components:{"minecraft:enchantments":{"minecraft:projectile_protection":2}}}}}

execute if score %leggings crazy_spawns matches 2 run function why:crazy_spawns/rand_ench
execute if score %leggings crazy_spawns matches 2 if score %enchantment crazy_spawns matches 1 if score %ench_lvl crazy_spawns matches 1 run data merge entity @s {equipment:{legs:{id:"minecraft:leather_leggings",count:1,components:{"minecraft:enchantments":{"minecraft:blast_protection":1}}}}}
execute if score %leggings crazy_spawns matches 2 if score %enchantment crazy_spawns matches 1 if score %ench_lvl crazy_spawns matches 2 run data merge entity @s {equipment:{legs:{id:"minecraft:leather_leggings",count:1,components:{"minecraft:enchantments":{"minecraft:blast_protection":2}}}}}
execute if score %leggings crazy_spawns matches 2 if score %enchantment crazy_spawns matches 2 if score %ench_lvl crazy_spawns matches 1 run data merge entity @s {equipment:{legs:{id:"minecraft:leather_leggings",count:1,components:{"minecraft:enchantments":{"minecraft:fire_protection":1}}}}}
execute if score %leggings crazy_spawns matches 2 if score %enchantment crazy_spawns matches 2 if score %ench_lvl crazy_spawns matches 2 run data merge entity @s {equipment:{legs:{id:"minecraft:leather_leggings",count:1,components:{"minecraft:enchantments":{"minecraft:fire_protection":2}}}}}
execute if score %leggings crazy_spawns matches 2 if score %enchantment crazy_spawns matches 3 if score %ench_lvl crazy_spawns matches 1 run data merge entity @s {equipment:{legs:{id:"minecraft:leather_leggings",count:1,components:{"minecraft:enchantments":{"minecraft:projectile_protection":1}}}}}
execute if score %leggings crazy_spawns matches 2 if score %enchantment crazy_spawns matches 3 if score %ench_lvl crazy_spawns matches 2 run data merge entity @s {equipment:{legs:{id:"minecraft:leather_leggings",count:1,components:{"minecraft:enchantments":{"minecraft:projectile_protection":2}}}}}

execute if score %boots crazy_spawns matches 2 run function why:crazy_spawns/rand_ench
execute if score %boots crazy_spawns matches 2 if score %enchantment crazy_spawns matches 1 if score %ench_lvl crazy_spawns matches 1 run data merge entity @s {equipment:{feet:{id:"minecraft:leather_boots",count:1,components:{"minecraft:enchantments":{"minecraft:blast_protection":1}}}}}
execute if score %boots crazy_spawns matches 2 if score %enchantment crazy_spawns matches 1 if score %ench_lvl crazy_spawns matches 2 run data merge entity @s {equipment:{feet:{id:"minecraft:leather_boots",count:1,components:{"minecraft:enchantments":{"minecraft:blast_protection":2}}}}}
execute if score %boots crazy_spawns matches 2 if score %enchantment crazy_spawns matches 2 if score %ench_lvl crazy_spawns matches 1 run data merge entity @s {equipment:{feet:{id:"minecraft:leather_boots",count:1,components:{"minecraft:enchantments":{"minecraft:fire_protection":1}}}}}
execute if score %boots crazy_spawns matches 2 if score %enchantment crazy_spawns matches 2 if score %ench_lvl crazy_spawns matches 2 run data merge entity @s {equipment:{feet:{id:"minecraft:leather_boots",count:1,components:{"minecraft:enchantments":{"minecraft:fire_protection":2}}}}}
execute if score %boots crazy_spawns matches 2 if score %enchantment crazy_spawns matches 3 if score %ench_lvl crazy_spawns matches 1 run data merge entity @s {equipment:{feet:{id:"minecraft:leather_boots",count:1,components:{"minecraft:enchantments":{"minecraft:projectile_protection":1}}}}}
execute if score %boots crazy_spawns matches 2 if score %enchantment crazy_spawns matches 3 if score %ench_lvl crazy_spawns matches 2 run data merge entity @s {equipment:{feet:{id:"minecraft:leather_boots",count:1,components:{"minecraft:enchantments":{"minecraft:projectile_protection":2}}}}}

execute if score %helmet crazy_spawns matches 2 run scoreboard players set %helmet crazy_spawns 1
execute if score %chestplate crazy_spawns matches 2 run scoreboard players set %chestplate crazy_spawns 1
execute if score %leggings crazy_spawns matches 2 run scoreboard players set %leggings crazy_spawns 1
execute if score %boots crazy_spawns matches 2 run scoreboard players set %boots crazy_spawns 1

execute if score %armors crazy_spawns matches ..1 run function why:crazy_spawns/add_armor