# Spawn armor (run by zombie)
scoreboard players set %cursed_armor crazy_spawns 80
execute at @s run summon piglin_brute ~ ~ ~ {Silent:1b,Glowing:0b,DeathLootTable:"minecraft:empty",PersistenceRequired:0b,CanPickUpLoot:0b,Tags:["crazySpawned","crazyArmor"],CustomName:"Cursed Armor",active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b}],attributes:[{id:"minecraft:attack_knockback",base:3},{id:"minecraft:knockback_resistance",base:1.0},{id:"minecraft:max_health",base:100},{id:"minecraft:movement_speed",base:0.1},{id:"minecraft:scale",base:1.2},{id:"minecraft:step_height",base:2},{id:"minecraft:attack_damage",base:4},{id:"minecraft:follow_range",base:60}],TimeInOverworld:-2147483648}
scoreboard players set %armors crazy_spawns 0
scoreboard players set %helmet crazy_spawns 0
scoreboard players set %chestplate crazy_spawns 0
scoreboard players set %leggings crazy_spawns 0
scoreboard players set %boots crazy_spawns 0
execute as @e[type=piglin_brute,tag=crazySpawned,limit=1,sort=nearest] run function why:crazy_spawns/add_armor
tag @e[type=piglin_brute,tag=crazySpawned,limit=1,sort=nearest] remove crazySpawned
