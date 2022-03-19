## Sets up the new area ahead of time to avoid lag
#Resets the bossbar and game score in case stop function wasn't called
bossbar remove minecraft:dt_timer

#Generates two random numbers from 0 to 2^21-1 then decides if its negative or positive by *= %neg (-1) if the randomly selected cloud received the 2^20 (1048576)
summon area_effect_cloud ~ ~ ~ {Tags:["dtPos"]}
summon area_effect_cloud ~ ~ ~ {Tags:["dtPos"]}
summon armor_stand ~ ~ ~ {Tags:["dtInc"],Marker:1b}
scoreboard players set @e[tag=dtInc] death_tag 1
function death-tag:scripts/gen_num
scoreboard players operation %pos_x death_tag = @e[type=minecraft:area_effect_cloud,tag=dtPos,limit=1,sort=random] death_tag
execute as @e[tag=dtPos,limit=1,sort=random] if score @s death_tag matches 1048576.. run scoreboard players operation %pos_x death_tag *= %neg death_tag
scoreboard players reset @e[tag=dtPos]
scoreboard players set @e[tag=dtInc] death_tag 1
function death-tag:scripts/gen_num
scoreboard players operation %pos_z death_tag = @e[type=minecraft:area_effect_cloud,tag=dtPos,limit=1,sort=random] death_tag
execute as @e[tag=dtPos,limit=1,sort=random] if score @s death_tag matches 1048576.. run scoreboard players operation %pos_z death_tag *= %neg death_tag

#Moves the cloud to the specified location and forceloads the chunks
execute as @e[type=armor_stand,tag=dtInc,limit=1] run function death-tag:scripts/move
