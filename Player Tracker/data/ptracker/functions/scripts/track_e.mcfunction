#Tags the desired armor stand with ptracked tag, and points at it, before untagging all ptracked
execute as @e[type=minecraft:armor_stand,tag=trackerMarkerE] if score @s ptracker_id = @p ptracker_tracking run tag @s add ptrackedNE
execute facing entity @e[tag=ptrackedNE,limit=1,sort=nearest] eyes positioned ~ ~0.9 ~ rotated ~ 0 run function ptracker:scripts/point_ne
execute if entity @e[tag=ptrackedNE] run playsound minecraft:block.note_block.hat record @s ~ ~ ~ 0.6 2
execute as @e[tag=ptrackedNE] run tag @s remove ptrackedNE