### Starts death tag game
#Resets the bossbar and game score in case stop function wasn't called
bossbar remove minecraft:dt_timer
scoreboard players set %game death_tag 1

#Generates two random numbers from 0 to 2^21-1 then decides if its negative or positive by *= %neg (-1) if the randomly selected cloud received the 2^20 (1048576)
summon area_effect_cloud ~ ~ ~ {Tags:["dtPos"]}
summon area_effect_cloud ~ ~ ~ {Tags:["dtPos"]}
summon area_effect_cloud ~ ~ ~ {Tags:["dtInc"]}
scoreboard players set @e[tag=dtInc] death_tag 1
function death-tag:scripts/gen_num
scoreboard players operation %pos_x death_tag = @e[type=minecraft:area_effect_cloud,tag=dtPos,limit=1,sort=random] death_tag
execute as @e[tag=dtPos,limit=1,sort=random] if score @s death_tag matches 1048576.. run scoreboard players operation %pos_x death_tag *= %neg death_tag
scoreboard players reset @e[tag=dtPos]
scoreboard players set @e[tag=dtInc] death_tag 1
function death-tag:scripts/gen_num
scoreboard players operation %pos_z death_tag = @e[type=minecraft:area_effect_cloud,tag=dtPos,limit=1,sort=random] death_tag
execute as @e[tag=dtPos,limit=1,sort=random] if score @s death_tag matches 1048576.. run scoreboard players operation %pos_z death_tag *= %neg death_tag

#Moves the dtInc cloud to the position and moves everything there
execute as @e[type=minecraft:area_effect_cloud,tag=dtInc,limit=1] run function death-tag:scripts/move

#Players to surface, player heal, time and weather and exp reset
execute as @r[tag=!dtIt] at @s run spreadplayers ~ ~ 1 5 false @a[tag=!dtIt]
execute as @r[tag=dtIt] at @s run spreadplayers ~ ~ 1 5 false @a[tag=dtIt]
effect give @a minecraft:saturation 1 100
effect give @a minecraft:instant_health 1 100
time set 0
weather clear
experience set @a 0 points
experience set @a 0 levels

#Makes a new bossbar
bossbar add dt_timer {"text":"Time Left","color":"gold","bold":true}
bossbar set minecraft:dt_timer players @a
bossbar set minecraft:dt_timer color red
execute store result bossbar minecraft:dt_timer max run scoreboard players get %time death_tag

#Sets %timer to the %time to start the game
scoreboard players operation %timer death_tag = %time death_tag

#Resets all player's dt_death score; clears their inventory; sets them to survival; takes away all advancements
scoreboard players reset @a dt_death
clear @a
gamemode survival @a
advancement revoke @a everything

#Gives tools to all players
give @a diamond_axe
give @a diamond_pickaxe
give @a diamond_shovel
give @a cobblestone 16
give @a minecraft:water_bucket
give @a minecraft:bread 64