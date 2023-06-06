#Snowgolem Upgrade
execute as @e[tag=suProj,scores={snowgolem_upgrade=199}] run data modify entity @s Air set value 0s
execute as @e[tag=suProj,scores={snowgolem_upgrade=198}] run data modify entity @s Air set value 1s
scoreboard players remove @e[tag=suProj,type=!pufferfish,type=!shulker_bullet,type=!player,type=!snow_golem,scores={snowgolem_upgrade=1..}] snowgolem_upgrade 1
kill @e[tag=suProj,type=!pufferfish,type=!shulker_bullet,type=!player,type=!snow_golem,scores={snowgolem_upgrade=0}]

execute if entity @e[type=snowball,tag=!suProcessed] at @e[type=snow_golem] as @e[type=snowball,tag=!suProcessed] run function why:snowgolem_upgrade/check_snowball

tag @e[type=snowball,tag=!suProcessed] add suProcessed

effect give @e[type=minecraft:snow_golem,nbt=!{ActiveEffects:[{Id:12}]}] fire_resistance infinite 0 false
effect give @e[type=minecraft:snow_golem,nbt=!{ActiveEffects:[{Id:10}]}] regeneration infinite 0 false
effect give @e[type=minecraft:snow_golem,nbt=!{ActiveEffects:[{Id:11}]}] resistance infinite 1 false