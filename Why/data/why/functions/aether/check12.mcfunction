#Runs all 12 checks, will change the score of aether_water to stop find_water if a check is found
scoreboard players set @s aether_check 0

function why:aether/checks/check_north
execute unless score @s aether_check matches 1 run function why:aether/checks/check_south
execute unless score @s aether_check matches 1 run function why:aether/checks/check_east
execute unless score @s aether_check matches 1 run function why:aether/checks/check_west

execute unless score @s aether_check matches 1 run function why:aether/checks/check_mid_north
execute unless score @s aether_check matches 1 run function why:aether/checks/check_mid_south
execute unless score @s aether_check matches 1 run function why:aether/checks/check_mid_east
execute unless score @s aether_check matches 1 run function why:aether/checks/check_mid_west

execute unless score @s aether_check matches 1 run function why:aether/checks/check_up_north
execute unless score @s aether_check matches 1 run function why:aether/checks/check_up_south
execute unless score @s aether_check matches 1 run function why:aether/checks/check_up_east
execute unless score @s aether_check matches 1 run function why:aether/checks/check_up_west

#Checks for existent portal if is one the kills self
execute if entity @s[tag=aetherNorth] at @s positioned ~0.5 ~ ~ if entity @e[tag=aetherCheck,tag=aetherPortal,type=area_effect_cloud,distance=..0.01] run tag @s add aetherFailed
execute if entity @s[tag=aetherSouth] at @s positioned ~0.5 ~ ~1 if entity @e[tag=aetherCheck,tag=aetherPortal,type=area_effect_cloud,distance=..0.01] run tag @s add aetherFailed
execute if entity @s[tag=aetherEast] at @s positioned ~1 ~ ~0.5 if entity @e[tag=aetherCheck,tag=aetherPortal,type=area_effect_cloud,distance=..0.01] run tag @s add aetherFailed
execute if entity @s[tag=aetherWest] at @s positioned ~ ~ ~0.5 if entity @e[tag=aetherCheck,tag=aetherPortal,type=area_effect_cloud,distance=..0.01] run tag @s add aetherFailed

execute if entity @s[tag=aetherMidNorth] at @s positioned ~0.5 ~-1 ~ if entity @e[tag=aetherCheck,tag=aetherPortal,type=area_effect_cloud,distance=..0.01] run tag @s add aetherFailed
execute if entity @s[tag=aetherMidSouth] at @s positioned ~0.5 ~-1 ~1 if entity @e[tag=aetherCheck,tag=aetherPortal,type=area_effect_cloud,distance=..0.01] run tag @s add aetherFailed
execute if entity @s[tag=aetherMidEast] at @s positioned ~1 ~-1 ~0.5 if entity @e[tag=aetherCheck,tag=aetherPortal,type=area_effect_cloud,distance=..0.01] run tag @s add aetherFailed
execute if entity @s[tag=aetherMidWest] at @s positioned ~ ~-1 ~0.5 if entity @e[tag=aetherCheck,tag=aetherPortal,type=area_effect_cloud,distance=..0.01] run tag @s add aetherFailed

execute if entity @s[tag=aetherUpNorth] at @s positioned ~0.5 ~-2 ~ if entity @e[tag=aetherCheck,tag=aetherPortal,type=area_effect_cloud,distance=..0.01] run tag @s add aetherFailed
execute if entity @s[tag=aetherUpSouth] at @s positioned ~0.5 ~-2 ~1 if entity @e[tag=aetherCheck,tag=aetherPortal,type=area_effect_cloud,distance=..0.01] run tag @s add aetherFailed
execute if entity @s[tag=aetherUpEast] at @s positioned ~1 ~-2 ~0.5 if entity @e[tag=aetherCheck,tag=aetherPortal,type=area_effect_cloud,distance=..0.01] run tag @s add aetherFailed
execute if entity @s[tag=aetherUpWest] at @s positioned ~ ~-2 ~0.5 if entity @e[tag=aetherCheck,tag=aetherPortal,type=area_effect_cloud,distance=..0.01] run tag @s add aetherFailed

execute if entity @s[tag=aetherFailed] run scoreboard players set @s aether_check 0

execute if score @s aether_check matches 1 run scoreboard players set @p[tag=aetherPlayer] aether_water 0
execute if score @s[tag=!aetherFailed] aether_check matches 0 run tag @s add aetherFailed
