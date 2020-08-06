# # # Player Rod Knockback Datapack - Bzlbzlbzl # # #

#increments all bobber delays by 1 when score is not -1, and increments all players' delay by 1 if a bobber is attached to them, increments fake player %particle score by 1 per tick
execute as @e[type=minecraft:fishing_bobber] unless entity @s[scores={rodDelayTimer=-1}] run scoreboard players add @s rodDelayTimer 1
execute as @a at @s positioned ~ ~1 ~ if entity @e[type=minecraft:fishing_bobber,distance=..0.5,scores={rodDelayTimer=5..}] run scoreboard players add @s rodDelayTimer 1

#summons slime in void at 4 tick delay (to prevent being seen) then teleports it to the bobber, then keeps it attached at 5 tick delay
execute as @e[type=minecraft:fishing_bobber,scores={rodDelayTimer=4}] at @s run summon minecraft:slime ~ -1 ~ {Size:1b,Tags:["rodDamage"],Silent:1,Invulnerable:1,Attributes:[{Name:"generic.attack_damage",Base:000.1d}],CustomName:'{"text":"Rod Damage"}',ActiveEffects:[{Id:14,Amplifier:0,Duration:100000,ShowParticles:0b}]}
execute as @e[type=minecraft:fishing_bobber,scores={rodDelayTimer=4}] at @s positioned ~ -1 ~ run tp @e[tag=rodDamage,limit=1,sort=nearest] @s
execute as @e[type=minecraft:fishing_bobber,scores={rodDelayTimer=5..}] at @s positioned ~ ~-1 ~ run tp @e[tag=rodDamage,limit=1,sort=nearest] ~ ~ ~

#kills bobber once the player attach delay is over, or if the bobber has hit the ground, or if bobber is above water
execute as @a[scores={rodDelayTimer=2}] at @s positioned ~ ~1 ~ if entity @e[type=minecraft:fishing_bobber,distance=..0.5,scores={rodDelayTimer=5..}] run kill @e[type=minecraft:fishing_bobber,sort=nearest,scores={rodDelayTimer=5..}]
execute as @e[type=minecraft:fishing_bobber,scores={rodDelayTimer=0..},nbt={OnGround:1b}] at @s positioned ~ ~-1 ~ run tag @e[tag=rodDamage,sort=nearest,limit=1] add toKill
execute as @e[type=minecraft:fishing_bobber,scores={rodDelayTimer=0..},nbt={OnGround:1b}] run scoreboard players set @s rodDelayTimer -1
execute as @e[type=minecraft:fishing_bobber,scores={rodDelayTimer=0..}] at @s positioned ~ ~-1 ~ if block ~ ~0.9 ~ water run tag @e[tag=rodDamage,sort=nearest,limit=1] add toKill
execute as @e[type=minecraft:fishing_bobber,scores={rodDelayTimer=0..}] at @s if block ~ ~-0.1 ~ water run scoreboard players set @s rodDelayTimer -1

#resets score of anyone who shouldn't have a rodDelayTimer score
execute as @a[scores={rodDelayTimer=1..}] at @s positioned ~ ~1 ~ unless entity @e[type=minecraft:fishing_bobber,distance=..0.5,scores={rodDelayTimer=5..}] run scoreboard players reset @s rodDelayTimer

#creates a green particle when bobber can hit player (commented part is when bobber can hit)
execute as @e[type=minecraft:fishing_bobber,scores={rodDelayTimer=5}] at @s run particle minecraft:dust 0 1 0 2 ~ ~ ~ 0 0 0 50 1 normal
execute as @e[type=minecraft:fishing_bobber,scores={rodDelayTimer=7}] run scoreboard players set @s rodDelayTimer 4

#tagging the slime for death if the bobber disappears, and disposing of tagged slimes (so the death of the slime isn't seen)
execute as @e[tag=rodDamage,type=slime] at @s unless entity @e[type=minecraft:fishing_bobber,distance=..1] run tag @s add toKill
execute as @e[tag=toKill,type=slime] at @s run tp @s ~ -2 ~
kill @e[tag=toKill,type=slime]