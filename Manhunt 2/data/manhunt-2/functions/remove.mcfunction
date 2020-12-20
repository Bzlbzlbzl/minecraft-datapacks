#Removes all tags and scoreboards from the game before disabling the pack
tellraw @a [{"text":"removed - "},{"text":"Manhunt 2.0","color":"gray","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives remove manhunt_delay
tag @e[tag=manhuntRunner] remove manhuntRunner
tag @a remove beenToOW
tag @a remove beenToN
kill @e[tag=manhuntMarkerOW]
kill @e[tag=manhuntMarkerN]

datapack disable "file/Manhunt 2"