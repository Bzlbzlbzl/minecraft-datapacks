#Removes all traces of the datapack before disabling the pack
tellraw @a [{"text":"removed - "},{"text":"Double Jump","color":"aqua","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives remove double_jump
scoreboard objectives remove dj_cd

datapack disable "file/Double Jump"