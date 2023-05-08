tellraw @a [{"text":"reload - "},{"text":"Vector Space Visualizer","color":"red","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]
scoreboard objectives add _menu trigger
scoreboard objectives add values dummy
scoreboard objectives add center trigger

scoreboard players set %1-1 values 0
scoreboard players set %1-2 values 0
scoreboard players set %1-3 values 0
scoreboard players set %2-1 values 0
scoreboard players set %2-2 values 0
scoreboard players set %2-3 values 0
scoreboard players set %3-1 values 0
scoreboard players set %3-2 values 0
scoreboard players set %3-3 values 0

scoreboard players set %origin_x values 0
scoreboard players set %origin_y values 0
scoreboard players set %origin_z values 0

# _menu is the trigger to open of matrix modification menu
# values holds important constant/non-dependent % values
# center is the trigger to center the origin on player. 1 for axis, 2 for glowing axis, 3+ for no axis
