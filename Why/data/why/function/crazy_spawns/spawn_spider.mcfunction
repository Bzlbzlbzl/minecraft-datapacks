# Spawn skeleton (run by spider)
scoreboard players set %spiders crazy_spawns 80

execute at @s run summon cave_spider ~ ~ ~ {Tags:["csProcessed"],active_effects:[{id:"minecraft:jump_boost",amplifier:2,duration:-1,show_particles:0b},{id:"minecraft:regeneration",amplifier:0,duration:-1,show_particles:0b},{id:"minecraft:slowness",amplifier:0,duration:-1,show_particles:0b}],attributes:[{id:"minecraft:attack_damage",base:1},{id:"minecraft:attack_knockback",base:0},{id:"minecraft:fall_damage_multiplier",base:0},{id:"minecraft:follow_range",base:30},{id:"minecraft:max_health",base:8},{id:"minecraft:scale",base:0.3}]}
