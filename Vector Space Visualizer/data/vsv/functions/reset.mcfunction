#Resets everything
tellraw @a [{"text":"reset - "},{"text":"Vector Space Visualizer","color":"red","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

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

scoreboard objectives add _menu trigger
scoreboard objectives add values dummy
scoreboard objectives add center trigger
scoreboard objectives add vsv_id dummy
scoreboard objectives add vsv_dx dummy
scoreboard objectives add vsv_dy dummy
scoreboard objectives add vsv_dz dummy

# Values representing matrix numbers
scoreboard players set %1-1 values 0
scoreboard players set %1-2 values 0
scoreboard players set %1-3 values 0
scoreboard players set %2-1 values 0
scoreboard players set %2-2 values 0
scoreboard players set %2-3 values 0
scoreboard players set %3-1 values 0
scoreboard players set %3-2 values 0
scoreboard players set %3-3 values 0

# Values representing exact origin coords
scoreboard players set %origin_x values 0
scoreboard players set %origin_y values 0
scoreboard players set %origin_z values 0

# Constants used for maths
scoreboard players set %100 values 100

# id management
execute unless score %next_id vsv_id matches 0.. run scoreboard players set %next_id vsv_id 0
