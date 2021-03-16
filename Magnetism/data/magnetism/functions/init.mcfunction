tellraw @a [{"text":"reload - "},{"text":"Magnetism","color":"red","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives add magnetism trigger
scoreboard objectives add magnetism_dist dummy
scoreboard objectives add magnetism_cd dummy
scoreboard players set %magnetism magnetism_dist 1
scoreboard players set %lock magnetism_dist 0
# %magnetism represents whether people are magnetic
# %lock represents whether players are locked from toggling the objective or not