#Tags the desired armor stand with ptracked tag, and points at it, before untagging all ptracked
execute as @e[type=minecraft:armor_stand,tag=trackerMarkerN] if score @s ptracker_id = @p ptracker_tracking run tag @s add ptracked
execute facing entity @e[tag=ptracked,limit=1,sort=nearest] eyes positioned ~ ~0.9 ~ rotated ~ 0 run function ptracker:scripts/point
execute as @e[tag=ptracked] run tag @s remove ptracked