tellraw @a [{"text":"reload - "},{"text":"Vector Space Visualizer","color":"red","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]
scoreboard objectives add _menu trigger
scoreboard objectives add values dummy
scoreboard objectives add center trigger
scoreboard objectives add vsv_id dummy
scoreboard objectives add vsv_dx dummy
scoreboard objectives add vsv_dy dummy
scoreboard objectives add vsv_dz dummy
scoreboard objectives add vsv_dx_1000 dummy
scoreboard objectives add vsv_dy_1000 dummy
scoreboard objectives add vsv_dz_1000 dummy

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
scoreboard players set %1000 values 1000

# id management
scoreboard players set %next_id vsv_id 0

# _menu is the trigger to open of matrix modification menu
# values holds important constant/non-dependent % values. Also used for animation delay counters
# center is the trigger to center the origin on player. 1 for axis, 2 for glowing axis, 3+ for no axis
# vsv_id is a unique id for each vector tip/tail pair for unique identification
# vsv_dxyz is the position relative to the origin
# vsv_dxyz_1000 is the 1000th place decimal values of the relative positions (split this up to avoid exceeding int cap)