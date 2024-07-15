#Tags the desired armor stand with ptracked tag, and points at it, before untagging all ptracked
execute as @e[type=minecraft:armor_stand,tag=trackerMarkerO] if score @s ptracker_id = @p ptracker_tracking run tag @s add ptrackedO
execute facing entity @e[tag=ptrackedO,limit=1,sort=nearest] eyes positioned ~ ~0.9 ~ rotated ~ 0 run function ptracker:scripts/point_o
execute if entity @e[tag=ptrackedO] run playsound minecraft:block.note_block.hat record @s ~ ~ ~ 0.6 2
execute as @e[tag=ptrackedO] run tag @s remove ptrackedO