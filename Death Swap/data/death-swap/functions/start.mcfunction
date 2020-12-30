#Starts death swap
scoreboard players set @a death_swap -1
scoreboard players set %next death_swap -1
scoreboard players set %swap death_swap 0
scoreboard players set %countdown death_swap 6000

#Generates two random numbers from 0 to 2^20 then decides if its negative or positive by *= %neg (-1) if the randomly selected cloud received the 2^20 (1048576)
summon area_effect_cloud ~ ~ ~ {Tags:["dsPos"]}
summon area_effect_cloud ~ ~ ~ {Tags:["dsPos"]}
summon area_effect_cloud ~ ~ ~ {Tags:["dsInc"]}
scoreboard players set @e[tag=dsInc] death_swap 1
function death-swap:scripts/gen_num
scoreboard players operation %pos_x death_swap = @e[type=minecraft:area_effect_cloud,tag=dsPos,limit=1,sort=random] death_swap
execute as @e[tag=dsPos,limit=1,sort=random] if score @s death_swap matches 1048576.. run scoreboard players operation %pos_x death_swap *= %neg death_swap
scoreboard players reset @e[tag=dsPos]
scoreboard players set @e[tag=dsInc] death_swap 1
function death-swap:scripts/gen_num
scoreboard players operation %pos_z death_swap = @e[type=minecraft:area_effect_cloud,tag=dsPos,limit=1,sort=random] death_swap
execute as @e[tag=dsPos,limit=1,sort=random] if score @s death_swap matches 1048576.. run scoreboard players operation %pos_z death_swap *= %neg death_swap

#Moves the dsInc cloud to the position and moves everything there
execute as @e[type=minecraft:area_effect_cloud,tag=dsInc,limit=1] run function death-swap:scripts/move

#Players to surface, player heal
execute as @r at @s run spreadplayers ~ ~ 5 40 false @a
effect give @a minecraft:saturation 1 100
effect give @a minecraft:instant_health 1 100

#Makes a new bossbar
bossbar add ds_timer {"text":"Time Left","color":"gold","bold":true}
bossbar set minecraft:ds_timer players @a
bossbar set minecraft:ds_timer color green
execute store result bossbar minecraft:ds_timer max run scoreboard players get %countdown death_swap

#Clears players' inventory; sets them to survival; takes away all advancements
clear @a
gamemode survival @a
advancement revoke @a everything