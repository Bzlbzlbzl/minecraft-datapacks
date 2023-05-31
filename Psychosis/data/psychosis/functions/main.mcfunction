## Psychosis datapack - by Bzlbzlbzl

#Assigns a unique id to every player
execute as @a unless score @s psy_id matches 0.. run function psychosis:scripts/assign_id

#Psychosis counter and reset (also kills psychosis creature if sleep)
execute as @a[nbt={SleepTimer:1s},scores={psychosis=72000..}] at @s as @e[tag=psyCreature] if score @s psy_id = @p psy_id run function psychosis:scripts/kill_creature
execute as @a[nbt={SleepTimer:1s},scores={psychosis=1..}] run scoreboard players set @s psychosis 0
execute as @a unless score @s psychosis matches 72000 run scoreboard players add @s psychosis 1
execute store result score %time psychosis run time query daytime

#Summon psychosis thing at night and kill when daytime
execute if score %time psychosis matches 13000..23000 as @a[scores={psychosis=72000..},tag=!psychosis] at @s run function psychosis:scripts/summon_creature
execute if score %time psychosis matches 23001 as @e[tag=psyCreature] run function psychosis:scripts/kill_creature
execute if score %time psychosis matches 1 as @e[tag=psyCreature] run function psychosis:scripts/kill_creature

#Psychosis creature interactions
# Interaction with other players. Kills if someone who is not the ided person if 8 blocks away. Kills if not has psychosis player 20 blocks away
execute as @e[tag=psyCreature] at @s as @a[distance=..8,scores={psychosis=72000..}] unless score @s psy_id = @e[limit=1,sort=nearest,tag=psyCreature] psy_id as @e[tag=psyCreature] if score @s psy_id = @e[limit=1,sort=nearest,tag=psyCreature] psy_id run function psychosis:scripts/kill_creature
execute as @e[tag=psyCreature] at @s as @a[distance=..20,scores={psychosis=..71999}] unless score @s psy_id = @e[limit=1,sort=nearest,tag=psyCreature] psy_id as @e[tag=psyCreature] if score @s psy_id = @e[limit=1,sort=nearest,tag=psyCreature] psy_id run function psychosis:scripts/kill_creature

#Psychosis creature items and facing
execute as @e[tag=psyCreature] at @s run function psychosis:scripts/creature_tick

#Warning sounds
execute if score %time psychosis matches 13000..23000 as @a[tag=!psyWarned,scores={psychosis=72000..}] run scoreboard players set @s psy_sound 240
execute if score %time psychosis matches 13000..23000 as @a[tag=!psyWarned,scores={psychosis=72000..}] at @s run playsound minecraft:music_disc.11 ambient @s ~ ~ ~ 0.3 2 0.3
execute if score %time psychosis matches 13000..23000 as @a[tag=!psyWarned,scores={psychosis=72000..}] at @s run playsound minecraft:ambient.cave ambient @s ~ ~ ~ 0.3 0.5 0.3
execute if score %time psychosis matches 13000..23000 as @a[tag=!psyWarned,scores={psychosis=72000..}] run tag @s add psyWarned
execute as @a[scores={psy_sound=180}] run playsound minecraft:ambient.cave ambient @s ~ ~ ~ 0.1 2 0.1
execute as @a[scores={psy_sound=80}] run playsound minecraft:entity.zombie.attack_wooden_door ambient @s ~ ~ ~ 0.15 1 0.15
execute as @a[scores={psy_sound=75}] run playsound minecraft:entity.zombie.attack_wooden_door ambient @s ~ ~ ~ 0.15 1 0.15
execute as @a[scores={psy_sound=0}] run stopsound @s ambient minecraft:music_disc.11

#Sound increment (right now just for stopsound)
execute as @a[scores={psy_sound=0..}] run scoreboard players remove @s psy_sound 1

#Unwarn everyone at start of new day
execute if score %time psychosis matches 1 run tag @e remove psyWarned
execute if score %time psychosis matches 1 as @a[scores={psy_sound=0..}] run stopsound @s ambient minecraft:music_disc.11
execute if score %time psychosis matches 1 as @a[scores={psy_sound=0..}] run stopsound @s ambient minecraft:ambient.cave
execute if score %time psychosis matches 1 as @a[scores={psy_sound=0..}] run scoreboard players set @s psy_sound -1