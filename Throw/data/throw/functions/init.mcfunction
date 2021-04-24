tellraw @a [{"text":"reload - "},{"text":"Throw","color":"gold","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives add throw trigger
scoreboard objectives add throw_main dummy
scoreboard objectives add throw_use minecraft.used:minecraft.carrot_on_a_stick
scoreboard players reset * throw
scoreboard players reset * throw_main
scoreboard players reset * throw_use
scoreboard players set %throw throw_main 1
scoreboard players set %lock throw_main 0
scoreboard players set %next throw_main 0
scoreboard players set %timer throw_main 0
# %throw represents whether throwing is on or not
# %lock represents whether players are locked from toggling the objective or not
# %next represents the next available ID for a player
# %timer represents the cooldown between each throw_use reset