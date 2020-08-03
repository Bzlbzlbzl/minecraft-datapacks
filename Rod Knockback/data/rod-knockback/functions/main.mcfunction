# # # A Non-Perfect Rod Knockback Datapack - Bzlbzlbzl # # #

#increments all bobbers by one when it has not summoned a slime yet, and increments all players by one if a bobber is attatched
execute as @e[type=minecraft:fishing_bobber,tag=!summoned] run scoreboard players add @s rodDelayTimer 1
execute as @a at @s positioned ~ ~1 ~ if entity @e[type=minecraft:fishing_bobber,distance=..0.5,tag=summoned,tag=!unsummoned] run scoreboard players add @s rodDelayTimer 1

#summons slime to bobber after 3 ticks and keeps it attached
execute as @e[type=minecraft:fishing_bobber,tag=!summoned,scores={rodDelayTimer=3..}] at @s run summon minecraft:slime ~ ~-1 ~ {Size:1b,Tags:["rodDamage"],Silent:1,Invulnerable:1,Attributes:[{Name:"generic.attack_damage",Base:000.1d}],CustomName:'{"text":"Rod Damage"}',ActiveEffects:[{Id:14,Amplifier:0,Duration:100000,ShowParticles:0b}]}
execute as @e[type=minecraft:fishing_bobber,tag=!summoned,scores={rodDelayTimer=3..}] run tag @s add summoned
execute as @e[type=minecraft:fishing_bobber,tag=summoned,tag=!unsummoned] at @s run tp @e[tag=rodDamage,limit=1,sort=nearest] ~ ~-1 ~

#kills bobber once delay is over, or if the bobber has hit the ground, or if bobber is above water
execute as @a[scores={rodDelayTimer=2..}] at @s positioned ~ ~1 ~ if entity @e[type=minecraft:fishing_bobber,distance=..0.5,tag=summoned,tag=!unsummoned] run kill @e[type=minecraft:fishing_bobber,sort=nearest,tag=summoned]
execute as @e[type=minecraft:fishing_bobber,tag=!unsummoned,nbt={OnGround:1b}] at @s run tag @e[tag=rodDamage,sort=nearest] add toKill
execute as @e[type=minecraft:fishing_bobber,tag=!unsummoned,nbt={OnGround:1b}] at @s run tag @s add unsummoned
execute as @e[type=minecraft:fishing_bobber,tag=!unsummoned] at @s if block ~ ~0.1 ~ water run tag @e[tag=rodDamage,sort=nearest] add toKill
execute as @e[type=minecraft:fishing_bobber,tag=!unsummoned] at @s if block ~ ~0.1 ~ water run tag @s add unsummoned

#resets score of anyone who shouldn't have a rodDelayTimer score
execute as @a[scores={rodDelayTimer=1..}] at @s positioned ~ ~1 ~ unless entity @e[type=minecraft:fishing_bobber,distance=..0.5,tag=summoned,tag=!unsummoned] run scoreboard players reset @s rodDelayTimer

#removing the slime if the bobber disappears
execute as @e[tag=rodDamage] at @s unless entity @e[type=minecraft:fishing_bobber,distance=..1] run tag @s add toKill
execute as @e[tag=toKill] at @s run tp @s ~ -2 ~
execute as @e[tag=toKill] at @s run tag @s remove toKill