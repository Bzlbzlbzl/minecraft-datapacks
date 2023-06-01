## Psychosis datapack - by Bzlbzlbzl

#Assigns a unique id to every player
execute as @a unless score @s psy_id matches 0.. run function psychosis:scripts/assign_id

#Psychosis counter and reset (also kills psychosis creature if sleep or die)
execute as @a[nbt={SleepTimer:1s},scores={psychosis=72000..}] at @s as @e[tag=psyCreature,type=skeleton] if score @s psy_id = @p[nbt={SleepTimer:1s},scores={psychosis=72000..}] psy_id run function psychosis:scripts/kill_creature
execute as @a[nbt={SleepTimer:1s},scores={psychosis=1..}] run scoreboard players set @s psychosis 0
execute as @a[scores={psy_death=1..,psychosis=72000..}] at @s as @e[tag=psyCreature,type=skeleton] if score @s psy_id = @p[scores={psy_death=1..,psychosis=72000..}] psy_id run function psychosis:scripts/kill_creature
execute as @a[scores={psy_death=1..,psychosis=1..}] run scoreboard players set @s psychosis 0
execute as @a[scores={psy_death=1..}] run scoreboard players set @s psy_death 0
execute as @e[type=minecraft:player,gamemode=!spectator] unless score @s psychosis matches 72000.. run scoreboard players add @s psychosis 1
execute store result score %time psychosis run time query daytime
#Guarenteed psychosis tag reset (if they leave the game and come back or something). Again, avoiding tags because they are apparently inefficient
execute as @a[tag=psychosis,scores={psy_check=..-1}] run scoreboard players set @s psy_check 1
execute as @a[tag=psychosis] at @s as @e[tag=psyCreature,type=minecraft:skeleton] if score @s psy_id = @p[tag=psychosis] psy_id run scoreboard players set @p[tag=psychosis] psy_check 0
execute as @a[tag=psychosis,scores={psy_check=1}] run tag @s remove psychosis

#Warning sounds
execute if score %time psychosis matches 13000..23000 as @e[type=minecraft:player,gamemode=!spectator,tag=!psyWarned,scores={psychosis=72000..}] run scoreboard players set @s psy_sound 240
execute if score %time psychosis matches 13000..23000 as @e[type=minecraft:player,gamemode=!spectator,tag=!psyWarned,scores={psychosis=72000..}] at @s run playsound minecraft:music_disc.11 ambient @s ~ ~ ~ 0.3 2 0.3
execute if score %time psychosis matches 13000..23000 as @e[type=minecraft:player,gamemode=!spectator,tag=!psyWarned,scores={psychosis=72000..}] at @s run playsound minecraft:ambient.cave ambient @s ~ ~ ~ 0.3 0.5 0.3
execute if score %time psychosis matches 13000..23000 as @e[type=minecraft:player,gamemode=!spectator,tag=!psyWarned,scores={psychosis=72000..}] run scoreboard players set @s psy_check -500
execute if score %time psychosis matches 13000..23000 as @e[type=minecraft:player,gamemode=!spectator,tag=!psyWarned,scores={psychosis=72000..}] run tag @s add psyWarned
execute as @e[type=minecraft:player,gamemode=!spectator,scores={psy_sound=180}] run playsound minecraft:ambient.cave ambient @s ~ ~ ~ 0.1 2 0.1
execute as @e[type=minecraft:player,gamemode=!spectator,scores={psy_sound=80}] run playsound minecraft:entity.zombie.attack_wooden_door ambient @s ~ ~ ~ 0.15 1 0.15
execute as @e[type=minecraft:player,gamemode=!spectator,scores={psy_sound=75}] run playsound minecraft:entity.zombie.attack_wooden_door ambient @s ~ ~ ~ 0.15 1 0.15
execute as @e[type=minecraft:player,gamemode=!spectator,scores={psy_sound=0}] run stopsound @s ambient minecraft:music_disc.11

#Sound increment (right now just for stopsound)
execute as @a[scores={psy_sound=0..}] run scoreboard players remove @s psy_sound 1

#Unwarn everyone at start of new day
execute if score %time psychosis matches 1 run tag @e remove psyWarned
execute if score %time psychosis matches 1 as @a[scores={psy_sound=0..}] run stopsound @s ambient minecraft:music_disc.11
execute if score %time psychosis matches 1 as @a[scores={psy_sound=0..}] run stopsound @s ambient minecraft:ambient.cave
execute if score %time psychosis matches 1 as @a[scores={psy_sound=0..}] run scoreboard players set @s psy_sound -1

#psy_check negative for when player is on spawning cooldown (5 seconds). Maker sure player psycheck not change when this score is negative
execute as @a[scores={psy_check=..-1}] run scoreboard players add @s psy_check 1

#Psychosis creatures and heads items and facing
execute as @e[tag=psyCreature,type=!enderman] at @s run function psychosis:scripts/creature_tick
#execute as @e[tag=psyHead] at @s run function psychosis:scripts/creature_tick
execute as @e[tag=psyCreature,type=minecraft:enderman] at @s rotated ~ 0 positioned ^ ^0.8 ^0.8 run particle minecraft:falling_dust red_nether_bricks ~ ~ ~ 0.1 0 0.1 0 1 normal

#Enderman rotate by some, can't do same tick as summon or rotation gets a little funky for some reason. 
execute as @e[tag=psyCreature,type=minecraft:enderman,tag=!psyRotated] at @s run function psychosis:scripts/ender_rotate

#Summon psychosis thing at night and kill when daytime, ALSO reset psychosis level here
execute if score %time psychosis matches 13000..23000 as @e[type=minecraft:player,gamemode=!spectator,scores={psychosis=72000..,psy_check=0..},tag=!psychosis] at @s run function psychosis:scripts/summon_creature
execute if score %time psychosis matches 23001 as @e[tag=psyCreature,type=skeleton] run function psychosis:scripts/kill_creature
execute if score %time psychosis matches 1 as @e[tag=psyCreature,type=skeleton] run function psychosis:scripts/kill_creature
execute if score %time psychosis matches 1 run scoreboard players set @a[scores={psychosis=72001..}] psychosis 72000

#Psychosis creature interactions
# Interaction with other players. Kills if someone who is not the ided person if 8 blocks away. Kills if not has psychosis player 20 blocks away
execute as @e[tag=psyCreature,type=minecraft:skeleton] at @s as @e[type=minecraft:player,gamemode=!spectator,distance=..8,scores={psychosis=72000..}] unless score @s psy_id = @e[limit=1,sort=nearest,tag=psyCreature,type=minecraft:skeleton] psy_id as @e[tag=psyCreature] if score @s psy_id = @e[limit=1,sort=nearest,tag=psyCreature,type=minecraft:skeleton] psy_id run function psychosis:scripts/kill_creature
execute as @e[tag=psyCreature,type=minecraft:skeleton] at @s as @e[type=minecraft:player,gamemode=!spectator,distance=..20,scores={psychosis=..71999}] unless score @s psy_id = @e[limit=1,sort=nearest,tag=psyCreature,type=minecraft:skeleton] psy_id as @e[tag=psyCreature] if score @s psy_id = @e[limit=1,sort=nearest,tag=psyCreature,type=minecraft:skeleton] psy_id run function psychosis:scripts/kill_creature
# Disappears if further from 150 blocks from player (I could tag some "safe" tag every tick but apparently tags are inefficient so I'll use scoreboard values).
scoreboard players set @e[tag=psyCreature,type=minecraft:skeleton] psy_check 1
execute as @e[tag=psyCreature,type=minecraft:skeleton] at @s as @e[type=minecraft:player,gamemode=!spectator,distance=..150] if score @s psy_id = @e[limit=1,sort=nearest,tag=psyCreature,type=minecraft:skeleton] psy_id run scoreboard players set @e[limit=1,sort=nearest,tag=psyCreature,type=minecraft:skeleton] psy_check 0
execute as @e[tag=psyCreature,type=minecraft:skeleton,scores={psy_check=1}] run function psychosis:scripts/kill_creature
# Level 1 and 2 psychosis interaction
execute as @e[tag=psyCreature,type=minecraft:skeleton] at @s as @e[type=minecraft:player,gamemode=!spectator,distance=..3.5,scores={psychosis=72000..72001}] if score @s psy_id = @e[limit=1,sort=nearest,tag=psyCreature,type=minecraft:skeleton] psy_id run function psychosis:scripts/generate_loot
# 

#Enderman kill if skeleton is dead (should be run after all skeleton death functions). Try to make sure only enderman die when skeleton die, not multikill somehwere or mgiht be buggy
scoreboard players set @e[tag=psyCreature,type=minecraft:enderman] psy_check 1
execute as @e[tag=psyCreature,type=minecraft:enderman] at @s as @e[tag=psyCreature,type=minecraft:skeleton] if score @s psy_id = @e[tag=psyCreature,type=minecraft:enderman,limit=1,sort=nearest] psy_id run scoreboard players set @e[tag=psyCreature,type=minecraft:enderman,limit=1,sort=nearest] psy_check 0
execute as @e[tag=psyCreature,type=minecraft:enderman,scores={psy_check=1}] run function psychosis:scripts/kill_creature

