# Crazy spawns cursed_armor
# Tag all entities not tagged yet with crazy spawns (NOTE: this spawning may collide with other datapacks)
#Cursed Armor
execute as @e[type=zombie,tag=!csProcessed] if score %cursed_armor crazy_spawns matches 0 run function why:crazy_spawns/maybe_spawn_armor
execute as @e[type=drowned,tag=!csProcessed] if score %cursed_armor crazy_spawns matches 0 run function why:crazy_spawns/maybe_spawn_armor
execute as @e[type=husk,tag=!csProcessed] if score %cursed_armor crazy_spawns matches 0 run function why:crazy_spawns/maybe_spawn_armor

#Cursed armor mechanics
# Ok bind armor is handled by advancements instead
# No glowing
execute as @e[type=piglin_brute,tag=crazyArmor] if data entity @s active_effects[{id:"minecraft:glowing"}] run effect clear @s glowing
# Sounds
scoreboard players add @e[type=piglin_brute,tag=crazyArmor] crazy_spawns 1
execute as @e[type=piglin_brute,tag=crazyArmor,scores={crazy_spawns=109}] if predicate why:1-3_chance run scoreboard players set @s crazy_spawns 0
execute as @e[type=piglin_brute,tag=crazyArmor,scores={crazy_spawns=30}] if predicate why:1-3_chance if predicate why:50_chance run scoreboard players set @s crazy_spawns 110
execute as @e[type=piglin_brute,tag=crazyArmor,scores={crazy_spawns=110}] at @s run playsound minecraft:item.armor.equip_leather master @a ~ ~ ~ 1 1
execute as @e[type=piglin_brute,tag=crazyArmor,scores={crazy_spawns=120}] at @s run playsound minecraft:item.armor.equip_iron master @a ~ ~ ~ 1 0
execute as @e[type=piglin_brute,tag=crazyArmor,scores={crazy_spawns=120..}] run scoreboard players set @s crazy_spawns 0 

#Decrease cooldowns by one
execute if score %zombies crazy_spawns matches 1.. run scoreboard players remove %zombies crazy_spawns 1
execute if score %skeletons crazy_spawns matches 1.. run scoreboard players remove %skeletons crazy_spawns 1
execute if score %spiders crazy_spawns matches 1.. run scoreboard players remove %spiders crazy_spawns 1
execute if score %creepers crazy_spawns matches 1.. run scoreboard players remove %creepers crazy_spawns 1
execute if score %endermans crazy_spawns matches 1.. run scoreboard players remove %endermans crazy_spawns 1
execute if score %witches crazy_spawns matches 1.. run scoreboard players remove %witches crazy_spawns 1