tellraw @a [{"text":"reload - "},{"text":"TP Bow Datapack","color":"dark_purple","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives remove tp_bow_id
scoreboard objectives add tp_bow_use minecraft.used:minecraft.bow
scoreboard objectives add tp_bow_id dummy
scoreboard players set %next_id tp_bow_id 0