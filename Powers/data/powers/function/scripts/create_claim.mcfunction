# Creates a claimed land, summoning a banner and marker with the same powers_id
playsound minecraft:entity.firework_rocket.large_blast_far master @a ~ ~ ~ 1 1
particle minecraft:totem_of_undying ~ ~ ~ 0.5 0.5 0.5 3.2 50 force
particle minecraft:totem_of_undying ~ ~ ~ 0.5 0.5 0.5 10.0 30 force
#particle minecraft:happy_villager ~ ~0.2 ~ 5.0 0.2 5.0 1 30 force
summon armor_stand ~ ~-0.5 ~0.275 {Team:"president",Silent:1b,Invulnerable:1b,Glowing:1b,Marker:1b,Invisible:1b,Tags:["presFlag","presSpawned"],Pose:{RightArm:[0f,90f,0f]},ArmorItems:[{},{},{},{id:"minecraft:blue_banner",count:1,components:{"minecraft:banner_patterns":[{pattern:"minecraft:stripe_center",color:"light_gray"},{pattern:"minecraft:straight_cross",color:"light_gray"},{pattern:"minecraft:straight_cross",color:"white"}]}}]}
scoreboard players operation @e[type=armor_stand,tag=presSpawned] powers_id = @s powers_id
scoreboard players set @e[type=armor_stand,tag=presSpawned] pres_cd 40
tag @e[type=armor_stand,tag=presSpawned,tag=presFlag] remove presSpawned
summon marker ~ ~ ~ {Tags:["presMarker","presSpawned"]}
scoreboard players operation @e[type=marker,tag=presSpawned] powers_id = @s powers_id
scoreboard players set @e[type=marker,tag=presSpawned] pres_cd 1
tag @e[type=marker,tag=presSpawned,tag=presMarker] remove presSpawned
data modify entity @s NoGravity set value 1b
tp @s ~ ~ ~ 0 0