tellraw @a [{"text":"reload - "},{"text":"Half Sleep","color":"aqua","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives add sleep minecraft.custom:minecraft.sleep_in_bed
# %asleep is the count of how many players are currently done sleeping, will be multiplied by 2
scoreboard players set %asleep sleep 0
# %players is the count of how many players are currently on the world
scoreboard players set %players sleep 0
# %2 is 2
scoreboard players set %2 sleep 2