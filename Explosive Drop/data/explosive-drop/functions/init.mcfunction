tellraw @a [{"text":"reload - "},{"text":"Explosive Drop","color":"dark_red","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives add explosive_drop trigger
scoreboard objectives add ed_temp dummy
scoreboard players set %explosive explosive_drop 1
scoreboard players enable * explosive_drop
# %explosive represents whether explosive drop is on or not