#Removes all tags and scoreboards from the game before disabling the pack
tellraw @a [{"text":"removed - "},{"text":"Vector Space Visualizer","color":"red","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives remove _menu
scoreboard objectives remove values
scoreboard objectives remove center
scoreboard objectives remove vsv_id
scoreboard objectives remove vsv_dx
scoreboard objectives remove vsv_dy
scoreboard objectives remove vsv_dz
scoreboard objectives remove vsv_dx_1000
scoreboard objectives remove vsv_dy_1000
scoreboard objectives remove vsv_dz_1000

datapack disable "file/Vector Space Visualizer"