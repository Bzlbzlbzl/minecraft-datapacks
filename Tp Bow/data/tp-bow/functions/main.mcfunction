
#Updates ID of all players 
execute as @a unless score @s tp_bow_id matches 0.. run function tp-bow:update_id

#Tags all nearby arrows to be nearbyShot; tags the closest nearbyShot arrow tpShot (regardless of arrow type); tags tpShot to be either enderpearlArrow or tpArrow based on type; sets tpArrow's tp_bow_id score to player's score
execute as @a[nbt={SelectedItem:{tag:{tp-bow:1b}}},scores={tp_bow_use=1}] at @s anchored eyes positioned ^ ^ ^ run tag @e[type=arrow,nbt=!{inGround:1b},distance=..5,tag=!tpProcessed] add nearbyShot
execute as @a[nbt={SelectedItem:{tag:{tp-bow:1b}}},scores={tp_bow_use=1}] at @s anchored eyes positioned ^ ^ ^ run tag @e[type=spectral_arrow,nbt=!{inGround:1b},distance=..5,tag=!tpProcessed] add nearbyShot
execute as @a[nbt={SelectedItem:{tag:{tp-bow:1b}}},scores={tp_bow_use=1}] at @s anchored eyes positioned ^ ^ ^ run tag @e[tag=nearbyShot,limit=1,sort=nearest] add tpShot
execute as @a[nbt={SelectedItem:{tag:{tp-bow:1b}}},scores={tp_bow_use=1}] at @s anchored eyes positioned ^ ^ ^ run execute as @e[tag=tpShot,limit=1,sort=nearest] unless entity @s[type=spectral_arrow] run tag @s add enderpearlArrow
execute as @a[nbt={SelectedItem:{tag:{tp-bow:1b}}},scores={tp_bow_use=1}] at @s anchored eyes positioned ^ ^ ^ run execute as @e[tag=tpShot,limit=1,sort=nearest] unless entity @s[type=arrow] run tag @s add tpArrow
execute as @a[nbt={SelectedItem:{tag:{tp-bow:1b}}},scores={tp_bow_use=1}] at @s anchored eyes positioned ^ ^ ^ run scoreboard players operation @e[tag=tpShot,limit=1,sort=nearest] tp_bow_id = @s tp_bow_id
execute as @a[nbt={SelectedItem:{tag:{tp-bow:1b}}},scores={tp_bow_use=1}] at @s unless entity @e[type=minecraft:spectral_arrow,tag=tpShot,distance=..5] run function tp-bow:circle
execute as @a[nbt={SelectedItem:{tag:{tp-bow:1b}}},scores={tp_bow_use=1}] at @s unless entity @e[type=minecraft:spectral_arrow,tag=tpShot,distance=..5] run particle minecraft:witch ~ ~-0.1 ~ 0 0 0 1 80
execute as @e[type=spectral_arrow,tag=!tpProcessed,tag=tpArrow] run data modify entity @s damage set value 0
execute as @e[type=spectral_arrow,tag=!tpProcessed,tag=tpArrow] run data modify entity @s Fire set value 0

#Replaces all enderpearlArrows with enderpearls (with same motion and owner); plays sound effect
execute as @e[type=arrow,tag=enderpearlArrow] at @s run summon minecraft:ender_pearl ~ ~ ~ {Tags:["tpPearl"]}
execute as @e[type=arrow,tag=enderpearlArrow] at @s run data modify entity @e[type=minecraft:ender_pearl,tag=tpPearl,limit=1,sort=nearest] Motion set from entity @s Motion
#execute as @e[type=arrow,tag=enderpearlArrow] at @s run data modify entity @e[type=minecraft:ender_pearl,tag=tpPearl,limit=1,sort=nearest] Owner set from entity @s Owner
execute as @e[type=arrow,tag=enderpearlArrow] at @s run playsound minecraft:entity.enderman.hurt master @a ~ ~ ~ 1
kill @e[type=arrow,tag=enderpearlArrow]

#Teleports all players to their tpArrow (keeping rotation); plays sound effect
execute at @a as @e[type=spectral_arrow,tag=tpArrow,nbt={inGround:1b}] if score @p tp_bow_id = @s tp_bow_id run data modify entity @s Rotation set from entity @p Rotation
execute at @a as @e[type=spectral_arrow,tag=tpArrow,nbt={inGround:1b}] if score @p tp_bow_id = @s tp_bow_id run particle minecraft:witch ~ ~ ~ 0.4 0 0.4 1 100
execute at @a as @e[type=spectral_arrow,tag=tpArrow,nbt={inGround:1b}] if score @p tp_bow_id = @s tp_bow_id run particle minecraft:reverse_portal ~ ~1 ~ 0.3 0.7 0.3 0.4 50
execute at @a as @e[type=spectral_arrow,tag=tpArrow,nbt={inGround:1b}] if score @p tp_bow_id = @s tp_bow_id run tp @p @s
execute at @a as @e[type=spectral_arrow,tag=tpArrow,nbt={inGround:1b}] if score @p tp_bow_id = @s tp_bow_id run particle minecraft:witch ~ ~ ~ 0.8 0 0.8 3 200
kill @e[type=spectral_arrow,tag=tpArrow,nbt={inGround:1b}]

#Fancy projectile particles!
scoreboard players add %particle tp_bow_use 1
execute at @e[type=minecraft:ender_pearl,tag=tpPearl] run particle minecraft:dust 1 0 1 2 ~ ~ ~ 0 0 0 0 2
execute at @e[type=spectral_arrow,tag=tpArrow] run particle minecraft:end_rod ~ ~ ~ 0 0 0 0.05 1
execute at @e[type=spectral_arrow,tag=tpArrow] if score %particle tp_bow_use matches 2 run particle minecraft:dragon_breath ~ ~ ~ 0 0 0 0.03 3
execute if score %particle tp_bow_use matches 2.. run scoreboard players set %particle tp_bow_use 0

#Tag and score cleanup
tag @e[tag=nearbyShot] remove nearbyShot
tag @e[tag=tpShot] remove tpShot
tag @e[type=arrow,tag=!tpProcessed] add tpProcessed
tag @e[type=spectral_arrow,tag=!tpProcessed] add tpProcessed
scoreboard players remove @a[scores={tp_bow_use=1..}] tp_bow_use 1