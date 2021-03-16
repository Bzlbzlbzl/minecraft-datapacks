tellraw @a [{"text":"reload - "},{"text":"No Jump","color":"green","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives add jump trigger
scoreboard objectives add nj_fallDistance dummy
scoreboard players set %jump nj_fallDistance 0
scoreboard players set %lock nj_fallDistance 0
scoreboard players enable * jump
effect clear @a minecraft:jump_boost
# %jump represents whether people can jump or not