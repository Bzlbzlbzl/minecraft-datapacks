#Removes all traces of the datapack before disabling the pack
tellraw @a [{"text":"removed - "},{"text":"Magnetism","color":"red","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives remove magnetism
scoreboard objectives remove magnetism_dist
scoreboard objectives remove magnetism_cd

datapack disable "file/Magnetism"