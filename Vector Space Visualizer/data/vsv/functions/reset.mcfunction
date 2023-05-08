#Resets everything
tellraw @a [{"text":"reset - "},{"text":"Vector Space Visualizer","color":"red","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives remove _menu
scoreboard objectives remove values
scoreboard objectives remove center

scoreboard objectives add _menu trigger
scoreboard objectives add values dummy
scoreboard objectives add center trigger