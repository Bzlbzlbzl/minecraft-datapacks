execute at @s run playsound minecraft:block.note_block.banjo record @a ~ ~ ~ 1 0.529732
execute if entity @s[type=player] run function powers:songs/stop_french