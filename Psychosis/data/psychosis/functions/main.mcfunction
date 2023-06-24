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
execute as @a[tag=psychosis] unless score @s psy_check matches ..-1 run scoreboard players set @s psy_check 1
execute as @a[tag=psychosis] unless score @s psy_check matches ..-1 at @s as @e[tag=psyCreature,type=minecraft:skeleton] if score @s psy_id = @p[tag=psychosis] psy_id run scoreboard players set @p[tag=psychosis] psy_check 0
execute as @a[tag=psychosis,scores={psy_check=1}] run tag @s remove psychosis
#Guarenteed psyHaunted tag reset (if they leave the game and come back or something). Again, avoiding tags because they are apparently inefficient
execute as @a[tag=psyHaunted] unless score @s psy_check matches ..-1 run scoreboard players set @s psy_check 2
execute as @a[tag=psyHaunted] unless score @s psy_check matches ..-1 at @s as @e[tag=psyCreature,type=minecraft:wither_skeleton] if score @s psy_id = @p[tag=psyHaunted] psy_id run scoreboard players set @p[tag=psyHaunted] psy_check 0
execute as @a[tag=psyHaunted,scores={psy_check=2}] run tag @s remove psyHaunted

#Warning sounds
execute if score %time psychosis matches 13000..23000 as @e[type=minecraft:player,gamemode=!spectator,tag=!psyWarned,scores={psychosis=72000..}] run scoreboard players set @s psy_sound 240
execute if score %time psychosis matches 13000..23000 as @e[type=minecraft:player,gamemode=!spectator,tag=!psyWarned,scores={psychosis=72000..}] at @s run playsound minecraft:music_disc.11 ambient @s ~ ~ ~ 0.3 2 0.3
execute if score %time psychosis matches 13000..23000 as @e[type=minecraft:player,gamemode=!spectator,tag=!psyWarned,scores={psychosis=72000..}] at @s run playsound minecraft:ambient.cave ambient @s ~ ~ ~ 0.3 0.5 0.3
execute if score %time psychosis matches 13000..23000 as @e[type=minecraft:player,gamemode=!spectator,tag=!psyWarned,scores={psychosis=72000..}] run scoreboard players set @s psy_check -500
execute if score %time psychosis matches 13000..23000 as @e[type=minecraft:player,gamemode=!spectator,tag=!psyWarned,scores={psychosis=72000..}] run tag @s add psyWarned
execute as @e[type=minecraft:player,gamemode=!spectator,scores={psy_sound=180}] run playsound minecraft:ambient.cave ambient @s ~ ~ ~ 0.1 2 0.1
execute as @e[type=minecraft:player,gamemode=!spectator,scores={psy_sound=80}] run playsound minecraft:entity.zombie.attack_wooden_door ambient @s ~ ~ ~ 0.15 1 0.15
execute as @e[type=minecraft:player,gamemode=!spectator,scores={psy_sound=75}] run playsound minecraft:entity.zombie.attack_wooden_door ambient @s ~ ~ ~ 0.15 1 0.15
execute as @e[type=minecraft:player,gamemode=!spectator,scores={psy_sound=1}] run stopsound @s ambient minecraft:music_disc.11

#Sound increment
execute as @a[scores={psy_sound=1..}] run scoreboard players remove @s psy_sound 1

#Unwarn everyone at start of new day
execute if score %time psychosis matches 1 run tag @e remove psyWarned
execute if score %time psychosis matches 1 as @a[scores={psy_sound=0..}] run stopsound @s ambient minecraft:music_disc.11
execute if score %time psychosis matches 1 as @a[scores={psy_sound=0..}] run stopsound @s ambient minecraft:ambient.cave
execute if score %time psychosis matches 1 as @a[scores={psy_sound=0..}] run scoreboard players set @s psy_sound -1

#psy_check negative for when player is on spawning cooldown (5 seconds). Maker sure player psycheck not change when this score is negative
execute as @a[scores={psy_check=..-1}] run scoreboard players add @s psy_check 1

#Psychosis creatures items and facing
execute as @e[tag=psyCreature,type=!enderman] at @s run function psychosis:scripts/creature_tick
#execute as @e[tag=psyHead] at @s run function psychosis:scripts/creature_tick
execute as @e[tag=psyCreature,type=minecraft:enderman] at @s rotated ~ 0 positioned ^ ^0.8 ^0.8 run particle minecraft:falling_dust red_nether_bricks ~ ~ ~ 0.1 0 0.1 0 1 normal

#Enderman rotate by some, can't do same tick as summon or rotation gets a little funky for some reason. 
execute as @e[tag=psyCreature,type=minecraft:enderman,tag=!psyRotated] at @s run function psychosis:scripts/ender_rotate

#Enderman block carry reset if enderman placed carriedBlockState:{Name:"minecraft:structure_void"}
execute as @e[tag=psyCreature,type=minecraft:enderman] unless entity @s[nbt={carriedBlockState:{Name:"minecraft:structure_void"}}] at @s run fill ~2 ~2 ~2 ~-2 ~-2 ~-2 air replace structure_void
execute as @e[tag=psyCreature,type=minecraft:enderman] unless entity @s[nbt={carriedBlockState:{Name:"minecraft:structure_void"}}] run data modify entity @s carriedBlockState.Name set value "minecraft:structure_void"

#Summon psychosis thing at night and kill when daytime, ALSO reset psychosis level here
execute if score %time psychosis matches 13000..23000 as @e[type=minecraft:player,gamemode=!spectator,scores={psychosis=72000..72002,psy_check=0..},tag=!psychosis] at @s run function psychosis:scripts/summon_creature_check
execute if score %time psychosis matches 23001 as @e[tag=psyCreature,type=skeleton] run function psychosis:scripts/kill_creature
execute if score %time psychosis matches 1 as @e[tag=psyCreature,type=skeleton] run function psychosis:scripts/kill_creature
execute if score %time psychosis matches 1 run scoreboard players set @a[scores={psychosis=72001..}] psychosis 72000
execute if score %time psychosis matches 12999 run scoreboard players set @a[scores={psychosis=72001..}] psychosis 72000

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
# Level 3 wither skeleton spawning and disappearing (disappearing first, just in case)
execute as @e[tag=psyCreature,type=wither_skeleton] at @s run function psychosis:scripts/reaper_vanish_check
execute if score %time psychosis matches 13000..23000 as @e[type=minecraft:player,gamemode=!spectator,scores={psychosis=72002,psy_check=0..},tag=!psyHaunted] at @s rotated ~ 0 positioned ^ ^ ^-8 run function psychosis:scripts/summon_reaper
# Level 3 wither skeleton and psyHaunted sounds (NEGATIVE psy_sound for player for the haunting sounds, positive for psyWarned) also particles for both reapers
execute as @a[tag=psyHaunted,scores={psy_sound=0}] at @s run playsound minecraft:ambient.soul_sand_valley.mood ambient @s ~ ~ ~ 0.45 0
execute as @a[tag=psyHaunted,scores={psy_sound=0}] run scoreboard players set @s psy_sound -200
execute as @a[tag=psyHaunted,scores={psy_sound=..-1}] run scoreboard players add @s psy_sound 1
execute as @e[tag=psyCreature,type=wither_skeleton,scores={psy_sound=1..}] run scoreboard players remove @s psy_sound 1
execute as @e[tag=psyCreature,type=wither_skeleton,scores={psy_sound=0}] at @s run playsound minecraft:entity.ravager.stunned ambient @a[tag=psyHaunted] ~ ~ ~ 0.8 0.7
execute as @e[tag=psyCreature,type=wither_skeleton,scores={psy_sound=0}] at @s run playsound minecraft:entity.drowned.ambient ambient @a[tag=psyHaunted] ~ ~ ~ 0.7 0
execute as @e[tag=psyCreature,type=wither_skeleton,scores={psy_sound=0}] at @s run playsound minecraft:entity.wither.ambient ambient @a[tag=psyHaunted] ~ ~ ~ 0.12 0.7
execute as @e[tag=psyCreature,type=wither_skeleton,scores={psy_sound=0}] at @s run playsound minecraft:entity.skeleton.step ambient @a[tag=psyHaunted] ~ ~ ~ 1 0.4
execute as @e[tag=psyCreature,type=wither_skeleton,scores={psy_sound=200}] at @s run playsound minecraft:entity.warden.agitated ambient @a[tag=psyHaunted] ~ ~ ~ 1 0
execute as @e[tag=psyCreature,type=wither_skeleton,scores={psy_sound=200}] at @s run playsound minecraft:entity.drowned.ambient ambient @a[tag=psyHaunted] ~ ~ ~ 0.7 0
execute as @e[tag=psyCreature,type=wither_skeleton,scores={psy_sound=200}] at @s run playsound minecraft:entity.wither.ambient ambient @a[tag=psyHaunted] ~ ~ ~ 0.12 0.7
execute as @e[tag=psyCreature,type=wither_skeleton,scores={psy_sound=200}] at @s run playsound minecraft:entity.skeleton.step ambient @a[tag=psyHaunted] ~ ~ ~ 1 0.4
execute as @e[tag=psyCreature,type=wither_skeleton,scores={psy_sound=0}] run scoreboard players set @s psy_sound 400
execute as @e[tag=psyCreature,type=wither_skeleton] if predicate psychosis:soul at @s run particle minecraft:sculk_soul ~ ~1 ~ 0.3 1 0.3 0 1 normal @a
execute as @e[tag=psyReaper,type=wither_skeleton] at @s run particle minecraft:sculk_soul ~ ~1 ~ 0.3 1 0.3 0 1 normal @a
# Level 3 skeleton interaction, increment, and animation
execute as @e[tag=psyCreature,type=minecraft:skeleton] at @s as @e[type=minecraft:player,gamemode=!spectator,distance=..3.5,scores={psychosis=72002}] if score @s psy_id = @e[limit=1,sort=nearest,tag=psyCreature,type=minecraft:skeleton] psy_id run function psychosis:scripts/begin_ritual
scoreboard players remove @e[tag=psyDying,scores={psychosis=1..}] psychosis 1
# > Summon the scythe and final reaper
execute as @e[tag=psyDying,scores={psychosis=940}] at @s as @e[type=minecraft:player,gamemode=!spectator,scores={psychosis=72003}] if score @s psy_id = @e[limit=1,sort=nearest,tag=psyDying,type=minecraft:skeleton] psy_id at @s facing entity @e[limit=1,sort=nearest,tag=psyDying,type=minecraft:skeleton] feet rotated ~ 0 positioned ^ ^ ^8 run function psychosis:scripts/summon_final_reaper
execute as @e[tag=psyDying,scores={psychosis=940}] at @s run function psychosis:scripts/summon_scythe
# > Every tick increase increment by 1
execute as @e[tag=psyScythe] unless score @s psychosis matches 30.. run scoreboard players add @s psychosis 1
# > Animate the psyScythe until its increment is 28. 
execute as @e[tag=psyScythe,scores={psychosis=0..28}] at @s rotated ~ 0 run function psychosis:scripts/scythe_move
execute as @e[tag=psyScythe,scores={psychosis=0..28}] at @s rotated ~ 0 positioned ^-0.35 ^1.6 ^0.55 run particle minecraft:sculk_soul ~ ~ ~ 0.5 0.5 0.5 0 1 normal @a
# > psyDeath sounds and hit
execute as @e[tag=psyDying,scores={psychosis=900}] at @s run playsound minecraft:item.trident.riptide_3 ambient @a ~ ~ ~ 1 0
execute as @e[tag=psyDying,scores={psychosis=872}] at @s run playsound minecraft:entity.player.hurt ambient @a ~ ~ ~ 1 0
execute as @e[tag=psyDying,scores={psychosis=872}] at @s run particle minecraft:block redstone_block ~ ~0.8 ~ 0.3 0.8 0.3 0 40 normal
execute as @e[tag=psyDying,scores={psychosis=872}] run damage @s 1 minecraft:out_of_world
execute as @e[tag=psyDying,scores={psychosis=871}] at @s as @e[type=player,gamemode=!spectator,scores={psychosis=72003}] if score @s psy_id = @e[tag=psyDying,scores={psychosis=871},limit=1,sort=nearest] psy_id run effect give @s blindness 1 0 true
execute as @e[tag=psyDying,scores={psychosis=871}] at @s as @e[type=player,gamemode=!spectator,scores={psychosis=72003}] if score @s psy_id = @e[tag=psyDying,scores={psychosis=871},limit=1,sort=nearest] psy_id run playsound minecraft:entity.player.big_fall ambient @a ~ ~ ~ 1 0
execute as @e[tag=psyDying,scores={psychosis=871}] at @s run particle minecraft:soul ~ ~0.8 ~ 0.1 0.1 0.1 0.12 30 normal @a
execute as @e[tag=psyDying,scores={psychosis=871}] at @s run tp @s ~ ~ ~ ~ -77
execute as @e[tag=psyDying,scores={psychosis=770..870}] at @s run particle minecraft:block soul_sand ~ ~0.1 ~ 0.35 0 0.35 0 4 normal @a
execute as @e[tag=psyDying,scores={psychosis=861}] at @s run playsound minecraft:entity.ghast.hurt ambient @a[scores={psychosis=72003}] ~ ~ ~ 1 0.6 1
execute as @e[tag=psyDying,scores={psychosis=840}] at @s run playsound minecraft:entity.warden.dig ambient @a ~ ~ ~ 1 1.3
# > Drag down animation
execute as @e[tag=psyDying,scores={psychosis=838}] at @s run tp @s ~ ~0.3 ~
execute as @e[tag=psyDying,scores={psychosis=838}] at @s as @e[tag=psyScythe] if score @s psy_id = @e[tag=psyDying,scores={psychosis=838},limit=1,sort=nearest] psy_id at @s run tp @s ~ ~0.3 ~
execute as @e[tag=psyDying,scores={psychosis=836}] at @s run tp @s ~ ~-0.05 ~
execute as @e[tag=psyDying,scores={psychosis=836}] at @s as @e[tag=psyScythe] if score @s psy_id = @e[tag=psyDying,scores={psychosis=836},limit=1,sort=nearest] psy_id at @s run tp @s ~ ~-0.05 ~
execute as @e[tag=psyDying,scores={psychosis=834}] at @s run tp @s ~ ~-0.1 ~
execute as @e[tag=psyDying,scores={psychosis=834}] at @s as @e[tag=psyScythe] if score @s psy_id = @e[tag=psyDying,scores={psychosis=834},limit=1,sort=nearest] psy_id at @s run tp @s ~ ~-0.1 ~
execute as @e[tag=psyDying,scores={psychosis=832}] at @s run tp @s ~ ~-0.2 ~
execute as @e[tag=psyDying,scores={psychosis=832}] at @s as @e[tag=psyScythe] if score @s psy_id = @e[tag=psyDying,scores={psychosis=832},limit=1,sort=nearest] psy_id at @s run tp @s ~ ~-0.2 ~
execute as @e[tag=psyDying,scores={psychosis=830}] at @s run tp @s ~ ~-0.25 ~
execute as @e[tag=psyDying,scores={psychosis=830}] at @s as @e[tag=psyScythe] if score @s psy_id = @e[tag=psyDying,scores={psychosis=830},limit=1,sort=nearest] psy_id at @s run tp @s ~ ~-0.25 ~
execute as @e[tag=psyDying,scores={psychosis=828}] at @s run tp @s ~ ~-0.25 ~
execute as @e[tag=psyDying,scores={psychosis=828}] at @s as @e[tag=psyScythe] if score @s psy_id = @e[tag=psyDying,scores={psychosis=828},limit=1,sort=nearest] psy_id at @s run tp @s ~ ~-0.25 ~
execute as @e[tag=psyDying,scores={psychosis=826}] at @s run tp @s ~ ~-0.2 ~
execute as @e[tag=psyDying,scores={psychosis=826}] at @s as @e[tag=psyScythe] if score @s psy_id = @e[tag=psyDying,scores={psychosis=826},limit=1,sort=nearest] psy_id at @s run tp @s ~ ~-0.2 ~
execute as @e[tag=psyDying,scores={psychosis=824}] at @s run tp @s ~ ~0.3 ~
execute as @e[tag=psyDying,scores={psychosis=824}] at @s as @e[tag=psyScythe] if score @s psy_id = @e[tag=psyDying,scores={psychosis=824},limit=1,sort=nearest] psy_id at @s run tp @s ~ ~0.3 ~
execute as @e[tag=psyDying,scores={psychosis=822}] at @s run tp @s ~ ~-0.1 ~
execute as @e[tag=psyDying,scores={psychosis=822}] at @s as @e[tag=psyScythe] if score @s psy_id = @e[tag=psyDying,scores={psychosis=822},limit=1,sort=nearest] psy_id at @s run tp @s ~ ~-0.1 ~
execute as @e[tag=psyDying,scores={psychosis=820}] at @s run tp @s ~ ~-0.2 ~
execute as @e[tag=psyDying,scores={psychosis=820}] at @s as @e[tag=psyScythe] if score @s psy_id = @e[tag=psyDying,scores={psychosis=820},limit=1,sort=nearest] psy_id at @s run tp @s ~ ~-0.2 ~
execute as @e[tag=psyDying,scores={psychosis=818}] at @s run tp @s ~ ~-0.2 ~
execute as @e[tag=psyDying,scores={psychosis=818}] at @s as @e[tag=psyScythe] if score @s psy_id = @e[tag=psyDying,scores={psychosis=818},limit=1,sort=nearest] psy_id at @s run tp @s ~ ~-0.2 ~
execute as @e[tag=psyDying,scores={psychosis=816}] at @s run tp @s ~ ~-0.25 ~
execute as @e[tag=psyDying,scores={psychosis=816}] at @s as @e[tag=psyScythe] if score @s psy_id = @e[tag=psyDying,scores={psychosis=816},limit=1,sort=nearest] psy_id at @s run tp @s ~ ~-0.25 ~
execute as @e[tag=psyDying,scores={psychosis=814}] at @s run tp @s ~ ~-0.25 ~
execute as @e[tag=psyDying,scores={psychosis=814}] at @s as @e[tag=psyScythe] if score @s psy_id = @e[tag=psyDying,scores={psychosis=814},limit=1,sort=nearest] psy_id at @s run tp @s ~ ~-0.25 ~
execute as @e[tag=psyDying,scores={psychosis=812}] at @s run tp @s ~ ~-0.3 ~
execute as @e[tag=psyDying,scores={psychosis=812}] at @s as @e[tag=psyScythe] if score @s psy_id = @e[tag=psyDying,scores={psychosis=812},limit=1,sort=nearest] psy_id at @s run tp @s ~ ~-0.3 ~
execute as @e[tag=psyDying,scores={psychosis=810}] at @s run tp @s ~ ~-0.3 ~
execute as @e[tag=psyDying,scores={psychosis=810}] at @s as @e[tag=psyScythe] if score @s psy_id = @e[tag=psyDying,scores={psychosis=810},limit=1,sort=nearest] psy_id at @s run tp @s ~ ~-0.3 ~
execute as @e[tag=psyDying,scores={psychosis=808}] at @s positioned ~ ~2.5 ~ run function psychosis:scripts/final_loot
# > Drag down head flipping
execute as @e[tag=psyDying,scores={psychosis=830}] at @s run tp @s ~ ~ ~ 8 82
execute as @e[tag=psyDying,scores={psychosis=830}] at @s run tp @s ~ ~ ~ 181 20
execute as @e[tag=psyDying,scores={psychosis=830}] at @s run tp @s ~ ~ ~ -18 -83
execute as @e[tag=psyDying,scores={psychosis=830}] at @s run tp @s ~ ~ ~ 72 17
execute as @e[tag=psyDying,scores={psychosis=830}] at @s run tp @s ~ ~ ~ -30 77
execute as @e[tag=psyDying,scores={psychosis=828}] at @s run tp @s ~ ~ ~ 168 -87
execute as @e[tag=psyDying,scores={psychosis=826}] at @s run tp @s ~ ~ ~ -24 62
execute as @e[tag=psyDying,scores={psychosis=824}] at @s run tp @s ~ ~ ~ -141 -12
execute as @e[tag=psyDying,scores={psychosis=822}] at @s run tp @s ~ ~ ~ 94 -17
execute as @e[tag=psyDying,scores={psychosis=820}] at @s run tp @s ~ ~ ~ -118 -64
execute as @e[tag=psyDying,scores={psychosis=818}] at @s run tp @s ~ ~ ~ -9 -52
execute as @e[tag=psyDying,scores={psychosis=816}] at @s run tp @s ~ ~ ~ 105 -82
execute as @e[tag=psyDying,scores={psychosis=814}] at @s run tp @s ~ ~ ~ -104 -51
execute as @e[tag=psyDying,scores={psychosis=812}] at @s run tp @s ~ ~ ~ -172 -22
execute as @e[tag=psyDying,scores={psychosis=811}] at @s run tp @s ~ ~ ~ 180 -76
execute as @e[tag=psyDying,scores={psychosis=810}] at @s run tp @s ~ ~ ~ -71 -82
execute as @e[tag=psyDying,scores={psychosis=809}] at @s run tp @s ~ ~ ~ 166 -90
# > Final bit (by players cursed with psychosis greater than 72003). Spreadplayers before jumpscare in case they are in the air so jumpscare doesn't work
scoreboard players remove @a[scores={psychosis=72004..}] psychosis 1
execute as @a[scores={psychosis=72063..72078}] at @s as @e[tag=psyReaper] if score @s psy_id = @a[scores={psychosis=72063..72073},limit=1,sort=nearest] psy_id at @s run function psychosis:scripts/creature_tick
execute as @a[scores={psychosis=72062}] at @s as @e[tag=psyReaper] if score @s psy_id = @a[scores={psychosis=72062},limit=1,sort=nearest] psy_id run function psychosis:scripts/kill_creature
execute as @a[scores={psychosis=72004}] at @s run function psychosis:scripts/jumpscare
scoreboard players remove @e[tag=psyScare,scores={psychosis=1..}] psychosis 1
execute as @e[tag=psyScare,scores={psychosis=1..},type=area_effect_cloud] at @s as @a if score @s psy_id = @e[tag=psyScare,scores={psychosis=1..},type=area_effect_cloud,limit=1,sort=nearest] psy_id run tp @s @e[tag=psyScare,scores={psychosis=1..},type=area_effect_cloud,limit=1,sort=nearest]
execute as @e[tag=psyScare,scores={psychosis=0}] at @s run function psychosis:scripts/kill_creature

#Enderman kill if skeleton is dead (should be run after all skeleton death functions). Try to make sure only enderman die when skeleton die, not multikill somehwere or mgiht be buggy
scoreboard players set @e[tag=psyCreature,type=minecraft:enderman] psy_check 1
execute as @e[tag=psyCreature,type=minecraft:enderman] at @s as @e[tag=psyCreature,type=minecraft:skeleton] if score @s psy_id = @e[tag=psyCreature,type=minecraft:enderman,limit=1,sort=nearest] psy_id run scoreboard players set @e[tag=psyCreature,type=minecraft:enderman,limit=1,sort=nearest] psy_check 0
execute as @e[tag=psyCreature,type=minecraft:enderman,scores={psy_check=1}] run function psychosis:scripts/kill_creature

#Wither skeleton kill if skeleton is dead
scoreboard players set @e[tag=psyCreature,type=minecraft:wither_skeleton] psy_check 1
execute as @e[tag=psyCreature,type=minecraft:wither_skeleton] at @s as @e[tag=psyCreature,type=minecraft:skeleton] if score @s psy_id = @e[tag=psyCreature,type=minecraft:wither_skeleton,limit=1,sort=nearest] psy_id run scoreboard players set @e[tag=psyCreature,type=minecraft:wither_skeleton,limit=1,sort=nearest] psy_check 0
execute as @e[tag=psyCreature,type=minecraft:wither_skeleton,scores={psy_check=1}] run function psychosis:scripts/kill_creature

#psyDying kill is guarenteed. psyReaper will run a check to look for player
scoreboard players set @e[tag=psyReaper,type=minecraft:wither_skeleton] psy_check 1
execute as @e[tag=psyReaper,type=minecraft:wither_skeleton] at @s as @e[type=player,gamemode=!spectator,scores={psychosis=72003..}] if score @s psy_id = @e[tag=psyReaper,type=minecraft:wither_skeleton,limit=1,sort=nearest] psy_id run scoreboard players set @e[tag=psyReaper,type=minecraft:wither_skeleton,limit=1,sort=nearest] psy_check 0
execute as @e[tag=psyReaper,type=minecraft:wither_skeleton,scores={psy_check=1}] run function psychosis:scripts/kill_creature

#psyScythe will run a check to look for player
scoreboard players set @e[tag=psyScythe,type=minecraft:armor_stand] psy_check 1
execute as @e[tag=psyScythe,type=minecraft:armor_stand] at @s as @e[type=player,gamemode=!spectator,scores={psychosis=72003..}] if score @s psy_id = @e[tag=psyScythe,type=minecraft:armor_stand,limit=1,sort=nearest] psy_id run scoreboard players set @e[tag=psyScythe,type=minecraft:armor_stand,limit=1,sort=nearest] psy_check 0
execute as @e[tag=psyScythe,type=minecraft:armor_stand,scores={psy_check=1}] run kill @s

#Guarentee forceload enforcement
execute as @e[tag=psyCreature] at @s run function psychosis:scripts/check_forceload
execute as @e[tag=psyHead] at @s run function psychosis:scripts/check_forceload
execute as @e[tag=psyDying] at @s run function psychosis:scripts/check_forceload
execute as @e[tag=psyReaper] at @s run function psychosis:scripts/check_forceload
execute as @e[tag=psyScythe] at @s run function psychosis:scripts/check_forceload
