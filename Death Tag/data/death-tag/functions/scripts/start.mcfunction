### Starts death tag game
#Moves everything to dtInc stand
execute at @e[type=armor_stand,tag=dtInc,limit=1] run worldborder center ~ ~
worldborder set 128
execute at @e[type=minecraft:armor_stand,tag=dtInc,limit=1] run setworldspawn ~ ~ ~
execute at @e[type=minecraft:armor_stand,tag=dtInc,limit=1] run tp @a[tag=dtIt] ~52 ~ ~52
execute at @e[type=minecraft:armor_stand,tag=dtInc,limit=1] run tp @a[tag=!dtIt] ~-40 ~ ~-40

#Players to surface, player heal, time and weather and exp reset
execute as @r[tag=!dtIt] at @s run spreadplayers ~ ~ 1 6 false @a[tag=!dtIt]
execute as @r[tag=dtIt] at @s run spreadplayers ~ ~ 1 6 false @a[tag=dtIt]
execute as @a at @s run function death-tag:scripts/go_down
execute as @a at @s run function death-tag:scripts/go_up
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
give @a minecraft:water_bucket
give @a minecraft:bread 64
give @a cobblestone 16

#Kills dtInc and removes the forceloads
execute at @e[tag=dtInc] run forceload remove ~64 ~64 ~-64 ~-64
kill @e[tag=dtInc]
