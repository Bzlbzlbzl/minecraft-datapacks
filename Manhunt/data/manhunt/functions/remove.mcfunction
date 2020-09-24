#Removes all tags and scoreboards from the game before disabling the pack
tellraw @a [{"text":"remove - "},{"text":"Manhunt","color":"gray","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives remove manhunt_delay
tag @e[tag=manhuntRunner] remove manhuntRunner

datapack disable "file/Manhunt"