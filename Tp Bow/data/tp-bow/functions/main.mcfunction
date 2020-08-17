# # # TP Bow - By Bzlbzlbzl # # #
#Updates ID of all players 
execute as @a unless score @s tp_bow_id matches 0.. run function tp-bow:update_id

#Sets up tp shots; plays particle for normal arrow shot; reduces tpArrow damage to 0
execute as @a[nbt={SelectedItem:{id:"minecraft:bow",tag:{tp-bow:1b}}},scores={tp_bow_use=1},nbt=!{Inventory:[{Slot:-106b,id:"minecraft:bow"}]}] at @s anchored eyes positioned ^ ^ ^ run function tp-bow:tp_setup
execute as @a[nbt={SelectedItem:{id:"minecraft:bow",tag:{tp-bow:1b}}},scores={tp_bow_use=1},nbt=!{Inventory:[{Slot:-106b,id:"minecraft:bow"}]}] at @s unless entity @e[type=minecraft:spectral_arrow,tag=tpShot,distance=..5] run function tp-bow:circle
execute as @a[nbt={SelectedItem:{id:"minecraft:bow",tag:{tp-bow:1b}}},scores={tp_bow_use=1},nbt=!{Inventory:[{Slot:-106b,id:"minecraft:bow"}]}] at @s unless entity @e[type=minecraft:spectral_arrow,tag=tpShot,distance=..5] run particle minecraft:witch ~ ~-0.1 ~ 0 0 0 1 80
execute as @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:bow",tag:{tp-bow:1b}}]},scores={tp_bow_use=1},nbt=!{SelectedItem:{id:"minecraft:bow"}}] at @s anchored eyes positioned ^ ^ ^ run function tp-bow:tp_setup
execute as @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:bow",tag:{tp-bow:1b}}]},scores={tp_bow_use=1},nbt=!{SelectedItem:{id:"minecraft:bow"}}] at @s unless entity @e[type=minecraft:spectral_arrow,tag=tpShot,distance=..5] run function tp-bow:circle
execute as @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:bow",tag:{tp-bow:1b}}]},scores={tp_bow_use=1},nbt=!{SelectedItem:{id:"minecraft:bow"}}] at @s unless entity @e[type=minecraft:spectral_arrow,tag=tpShot,distance=..5] run particle minecraft:witch ~ ~-0.1 ~ 0 0 0 1 80
execute as @e[type=spectral_arrow,tag=!tpProcessed,tag=tpArrow] run data modify entity @s damage set value 0
execute as @e[type=spectral_arrow,tag=tpArrow] run data modify entity @s Fire set value 0

#Replaces all enderpearlArrows with enderpearls (with same motion and owner); plays sound effect; kills arrow
execute as @e[type=arrow,tag=enderpearlArrow] at @s run summon minecraft:ender_pearl ~ ~ ~ {Tags:["tpPearl"]}
execute as @e[type=arrow,tag=enderpearlArrow] at @s run data modify entity @e[type=minecraft:ender_pearl,tag=tpPearl,limit=1,sort=nearest] Motion set from entity @s Motion
execute as @e[type=arrow,tag=enderpearlArrow] at @s run data modify entity @e[type=minecraft:ender_pearl,tag=tpPearl,limit=1,sort=nearest] Owner set from entity @s Owner
execute as @e[type=arrow,tag=enderpearlArrow] at @s run playsound minecraft:entity.enderman.hurt master @a ~ ~ ~ 1
kill @e[type=arrow,tag=enderpearlArrow]

#Teleports all players to their tpArrow (keeping rotation); makes particles; plays sound; kills arrow (the other ones arent in the function because particles and the sound dont run at the player due to tp)
execute at @a as @e[type=spectral_arrow,tag=tpArrow,nbt={inGround:1b}] if score @p tp_bow_id = @s tp_bow_id run function tp-bow:arrow_tp
execute at @a as @e[type=spectral_arrow,tag=tpArrow,nbt={inGround:1b}] if score @p tp_bow_id = @s tp_bow_id run particle minecraft:witch ~ ~-0.1 ~ 0.8 0 0.8 3 200
execute at @a as @e[type=spectral_arrow,tag=tpArrow,nbt={inGround:1b}] if score @p tp_bow_id = @s tp_bow_id run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1
execute at @a as @e[type=spectral_arrow,tag=tpArrow,nbt={inGround:1b}] if score @p tp_bow_id = @s tp_bow_id run kill @s

#Fancy projectile particles!
execute at @e[type=minecraft:ender_pearl,tag=tpPearl] run particle minecraft:dust 1 0 1 2 ~ ~ ~ 0 0 0 0 2
execute at @e[type=spectral_arrow,tag=tpArrow] run particle minecraft:end_rod ~ ~ ~ 0 0 0 0.05 1
execute at @e[type=spectral_arrow,tag=tpArrow] run particle minecraft:dragon_breath ~ ~ ~ 0 0 0 0.03 1

#Floorcrafting the tp bow
execute as @e[type=item,nbt={Item:{id:"minecraft:bow",tag:{Damage:0}}},nbt=!{Item:{tag:{tp-bow:1b}}}] at @s run execute as @e[type=item,nbt={Item:{id:"minecraft:chorus_flower",Count:1b}},limit=1,sort=nearest,distance=0..1] run execute as @e[type=item,nbt={Item:{id:"minecraft:end_crystal",Count:1b}},limit=1,sort=nearest,distance=0..1] run function tp-bow:floorcraft

#Tag and score cleanup
tag @e[tag=nearbyShot] remove nearbyShot
tag @e[tag=tpShot] remove tpShot
tag @e[type=arrow,tag=!tpProcessed] add tpProcessed
tag @e[type=spectral_arrow,tag=!tpProcessed] add tpProcessed
tag @e[tag=tpCrafted] remove tpCrafted
scoreboard players remove @a[scores={tp_bow_use=1..}] tp_bow_use 1