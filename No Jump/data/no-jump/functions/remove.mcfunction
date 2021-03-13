#Removes all traces of the datapack before disabling the pack
tellraw @a [{"text":"removed - "},{"text":"No Jump","color":"green","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives remove jump
scoreboard objectives remove fallDistance
effect clear @a minecraft:jump_boost

datapack disable "file/No Jump"