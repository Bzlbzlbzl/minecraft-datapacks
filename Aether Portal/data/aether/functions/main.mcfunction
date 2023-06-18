#Aether
#Finds water recursively. aether_water becomes the increment for the recursion. Will not allow duplicates. 
execute as @a[scores={aether_water=1..}] run scoreboard players set @s aether_water 40
execute as @a[scores={aether_water=1..}] at @s anchored eyes positioned ^ ^ ^0.4 run function aether:scripts/find_water

#Tries to make portal if drop water bucket
execute as @a[scores={aether_drop=1..}] at @s anchored eyes as @e[type=item,nbt={Item:{id:"minecraft:water_bucket"}},limit=1,sort=nearest] at @s run function aether:scripts/find_portal

#Kills any aetherFailed clouds
kill @e[tag=aetherFailed,type=area_effect_cloud]

#Converts mid and upper to lower. ALSO KILLS DUPLICATES
execute as @e[tag=aetherCheck,tag=!aetherPortal,tag=aetherMidNorth,type=area_effect_cloud] at @s run function aether:scripts/transitions/mid_north_to_north
execute as @e[tag=aetherCheck,tag=!aetherPortal,tag=aetherMidSouth,type=area_effect_cloud] at @s run function aether:scripts/transitions/mid_south_to_south
execute as @e[tag=aetherCheck,tag=!aetherPortal,tag=aetherMidEast,type=area_effect_cloud] at @s run function aether:scripts/transitions/mid_east_to_east
execute as @e[tag=aetherCheck,tag=!aetherPortal,tag=aetherMidWest,type=area_effect_cloud] at @s run function aether:scripts/transitions/mid_west_to_west
execute as @e[tag=aetherCheck,tag=!aetherPortal,tag=aetherUpNorth,type=area_effect_cloud] at @s run function aether:scripts/transitions/up_north_to_north
execute as @e[tag=aetherCheck,tag=!aetherPortal,tag=aetherUpSouth,type=area_effect_cloud] at @s run function aether:scripts/transitions/up_south_to_south
execute as @e[tag=aetherCheck,tag=!aetherPortal,tag=aetherUpEast,type=area_effect_cloud] at @s run function aether:scripts/transitions/up_east_to_east
execute as @e[tag=aetherCheck,tag=!aetherPortal,tag=aetherUpWest,type=area_effect_cloud] at @s run function aether:scripts/transitions/up_west_to_west
#Converts to two directions (NW). ALSO KILLS DUPLICATES
execute as @e[tag=aetherCheck,tag=!aetherPortal,tag=aetherSouth,type=area_effect_cloud] at @s run function aether:scripts/transitions/south_to_north
execute as @e[tag=aetherCheck,tag=!aetherPortal,tag=aetherEast,type=area_effect_cloud] at @s run function aether:scripts/transitions/east_to_west
#Centers the two directions (NW)
execute as @e[tag=aetherCheck,tag=!aetherPortal,tag=aetherNorth,type=area_effect_cloud] at @s run tp @s ~0.5 ~ ~
execute as @e[tag=aetherCheck,tag=!aetherPortal,tag=aetherWest,type=area_effect_cloud] at @s run tp @s ~ ~ ~0.5
#Creates portal water if aetherCheck has no aetherPortal tag
execute as @e[tag=aetherCheck,tag=!aetherPortal,tag=aetherNorth,type=area_effect_cloud] at @s run fill ~ ~ ~ ~ ~2 ~-1 water
execute as @e[tag=aetherCheck,tag=!aetherPortal,tag=aetherWest,type=area_effect_cloud] at @s run fill ~ ~ ~ ~-1 ~2 ~ water
#Tags all if no duplicates. ALSO SOUNDS
execute at @e[tag=aetherCheck,tag=!aetherPortal,type=area_effect_cloud] run playsound minecraft:block.amethyst_block.resonate block @a ~ ~ ~ 2 0
execute at @e[tag=aetherCheck,tag=!aetherPortal,type=area_effect_cloud] run playsound minecraft:entity.allay.ambient_with_item block @a ~ ~ ~ 1 0
execute at @e[tag=aetherCheck,tag=!aetherPortal,type=area_effect_cloud] run playsound minecraft:entity.allay.ambient_without_item block @a ~ ~ ~ 1 2
tag @e[tag=aetherCheck,tag=!aetherPortal,type=area_effect_cloud] add aetherPortal

#Kill 2 aetherPortal aether<North/West> variants if fails their specific checks
execute as @e[tag=aetherCheck,tag=aetherPortal,tag=aetherNorth,type=area_effect_cloud] at @s run function aether:scripts/checks/check_north
execute as @e[tag=aetherCheck,tag=aetherPortal,tag=aetherWest,type=area_effect_cloud] at @s run function aether:scripts/checks/check_west
execute as @e[tag=aetherCheck,tag=aetherPortal,tag=aetherNorth,type=area_effect_cloud] at @s unless score @s aether_check matches 1 run function aether:scripts/break_portal_north
execute as @e[tag=aetherCheck,tag=aetherPortal,tag=aetherWest,type=area_effect_cloud] at @s unless score @s aether_check matches 1 run function aether:scripts/break_portal_west

#Maintains structure fill as all two aetherPortal directions
execute as @e[tag=aetherCheck,tag=aetherPortal,tag=aetherNorth,type=area_effect_cloud] at @s run fill ~1 ~ ~ ~1 ~2 ~-1 structure_void replace #aether:air_water
execute as @e[tag=aetherCheck,tag=aetherPortal,tag=aetherWest,type=area_effect_cloud] at @s run fill ~ ~ ~1 ~-1 ~2 ~1 structure_void replace #aether:air_water
execute as @e[tag=aetherCheck,tag=aetherPortal,tag=aetherNorth,type=area_effect_cloud] at @s run fill ~-1 ~ ~ ~-1 ~2 ~-1 structure_void replace #aether:air_water
execute as @e[tag=aetherCheck,tag=aetherPortal,tag=aetherWest,type=area_effect_cloud] at @s run fill ~ ~ ~-1 ~-1 ~2 ~-1 structure_void replace #aether:air_water

#Aether portal player increment or removal (all 12)
execute as @a at @s if entity @e[tag=aetherCheck,tag=aetherPortal,type=area_effect_cloud,distance=..3] run function aether:scripts/increment
execute as @a[scores={aether_check=1..}] at @s unless entity @e[tag=aetherCheck,tag=aetherPortal,type=area_effect_cloud,distance=..3] run scoreboard players set @s aether_check 0

#Tp player and nausea effect and reset (nausea has to be 4 for some reason idk)
execute as @a[scores={aether_check=1}] at @s run playsound minecraft:block.portal.trigger block @s ~ ~ ~ 1 1.7
effect give @a[scores={aether_check=1..}] nausea 4 2 true
execute as @a[scores={aether_check=45}] at @s run playsound minecraft:entity.enderman.teleport block @a ~ ~ ~ 1 1 
execute as @a[scores={aether_check=45}] at @s run tp @s ~ ~250 ~
execute as @a[scores={aether_check=45}] at @s run playsound minecraft:block.portal.travel block @s ~ ~ ~ 0.1 2 0.1
execute as @a[scores={aether_check=45}] at @s run playsound minecraft:entity.enderman.teleport block @a ~ ~ ~ 1 1 
scoreboard players set @a[scores={aether_check=45}] aether_check 0

#Aether portal particles and sounds (uses aether_water as counter)
execute as @e[tag=aetherCheck,tag=aetherPortal,tag=aetherNorth,type=area_effect_cloud] at @s run particle minecraft:portal ~ ~1.5 ~ 0.5 1.5 1 1 2 normal
execute as @e[tag=aetherCheck,tag=aetherPortal,tag=aetherWest,type=area_effect_cloud] at @s run particle minecraft:portal ~ ~1.5 ~ 1 1.5 0.5 1 2 normal
scoreboard players add @e[tag=aetherCheck,tag=aetherPortal,type=area_effect_cloud] aether_water 1
execute as @e[tag=aetherCheck,tag=aetherPortal,type=area_effect_cloud,scores={aether_water=80}] at @s run playsound minecraft:block.portal.ambient block @a ~ ~ ~ 0.7 0.8
scoreboard players set @e[tag=aetherCheck,tag=aetherPortal,type=area_effect_cloud,scores={aether_water=80}] aether_water 0

#Reset aether_water (RUN AT END) This shouldn't ever run but just in case find_water doesn't set to 0 for some reason
scoreboard players set @a[scores={aether_water=1..}] aether_water 0
scoreboard players set @a[scores={aether_drop=1..}] aether_drop 0