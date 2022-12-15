#Resets everything
tellraw @a [{"text":"reset - "},{"text":"Player Tracker","color":"red","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

execute as @e[tag=trackerMarkerO] at @s run forceload remove ~ ~ ~ ~
execute as @e[tag=trackerMarkerO] run kill @s
execute as @e[tag=trackerMarkerN] at @s run forceload remove ~ ~ ~ ~
execute as @e[tag=trackerMarkerN] run kill @s
execute as @e[tag=trackerMarkerE] at @s run forceload remove ~ ~ ~ ~
execute as @e[tag=trackerMarkerE] run kill @s

scoreboard objectives remove ptracker_delay
scoreboard objectives remove ptracker_id
scoreboard objectives remove ptracker_tracking
scoreboard objectives remove ptracker_inc
scoreboard objectives remove compass

scoreboard objectives add ptracker_delay dummy
scoreboard objectives add ptracker_id dummy
scoreboard objectives add ptracker_tracking dummy
scoreboard objectives add ptracker_inc minecraft.dropped:minecraft.compass
scoreboard objectives add compass trigger
scoreboard players set %delay ptracker_delay 0
scoreboard players set %next_id ptracker_id 1