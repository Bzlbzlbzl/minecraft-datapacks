#Kills specific psychosis creature
execute at @s run particle minecraft:smoke ~ ~0.8 ~ 0.2 0.8 0.2 0.01 30 normal
execute at @s as @a[tag=psychosis] if score @s psy_id = @e[limit=1,sort=nearest,tag=psyCreature] psy_id run tag @s remove psychosis

effect give @s minecraft:invisibility 1 0 true

execute at @s run forceload remove ~ ~ ~ ~
execute if dimension overworld run tp @s ~ -70 ~
execute unless dimension overworld run tp @s ~ -6 ~
kill @s