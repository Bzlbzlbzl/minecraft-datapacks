#Scary ritual animation finale start RUN BY PLAYER

#Adds to psychosis, scoreboard is just a second failsafe to prevent more spawns
scoreboard players add @s psychosis 1
tag @s remove psyHaunted
scoreboard players set @s psy_check -1000

execute at @s as @e[type=skeleton,tag=psyCreature] if score @s psy_id = @p[scores={psychosis=72003}] psy_id run tag @s add psySkele

#Yes, I'm aware doing this will make the player lose the psychosis tag, which is fine at this point. Also enderman will leave
execute as @e[tag=psySkele] run tag @s remove psyCreature
execute as @e[tag=psySkele] run tag @s add psyDying
execute as @e[tag=psySkele,tag=psySounded] at @s as @a[tag=psychosis] if score @s psy_id = @e[limit=1,sort=nearest,tag=psyCreature] psy_id run stopsound @s ambient minecraft:music_disc.13

#psyDying will use the psychosis scoreboard to do its animation stuffs
scoreboard players set @e[tag=psySkele] psychosis 1000

execute as @e[tag=psySkele] run tag @s remove psySkele


