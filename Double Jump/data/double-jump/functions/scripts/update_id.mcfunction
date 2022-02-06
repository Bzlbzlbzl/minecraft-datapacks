#Updates ID of new players and creates a placeholder in the storage
scoreboard players operation @s dj_id = %next_id double_jump
scoreboard players add %next_id double_jump 1

data modify storage minecraft:double-jump ChestItem append value {id:"minecraft:air",Count:1b}