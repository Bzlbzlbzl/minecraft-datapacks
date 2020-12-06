#Removes all tags and scoreboards from the game before disabling the pack
tellraw @a [{"text":"remove - "},{"text":"Half Sleep","color":"aqua","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives remove sleep

datapack disable "file/Half Sleep"