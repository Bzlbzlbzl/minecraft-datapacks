#Archer trap command
effect give @a[team=!Archer,distance=..1] minecraft:slowness 4 99
effect give @a[team=!Archer,distance=..1] minecraft:jump_boost 4 155
execute at @a[team=!Archer,distance=..1] run particle minecraft:item_slime ~ ~1 ~ 1 1 1 0 70 normal @a
kill @s