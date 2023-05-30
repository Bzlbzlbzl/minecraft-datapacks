## Psychosis datapack - by Bzlbzlbzl

#Assigns a unique id to every player
execute as @a unless score @s psy_id matches 0.. run function psychosis:scripts/assign_id

#Psychosis counter and reset
execute as @a[nbt={SleepTimer:1s},scores={psychosis=1..}] run scoreboard players set @s psychosis 0
execute as @a unless score @s psychosis matches 72000 run scoreboard players add @s psychosis 1
execute store result score %time psychosis run time query daytime

#Summon psychosis thing
execute if score %time psychosis matches 13000..23000 as @a[scores={psychosis=72000..},tag=!psySpawned] run function psychosis:scripts/summon_psychosis

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