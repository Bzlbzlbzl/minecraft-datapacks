tellraw @a [{"text":"reload - "},{"text":"Psychosis","color":"dark_gray","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

gamerule doInsomnia false

scoreboard objectives add psychosis dummy
scoreboard objectives add psy_sound dummy
scoreboard objectives add psy_id dummy
scoreboard objectives add psy_level dummy
scoreboard objectives add psy_death deathCount

execute unless score %next_id psy_id matches 0.. run scoreboard players set %next_id psy_id 0

#psy_level is the warning level every player is at. For psyCreatures it represents whether or not to die or not (1 for no die, 0 for die)