#Resets everything
tellraw @a [{"text":"reset - "},{"text":"Vector Space Visualizer","color":"dark_green","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

# REMOVE
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

# ADD
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

# Values representing matrix numbers (Default is identity matrix)
scoreboard players set %1-1 values 1000
scoreboard players set %1-2 values 0
scoreboard players set %1-3 values 0
scoreboard players set %2-1 values 0
scoreboard players set %2-2 values 1000
scoreboard players set %2-3 values 0
scoreboard players set %3-1 values 0
scoreboard players set %3-2 values 0
scoreboard players set %3-3 values 1000

# Constants used for maths
scoreboard players set %1000 values 1000
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
scoreboard players set %animate values 0

#vsv llama storage default
data modify storage vsv llama set value [{Slot: 2b, id: "minecraft:gold_block", Count: 1b, tag: {vsv: 0, HideFlags: 127, display: {Lore: ['{"translate":"Replace center with colored wool","color":"light_purple","bold":false,"italic":true}', '{"text":"to modify the transformation matrix. ","color":"light_purple","bold":false,"italic":true}', '{"text":"Leave empty for no change. ","color":"light_purple","bold":false,"italic":true}'], Name: '{"translate":"Matrix Editor","color":"gold","bold":true,"italic":false}'}, Enchantments: [{}]}}, {Slot: 3b, id: "minecraft:red_wool", Count: 1b, tag: {vsvType: 1, vsv: 2, HideFlags: 127, display: {Name: '{"text":"x","color":"red","bold":true,"italic":false}'}}}, {Slot: 4b, id: "minecraft:black_wool", Count: 1b, tag: {vsv: 1, vsvNum: 0, HideFlags: 127, display: {Name: '{"text":"0","color":"white","bold":true,"italic":false}'}}}, {Slot: 5b, id: "minecraft:black_wool", Count: 1b, tag: {vsv: 1, vsvNum: 0, HideFlags: 127, display: {Name: '{"text":"0","color":"white","bold":true,"italic":false}'}}}, {Slot: 8b, id: "minecraft:black_wool", Count: 1b, tag: {vsv: 1, vsvNum: 0, HideFlags: 127, display: {Name: '{"text":"0","color":"white","bold":true,"italic":false}'}}}, {Slot: 9b, id: "minecraft:red_wool", Count: 1b, tag: {vsvType: 1, vsv: 2, HideFlags: 127, display: {Name: '{"text":"x","color":"red","bold":true,"italic":false}'}}}, {Slot: 10b, id: "minecraft:black_wool", Count: 1b, tag: {vsv: 1, vsvNum: 0, HideFlags: 127, display: {Name: '{"text":"0","color":"white","bold":true,"italic":false}'}}}, {Slot: 11b, id: "minecraft:crafting_table", Count: 1b, tag: {vsv: 0, HideFlags: 127, display: {Lore: ['{"translate":"Fill top and bottom slots with numbers","color":"light_purple","bold":false,"italic":true}', '{"text":"to craft a new number. ","color":"light_purple","bold":false,"italic":true}'], Name: '{"translate":"Number Crafter","color":"gold","bold":true,"italic":false}'}, Enchantments: [{}]}}, {Slot: 12b, id: "minecraft:orange_concrete", Count: 1b, tag: {vsv: 0, HideFlags: 127, display: {Lore: ['{"text":"Replace the above block with","color":"light_purple"}', '{"text":"your favorite block to change","color":"light_purple"}', '{"text":"the vector block display. ","color":"light_purple"}'], Name: '{"text":"Block Selector","color":"gold","bold":true,"italic":false}'}, Enchantments: [{}]}}, {Slot: 13b, id: "minecraft:black_wool", Count: 1b, tag: {vsv: 1, vsvNum: 0, HideFlags: 127, display: {Name: '{"text":"0","color":"white","bold":true,"italic":false}'}}}, {Slot: 14b, id: "minecraft:black_wool", Count: 1b, tag: {vsv: 1, vsvNum: 0, HideFlags: 127, display: {Name: '{"text":"0","color":"white","bold":true,"italic":false}'}}}, {Slot: 15b, id: "minecraft:red_wool", Count: 1b, tag: {vsvType: 1, vsv: 2, HideFlags: 127, display: {Name: '{"text":"x","color":"red","bold":true,"italic":false}'}}}]

#Orient constant (set to 1 if want no orientation change)
scoreboard players set %no_orient values 0
