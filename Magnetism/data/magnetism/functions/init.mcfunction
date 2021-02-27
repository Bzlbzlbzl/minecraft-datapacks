tellraw @a [{"text":"reload - "},{"text":"Magnetism","color":"red","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives add magnetism trigger
scoreboard objectives add magnetism_dist dummy
scoreboard objectives add magnetism_cd dummy
scoreboard players set %magnetism magnetism 1
scoreboard players enable * magnetism
# %magnetism represents whether people are magnetic