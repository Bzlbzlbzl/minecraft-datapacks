#Removes all tags and scoreboards from the game before disabling the pack
tellraw @a [{"text":"removed - "},{"text":"Manhunt 2.0","color":"gray","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives remove manhunt_delay
scoreboard objectives remove manhunt_died
scoreboard objectives remove compass
tag @e[tag=manhuntRunner] remove manhuntRunner
execute as @e[tag=manhuntMarkerOW] at @s run forceload remove ~ ~ ~ ~
execute as @e[tag=manhuntMarkerN] at @s run forceload remove ~ ~ ~ ~
kill @e[tag=manhuntMarkerOW]
kill @e[tag=manhuntMarkerN]

datapack disable "file/Manhunt 2"