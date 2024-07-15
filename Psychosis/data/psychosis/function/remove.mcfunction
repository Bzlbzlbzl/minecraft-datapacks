#Removes all tags and scoreboards from the game before disabling the pack
tellraw @a [{"text":"removed - "},{"text":"Psychosis","color":"dark_gray","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

gamerule doInsomnia true

execute as @e[tag=psyCreature] run function psychosis:scripts/kill_creature
execute as @e[tag=psyDying] run function psychosis:scripts/kill_creature
execute as @e[tag=psyReaper] run function psychosis:scripts/kill_creature
execute as @e[tag=psyScythe] run function psychosis:scripts/kill_creature
execute as @e[tag=psyHead] run function psychosis:scripts/kill_creature
execute as @e[tag=psyScare] run function psychosis:scripts/kill_creature

scoreboard objectives remove psychosis
scoreboard objectives remove psy_sound
scoreboard objectives remove psy_id
scoreboard objectives remove psy_check
scoreboard objectives remove psy_death

tag @a remove psyWarned
tag @a remove psychosis
tag @a remove psyHaunted

datapack disable "file/Psychosis"