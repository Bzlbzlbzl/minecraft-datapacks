### Starts death tag game
#Generates two random number from 0 to 2^20 then decides if its negative or positive
summon area_effect_cloud ~ ~ ~ {Tags:["dtPos"]}
summon area_effect_cloud ~ ~ ~ {Tags:["dtPos"]}
summon area_effect_cloud ~ ~ ~ {Tags:["dtInc"]}
scoreboard players set @e[tag=dtInc] death_tag 1
function death-tag:scripts/gen_num
scoreboard players operation %pos_x death_tag = @e[type=minecraft:area_effect_cloud,tag=dtPos,limit=1,sort=random] death_tag
scoreboard players reset @e[tag=dtPos]
scoreboard players set @e[tag=dtInc] death_tag 1
function death-tag:scripts/gen_num
scoreboard players operation %pos_z death_tag = @e[type=minecraft:area_effect_cloud,tag=dtPos,limit=1,sort=random] death_tag

#Moves the dtInc cloud to the position and moves everything there
execute as @e[type=minecraft:area_effect_cloud,tag=dtInc,limit=1] run function death-tag:scripts/move

#Players to surface, player heal
execute as @r[tag=!dtIt] at @s run spreadplayers ~ ~ 1 5 false @a[tag=!dtIt]
execute as @r[tag=dtIt] at @s run spreadplayers ~ ~ 1 5 false @a[tag=dtIt]
effect give @a minecraft:saturation 1 100
effect give @a minecraft:instant_health 1 100

#Resets previous bossbar and makes a new one
bossbar remove minecraft:dt_timer
bossbar add dt_timer {"text":"Time Left","color":"gold","bold":true}
bossbar set minecraft:dt_timer players @a
bossbar set minecraft:dt_timer color red
execute store result bossbar minecraft:dt_timer max run scoreboard players get %time death_tag

#Sets %timer to the %time to start the game
scoreboard players operation %timer death_tag = %time death_tag
