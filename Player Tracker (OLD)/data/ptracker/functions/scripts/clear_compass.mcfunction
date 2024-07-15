#Removes the compass and plays a sound, resets score so doesn't immediately get compass back
clear @s minecraft:compass{ptracker:1b}
playsound minecraft:entity.item.break master @s ~ ~ ~ 1 1
playsound minecraft:block.note_block.iron_xylophone master @s ~ ~ ~ 0.5 0

#This part exclusive to clear_compass, because runs before get_compass
scoreboard players enable @s compass
scoreboard players set @s compass 0