#Removes all tags and scoreboards from the game before disabling the pack
tellraw @a [{"text":"removed - "},{"text":"Player Tracker","color":"red","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

execute as @e[tag=trackerMarkerO] at @s run forceload remove ~ ~ ~ ~
execute as @e[tag=trackerMarkerO] run kill @s
execute as @e[tag=trackerMarkerN] at @s run forceload remove ~ ~ ~ ~
execute as @e[tag=trackerMarkerN] run kill @s
execute as @e[tag=trackerMarkerE] at @s run forceload remove ~ ~ ~ ~
execute as @e[tag=trackerMarkerE] run kill @s

scoreboard objectives remove ptracker_delay
scoreboard objectives remove ptracker_id
scoreboard objectives remove ptracker_tracking
scoreboard objectives remove compass

datapack disable "file/Player Tracker"