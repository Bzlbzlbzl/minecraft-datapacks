tellraw @a [{"text":"reload - "},{"text":"Manhunt 2.0","color":"gray","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives add manhunt_delay dummy
scoreboard objectives add manhunt_died deathCount
scoreboard objectives add compass trigger
scoreboard players set %delay manhunt_delay 0