#Rotates both the playerlist and the storage recursively until the player has score 0 (and corresponding storage at 0)

#Decreases all scores by 1 then mods it to the total number of ID's, thus rotating it by 1
scoreboard players remove * dj_id 1
scoreboard players operation @a dj_id %= %next_id double_jump

#Moves the first data to the end of the storage, then deletes the first data, thus rotating it by 1
data modify storage minecraft:double-jump ChestItem append from storage minecraft:double-jump ChestItem[0]
data remove storage minecraft:double-jump ChestItem[0]

#Recursive function that will run this again if the player's score hasn't been rotated to the first one
execute unless score @s dj_id matches 0 run function double-jump:scripts/rotate