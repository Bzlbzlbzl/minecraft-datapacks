#Tags all nearby arrows to be nearbyShot; tags the closest nearbyShot arrow tpShot (regardless of arrow type); tags tpShot to be either enderpearlArrow or tpArrow based on type; sets tpArrow's tp_bow_id score to player's score
tag @e[type=arrow,nbt=!{inGround:1b},distance=..5,tag=!tpProcessed] add nearbyShot
tag @e[type=spectral_arrow,nbt=!{inGround:1b},distance=..5,tag=!tpProcessed] add nearbyShot
tag @e[tag=nearbyShot,limit=1,sort=nearest] add tpShot
execute as @e[tag=tpShot,limit=1,sort=nearest] unless entity @s[type=spectral_arrow] run tag @s add enderpearlArrow
execute as @e[tag=tpShot,limit=1,sort=nearest] unless entity @s[type=arrow] run tag @s add tpArrow
scoreboard players operation @e[tag=tpShot,limit=1,sort=nearest] tp_bow_id = @s tp_bow_id
