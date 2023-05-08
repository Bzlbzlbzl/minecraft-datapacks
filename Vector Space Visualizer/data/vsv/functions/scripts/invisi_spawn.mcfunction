#Just a small addition to make the spawns not visible (llama can be seen breifly if spawned in front of player)
execute at @s run summon llama ~ -72 ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,Glowing:0b,CustomNameVisible:0b,PersistenceRequired:1b,NoAI:1b,Health:20f,Age:2147483647 ,Tame:1b,Variant:0,Strength:5,ChestedHorse:1b,Tags:["vsvMenu","vsvSpawned"],CustomName:'{"translate":"Matrix Editor","color":"aqua","bold":true}',ActiveEffects:[{Id:11,Amplifier:4b,Duration:2147483647 ,ShowParticles:0b},{Id:14,Amplifier:0b,Duration:2147483647 ,ShowParticles:0b}],Attributes:[{Name:"generic.max_health",Base:20},{Name:"generic.knockback_resistance",Base:1}]}
execute at @s anchored eyes positioned ^ ^ ^2 positioned ~ ~-1 ~ run tp @e[type=llama,tag=vsvSpawned,limit=1,sort=nearest] ~ ~ ~

#Player scoreboard and inventory
function vsv:scripts/generate_inventory
scoreboard players set @s _menu -1

#Edits llama inventory to match current scoreboard
execute as @e[type=llama,tag=vsvSpawned] run function vsv:scripts/llama_checks

tag @e[type=llama,tag=vsvSpawned] remove vsvSpawned
