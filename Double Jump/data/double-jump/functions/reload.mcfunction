#Reloads the datapack resetting all data and stuff
tellraw @a [{"text":"reloaded - "},{"text":"Double Jump","color":"aqua","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives remove double_jump
scoreboard objectives remove dj_cd

scoreboard objectives add double_jump trigger
scoreboard objectives add dj_cd dummy
scoreboard players set %doublejump double_jump 1
scoreboard players set %lock double_jump 0