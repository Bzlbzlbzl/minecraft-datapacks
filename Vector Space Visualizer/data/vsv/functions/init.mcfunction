tellraw @a [{"text":"reload - "},{"text":"Vector Space Visualizer","color":"red","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]
scoreboard objectives add _menu trigger
scoreboard objectives add values dummy
scoreboard objectives add center trigger
scoreboard objectives add vsv_dx dummy
scoreboard objectives add vsv_dy dummy
scoreboard objectives add vsv_dz dummy
scoreboard objectives add vector trigger
scoreboard objectives add space trigger
scoreboard objectives add _transform trigger
scoreboard objectives add vsv_tx dummy
scoreboard objectives add vsv_ty dummy
scoreboard objectives add vsv_tz dummy
scoreboard objectives add vsv_fx dummy
scoreboard objectives add vsv_fy dummy
scoreboard objectives add vsv_fz dummy
scoreboard objectives add animate trigger

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
scoreboard players set %360 values 360
scoreboard players set %100 values 100
scoreboard players set %20 values 20
scoreboard players set %10 values 10
scoreboard players set %4 values 4
scoreboard players set %2 values 2
scoreboard players set %-1 values -1

# Vector customization defaults
scoreboard players set %vector_size values 6

# Space customaization defaults
scoreboard players set %space_incr values 6
scoreboard players set %space_dist values 8

scoreboard players set %space_trigger values 0

#Transformation customization defaults
scoreboard players set %transform_speed values 3

#Animation default 0
scoreboard players set %animate values 3

#vsv llama storage default (WIP)
data modify storage vsv llama set value [{Slot: 2b, id: "minecraft:gold_block", Count: 1b, tag: {vsv: 0, HideFlags: 127, display: {Lore: ['{"translate":"Replace center with colored wool","color":"light_purple","bold":false,"italic":true}', '{"text":"to modify the transformation matrix. ","color":"light_purple","bold":false,"italic":true}', '{"text":"Leave empty for no change. ","color":"light_purple","bold":false,"italic":true}'], Name: '{"translate":"Matrix Editor","color":"gold","bold":true,"italic":false}'}, Enchantments: [{}]}}, {Slot: 11b, id: "minecraft:crafting_table", Count: 1b, tag: {vsv: 0, HideFlags: 127, display: {Lore: ['{"translate":"Fill top and bottom slots with numbers","color":"light_purple","bold":false,"italic":true}', '{"text":"to craft a new number. ","color":"light_purple","bold":false,"italic":true}'], Name: '{"translate":"Number Crafter","color":"gold","bold":true,"italic":false}'}, Enchantments: [{}]}}]


# _menu is the trigger to open of matrix modification menu
# values holds important constant/non-dependent % values. Also used for animation delay counters
# center is the trigger to center the origin on player. 1 for axis, 2 for glowing axis, 3+ for no axis
