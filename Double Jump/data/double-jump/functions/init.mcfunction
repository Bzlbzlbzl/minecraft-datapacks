tellraw @a [{"text":"load - "},{"text":"Double Jump","color":"aqua","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives add double_jump trigger
scoreboard objectives add dj_cd dummy
scoreboard objectives add dj_id dummy
execute unless score %doublejump double_jump matches 0.. run scoreboard players set %doublejump double_jump 1
execute unless score %lock double_jump matches 0.. run scoreboard players set %lock double_jump 0
execute unless score %next_id double_jump matches 0.. run scoreboard players set %next_id double_jump 0
# %doublejump represents whether double jump is on or not
# %lock represents whether players are locked from toggling the objective or not
# %next_id represents the next available id number associated with a new player (cannot be in dj_id)
# dj_id scoreboard will run in parallel with how the rotating item storage will work 