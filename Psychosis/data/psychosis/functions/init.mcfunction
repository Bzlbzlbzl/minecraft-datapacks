tellraw @a [{"text":"reload - "},{"text":"Psychosis","color":"dark_gray","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives add psychosis dummy
scoreboard objectives add psy_sound dummy
scoreboard objectives add psy_id dummy
scoreboard objectives add psy_level dummy

execute unless score %next_id psy_id matches 0.. run scoreboard players set %next_id psy_id 0
