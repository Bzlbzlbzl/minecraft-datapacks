tellraw @a [{"text":"load - "},{"text":"Double Jump","color":"aqua","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives add double_jump trigger
scoreboard objectives add dj_cd dummy
scoreboard players set %doublejump double_jump 1
scoreboard players set %lock double_jump 0
# %doublejump represents whether double jump is on or not
# %lock represents whether players are locked from toggling the objective or not