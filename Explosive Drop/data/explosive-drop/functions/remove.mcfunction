#Removes all traces of the datapack before disabling the pack
tellraw @a [{"text":"removed - "},{"text":"Explosive Drop","color":"dark_red","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives remove explosive_drop
scoreboard objectives remove ed_temp

datapack disable "file/Explosive Drop"