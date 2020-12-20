tellraw @a [{"text":"reload - "},{"text":"Death Tag","color":"dark_red","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives add death_tag dummy
scoreboard objectives add dt_death deathCount
scoreboard players set %time death_tag 2400