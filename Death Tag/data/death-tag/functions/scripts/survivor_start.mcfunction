### Starts death tag survivor game
#Moves everything to dtInc stand
execute at @e[type=armor_stand,tag=dtInc,limit=1] run worldborder center ~ ~
worldborder set 1024
execute at @e[type=minecraft:armor_stand,tag=dtInc,limit=1] run setworldspawn ~ ~ ~
execute at @e[type=minecraft:armor_stand,tag=dtInc,limit=1] run tp @a ~ ~ ~

#Players to surface, player heal, time and weather and exp reset
execute as @r at @s run spreadplayers ~ ~ 1 6 false @a
execute as @a at @s run function death-tag:scripts/go_down
execute as @a at @s run function death-tag:scripts/go_up
effect give @a minecraft:saturation 1 100
effect give @a minecraft:instant_health 1 100
time set 0
weather clear
experience set @a 0 points
experience set @a 0 levels

#Makes a new bossbar
bossbar add dt_timer {"text":"Time Left","color":"gray","bold":true}
bossbar set minecraft:dt_timer players @a
bossbar set minecraft:dt_timer color green
execute store result bossbar minecraft:dt_timer max run scoreboard players get %time death_tag

#Sets %timer to the %time to start the game
scoreboard players operation %timer death_tag = %time death_tag

#Resets all player's dt_death score; clears their inventory; sets them to survival; takes away all advancements
scoreboard players reset @a dt_death
clear @a
gamemode survival @a
advancement revoke @a everything

#Kills dtInc and removes the forceloads
execute at @e[tag=dtInc] run forceload remove ~64 ~64 ~-64 ~-64
kill @e[tag=dtInc]
