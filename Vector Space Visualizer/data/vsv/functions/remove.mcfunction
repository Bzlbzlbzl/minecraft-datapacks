#Removes all tags and scoreboards from the game before disabling the pack
tellraw @a [{"text":"removed - "},{"text":"Vector Space Visualizer","color":"dark_green","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

data remove storage minecraft:vsv llama

kill @e[tag=vsvVector]
kill @e[tag=vsvOrigin]
kill @e[tag=vsvAxis]
kill @e[tag=vsvMenu]

scoreboard objectives remove _menu
scoreboard objectives remove values
scoreboard objectives remove center
scoreboard objectives remove vsv_dx
scoreboard objectives remove vsv_dy
scoreboard objectives remove vsv_dz
scoreboard objectives remove vector
scoreboard objectives remove space
scoreboard objectives remove _transform
scoreboard objectives remove vsv_tx
scoreboard objectives remove vsv_ty
scoreboard objectives remove vsv_tz
scoreboard objectives remove vsv_fx
scoreboard objectives remove vsv_fy
scoreboard objectives remove vsv_fz
scoreboard objectives remove animate

datapack disable "file/Vector Space Visualizer"