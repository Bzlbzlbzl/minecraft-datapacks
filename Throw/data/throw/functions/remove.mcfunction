#Removes all traces of the datapack before disabling the pack
tellraw @a [{"text":"removed - "},{"text":"Throw","color":"gold","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives remove throw
scoreboard objectives remove throw_main
scoreboard objectives remove throw_use

datapack disable "file/Explosive Drop"