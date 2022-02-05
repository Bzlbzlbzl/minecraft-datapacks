#Summons an area_effect_cloud to teleport to, hence resetting the velocity of the player
summon area_effect_cloud ~ ~ ~ {Duration:1,Tags:["velReset"]}
tp @e[type=area_effect_cloud,tag=velReset] @s
tp @s @e[type=area_effect_cloud,tag=velReset,limit=1]
kill @e[type=area_effect_cloud,tag=velReset]