tellraw @a [{"text":"reload - "},{"text":"Vector Space Visualizer","color":"red","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]
scoreboard objectives add _menu trigger
scoreboard objectives add values dummy
scoreboard objectives add center trigger
scoreboard objectives add vsv_dx dummy
scoreboard objectives add vsv_dy dummy
scoreboard objectives add vsv_dz dummy
scoreboard objectives add vector trigger

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

# Constants used for maths
scoreboard players set %100 values 100
scoreboard players set %10 values 10
scoreboard players set %2 values 2
scoreboard players set %-1 values -1

# Vector customization
scoreboard players set %vector_size values 6

# _menu is the trigger to open of matrix modification menu
# values holds important constant/non-dependent % values. Also used for animation delay counters
# center is the trigger to center the origin on player. 1 for axis, 2 for glowing axis, 3+ for no axis
