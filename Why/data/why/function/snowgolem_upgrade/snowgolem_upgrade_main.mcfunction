#Snowgolem Upgrade
execute as @e[tag=suProj,scores={snowgolem_upgrade=199}] run data modify entity @s Air set value 0s
execute as @e[tag=suProj,scores={snowgolem_upgrade=198}] run data modify entity @s Air set value 1s
scoreboard players remove @e[tag=suProj,type=!pufferfish,type=!shulker_bullet,type=!player,type=!snow_golem,scores={snowgolem_upgrade=1..}] snowgolem_upgrade 1
kill @e[tag=suProj,type=!pufferfish,type=!shulker_bullet,type=!player,type=!snow_golem,scores={snowgolem_upgrade=0}]

execute if entity @e[type=snowball,tag=!suProcessed] at @e[type=snow_golem] unless data entity @e[type=snow_golem,limit=1,sort=nearest] {CustomName:"normal"} as @e[type=snowball,tag=!suProcessed] run function why:snowgolem_upgrade/check_snowball

tag @e[type=snowball,tag=!suProcessed] add suProcessed

execute as @e[type=minecraft:snow_golem,nbt=!{active_effects:[{id:"minecraft:fire_resistance"}]}] unless data entity @s {CustomName:"normal"} run effect give @s fire_resistance infinite 0 false
execute as @e[type=minecraft:snow_golem,nbt=!{active_effects:[{id:"minecraft:regeneration"}]}] unless data entity @s {CustomName:"normal"} run effect give @s regeneration infinite 0 false
execute as @e[type=minecraft:snow_golem,nbt=!{active_effects:[{id:"minecraft:resistance"}]}] unless data entity @s {CustomName:"normal"} run effect give @s resistance infinite 1 false