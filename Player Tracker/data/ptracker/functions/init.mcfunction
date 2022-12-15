tellraw @a [{"text":"reload - "},{"text":"Player Tracker","color":"red","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives add ptracker_delay dummy
scoreboard objectives add ptracker_id dummy
scoreboard objectives add ptracker_tracking dummy
scoreboard objectives add ptracker_inc minecraft.dropped:minecraft.compass
scoreboard objectives add compass trigger
scoreboard players set %delay ptracker_delay 0
scoreboard players set %next_id ptracker_id 0