# Crazy spawns cursed_armor
# Tag all entities not tagged yet with crazy spawns (NOTE: this spawning may collide with other datapacks)
# Keep track of time
execute store result score %time crazy_spawns run time query daytime

#Cursed Armor (NOTE does not tag so cursed zombie can run)
execute as @e[type=zombie,tag=!csProcessed] if score %cursed_armor crazy_spawns matches 0 run function why:crazy_spawns/maybe_spawn_armor
execute as @e[type=drowned,tag=!csProcessed] if score %cursed_armor crazy_spawns matches 0 run function why:crazy_spawns/maybe_spawn_armor
execute as @e[type=husk,tag=!csProcessed] if score %cursed_armor crazy_spawns matches 0 run function why:crazy_spawns/maybe_spawn_armor

#Cursed Zombie (NOTE does tag this time, but does not spawn if its daytime)
execute as @e[type=zombie,tag=!csProcessed] if score %zombies crazy_spawns matches 0 run function why:crazy_spawns/maybe_spawn_zombie
execute as @e[type=drowned,tag=!csProcessed] if score %zombies crazy_spawns matches 0 run function why:crazy_spawns/maybe_spawn_zombie
execute as @e[type=husk,tag=!csProcessed] if score %zombies crazy_spawns matches 0 run function why:crazy_spawns/maybe_spawn_zombie

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

#Cursed zombie mechanics
# Spawn stuff when damaged (1sec cd) EDIT: NO MORE CD
execute as @e[tag=crazyZombie,nbt={HurtTime:8s},scores={crazy_spawns=0}] at @s run function why:crazy_spawns/spawn_rand_zomb_dir
#execute as @e[tag=crazyZombie,nbt={HurtTime:8s},scores={crazy_spawns=0}] run scoreboard players set @s crazy_spawns 20
# Delay check directions because for some reason, it doesn't work same-tick
# ALSO IMPORTANT here is summon cooldown delter (1 sec)
scoreboard players remove @e[tag=crazyZombie,scores={crazy_spawns=1..}] crazy_spawns 1
execute as @e[tag=crazyZombie,scores={crazy_spawns=21}] at @s anchored eyes run function why:crazy_spawns/check_directions
# Kill when daytime
execute if score %time crazy_spawns matches 10 as @e[tag=crazyZombie] at @s run playsound minecraft:entity.firework_rocket.launch hostile @a ~ ~ ~ 2 0
execute if score %time crazy_spawns matches 10..70 as @e[tag=crazyZombie] at @s run particle minecraft:firework ~ ~ ~ 0 0 0 0.02 2
execute if score %time crazy_spawns matches 10..70 as @e[tag=crazyZombie] at @s run tp @s ~ ~0.6 ~
execute if score %time crazy_spawns matches 71 as @e[tag=crazyZombie] at @s run summon firework_rocket ~ ~ ~ {LifeTime:0,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",has_twinkle:true,colors:[I;17663],fade_colors:[I;7566195]},{shape:"creeper",has_twinkle:true,colors:[I;62957]}]}}}}
execute if score %time crazy_spawns matches 71 as @e[tag=crazyZombie] at @s run tp @s ~ -80 ~
execute if score %time crazy_spawns matches 71 as @e[tag=crazyZombie] at @s run kill @s
# Kill pilot or instructor zombie if about to convert
kill @e[tag=crazyZombie,nbt={DrownedConversionTime:1}]
kill @e[tag=crazyZombiePilot,nbt={DrownedConversionTime:1}]

#Decrease cooldowns by one
execute if score %cursed_armor crazy_spawns matches 1.. run scoreboard players remove %cursed_armor crazy_spawns 1
execute if score %zombies crazy_spawns matches 1.. run scoreboard players remove %zombies crazy_spawns 1
execute if score %skeletons crazy_spawns matches 1.. run scoreboard players remove %skeletons crazy_spawns 1
execute if score %spiders crazy_spawns matches 1.. run scoreboard players remove %spiders crazy_spawns 1
execute if score %creepers crazy_spawns matches 1.. run scoreboard players remove %creepers crazy_spawns 1
execute if score %endermans crazy_spawns matches 1.. run scoreboard players remove %endermans crazy_spawns 1
execute if score %witches crazy_spawns matches 1.. run scoreboard players remove %witches crazy_spawns 1