tellraw @a [{"text":"reload - "},{"text":"Death Swap","color":"dark_green","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives add death_swap dummy
scoreboard objectives add death_swap_died deathCount
scoreboard players set %next death_swap -1
scoreboard players set %swap death_swap 0
scoreboard players set %countdown death_swap -1
scoreboard players set %neg death_swap -1