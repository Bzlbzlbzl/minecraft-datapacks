#Removes all tags and scoreboards from the game before disabling the pack
tellraw @a [{"text":"removed - "},{"text":"Psychosis","color":"dark_gray","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

gamerule doInsomnia true

scoreboard objectives remove psychosis
scoreboard objectives remove psy_sound
scoreboard objectives remove psy_id
scoreboard objectives remove psy_level

datapack disable "file/Psychosis"