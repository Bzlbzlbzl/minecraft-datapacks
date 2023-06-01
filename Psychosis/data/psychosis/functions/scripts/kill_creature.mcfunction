#Kills specific psychosis creature
execute at @s run particle minecraft:smoke ~ ~0.8 ~ 0.2 0.8 0.2 0.01 30 normal
execute at @s run playsound minecraft:entity.blaze.shoot ambient @a ~ ~ ~ 0.4 1
execute at @s run playsound minecraft:ambient.soul_sand_valley.mood ambient @a ~ ~ ~ 0.5 0 0.5

execute if entity @s[tag=psySounded] at @s as @a[tag=psychosis] if score @s psy_id = @e[limit=1,sort=nearest,tag=psyCreature] psy_id run stopsound @s ambient minecraft:music_disc.13

execute if entity @s[type=enderman] at @s rotated ~ 0 positioned ^ ^-0.7 ^0.8 as @e[tag=psyHead,limit=1,sort=nearest] run kill @s

execute at @s as @a[tag=psychosis] if score @s psy_id = @e[limit=1,sort=nearest,tag=psyCreature] psy_id run scoreboard players set @s psy_check -100
execute at @s as @a[tag=psychosis] if score @s psy_id = @e[limit=1,sort=nearest,tag=psyCreature] psy_id run tag @s remove psychosis

effect give @s minecraft:invisibility 1 0 true
execute at @s if dimension overworld run tp @s ~ -70 ~
execute at @s unless dimension overworld run tp @s ~ -6 ~
kill @s

execute at @s run forceload remove ~ ~ ~ ~