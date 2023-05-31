#Kills specific psychosis creature
execute at @s run particle minecraft:smoke ~ ~0.8 ~ 0.2 0.8 0.2 0.01 30 normal
execute at @s run playsound minecraft:entity.blaze.shoot ambient @a ~ ~ ~ 0.4 1
execute at @s run playsound minecraft:ambient.soul_sand_valley.mood ambient @a ~ ~ ~ 0.5 0 0.5

execute if entity @s[tag=psySounded] at @s as @a[tag=psychosis] if score @s psy_id = @e[limit=1,sort=nearest,tag=psyCreature] psy_id run stopsound @s ambient minecraft:music_disc.13

execute at @s as @a[tag=psychosis] if score @s psy_id = @e[limit=1,sort=nearest,tag=psyCreature] psy_id run tag @s remove psychosis
execute at @s run forceload remove ~ ~ ~ ~

effect give @s minecraft:invisibility 1 0 true
execute if dimension overworld run tp @s ~ -70 ~
execute unless dimension overworld run tp @s ~ -6 ~
kill @s
