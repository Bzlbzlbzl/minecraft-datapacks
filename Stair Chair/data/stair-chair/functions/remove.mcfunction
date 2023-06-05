#Removes all tags and scoreboards from the game before disabling the pack
tellraw @a [{"text":"removed - "},{"text":"Stair Chair","color":"light_purple","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives remove sc_range
execute as @e[type=pig,tag=pigChair] run tag @s add toKill
execute as @e[predicate=stair-chair:riding_death] at @s run tp @s ~ ~1 ~
execute as @e[type=pig,tag=pigChair] at @s run tp @s ~ -72 ~
kill @e[type=pig,tag=pigChair]

datapack disable "file/Stair Chair"