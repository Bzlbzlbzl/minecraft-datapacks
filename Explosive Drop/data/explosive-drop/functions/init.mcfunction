tellraw @a [{"text":"reload - "},{"text":"Explosive Drop","color":"dark_red","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives add explosive_drop trigger
scoreboard objectives add ed_main dummy
scoreboard players set %explosive ed_main 1
scoreboard players set %lock ed_main 0
# %explosive represents whether explosive drop is on or not