# Creates a claimed land, summoning a banner and marker with the same powers_id
playsound minecraft:entity.firework_rocket.large_blast_far master @a ~ ~ ~ 1 1
particle minecraft:totem_of_undying ~ ~ ~ 0.5 0.5 0.5 3.2 50 force
particle minecraft:totem_of_undying ~ ~ ~ 0.5 0.5 0.5 10.0 30 force
#particle minecraft:happy_villager ~ ~0.2 ~ 5.0 0.2 5.0 1 30 force
summon armor_stand ~ ~-0.5 ~0.275 {Team:"president",Silent:1b,Invulnerable:1b,Glowing:1b,Marker:1b,Invisible:1b,Tags:["presFlag","presSpawned"],Pose:{RightArm:[0f,90f,0f]},equipment:{head:{id:"minecraft:blue_banner",count:1,components:{"minecraft:banner_patterns":[{pattern:"minecraft:stripe_center",color:"light_gray"},{pattern:"minecraft:straight_cross",color:"light_gray"},{pattern:"minecraft:straight_cross",color:"white"}]}}}}
scoreboard players operation @e[type=armor_stand,tag=presSpawned] powers_id = @s powers_id
scoreboard players set @e[type=armor_stand,tag=presSpawned] pres_cd 40
tag @e[type=armor_stand,tag=presSpawned,tag=presFlag] remove presSpawned
summon marker ~ ~ ~ {Tags:["presMarker","presSpawned"]}
scoreboard players operation @e[type=marker,tag=presSpawned] powers_id = @s powers_id
scoreboard players set @e[type=marker,tag=presSpawned] pres_cd 1
tag @e[type=marker,tag=presSpawned,tag=presMarker] remove presSpawned
data modify entity @s NoGravity set value 1b
data modify entity @s Age set value -32768
tp @s ~ ~ ~ 0 0
forceload add ~ ~ ~ ~
tag @s add presSelf
# Sets the dropper's pres_bear score to 0. This is REQUIRED to make the bear spawn for the first time (also gives every1 book)
execute as @a[team=president,tag=!claimed] if score @s powers_id = @e[type=item,tag=presSelf,limit=1] powers_id run scoreboard players set @s pres_bears 0
execute as @a[team=president,tag=!claimed] if score @s powers_id = @e[type=item,tag=presSelf,limit=1] powers_id run tag @s add claimed
execute at @s as @a[distance=..40.2] unless score @s powers_id = @e[type=item,tag=presSelf,limit=1] powers_id at @s run summon item ~ ~ ~ {Tags:["presBookSpawned"],Item:{id:"minecraft:written_book",count:1,components:{"minecraft:written_book_content":{title:"",author:""}}}}
execute as @e[type=item,tag=presBookSpawned] run data modify entity @s Item set from entity @e[type=item,tag=presSelf,limit=1] Item
execute as @e[type=item,tag=presBookSpawned] run data modify entity @s Item.components."minecraft:written_book_content".generation set value 2
tag @s remove presSelf

#Summons markers to randomize song selection
summon marker ~ ~ ~ {Tags:["presSong1","presSongMarker"]}
summon marker ~ ~ ~ {Tags:["presSong2","presSongMarker"]}
summon marker ~ ~ ~ {Tags:["presSong3","presSongMarker"]}
tag @e[type=marker,tag=presSongMarker,limit=1,sort=random] add presCurr
execute if entity @e[tag=presCurr,tag=presSong1] run function powers:songs/play_french
execute if entity @e[tag=presCurr,tag=presSong2] run function powers:songs/play_usa
execute if entity @e[tag=presCurr,tag=presSong3] run function powers:songs/play_ussr
kill @e[type=marker,tag=presSongMarker]
