#Removes all tags and scoreboards from the game before disabling the pack
tellraw @a [{"text":"removed - "},{"text":"Aether","color":"aqua","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives remove aether_water
scoreboard objectives remove aether_check
execute as @e[tag=aetherCheck,tag=aetherPortal,tag=aetherNorth,type=area_effect_cloud] at @s run function why:aether/break_portal_north
execute as @e[tag=aetherCheck,tag=aetherPortal,tag=aetherWest,type=area_effect_cloud] at @s run function why:aether/break_portal_west
kill @e[tag=aetherCheck]

datapack disable "file/Aether Portal"
