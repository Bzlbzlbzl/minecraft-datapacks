tellraw @a [{"text":"reload - "},{"text":"Psychosis","color":"dark_gray","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Beezily","color":"light_purple"}]

gamerule doInsomnia false

scoreboard objectives add psychosis dummy
scoreboard objectives add psy_sound dummy
scoreboard objectives add psy_id dummy
scoreboard objectives add psy_check dummy
scoreboard objectives add psy_death deathCount

scoreboard players set %-1 psychosis -1
execute unless score %next_id psy_id matches 0.. run scoreboard players set %next_id psy_id 0
