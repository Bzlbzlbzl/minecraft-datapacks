tellraw @a [{"text":"reload - "},{"text":"Death Tag","color":"dark_red","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives add death_tag dummy
scoreboard objectives add dt_death deathCount
scoreboard objectives add dtTimer trigger

scoreboard players reset * death_tag
scoreboard players reset * dt_death
scoreboard players reset * dtTimer

scoreboard players set %time death_tag 2400
scoreboard players set %neg death_tag -1
scoreboard players set %timelock death_tag 0
scoreboard players set %ticksPerMin death_tag 1200
