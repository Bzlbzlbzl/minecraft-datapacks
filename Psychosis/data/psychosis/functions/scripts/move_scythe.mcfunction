# NOT recursively move scythe because minecraft cannot deal with small tp's. Will instead hardcode. It's just 30 values. 
# Need Scythe to move 5.45 blocks forward (from being spawned 6 away). Need to move by the total sum of 406 to reach it
tp @s ^ ^ ^0.15
scoreboard players add @s psy_sound 1
#execute if score @s psy_sound < @s psychosis run function psychosis:scripts/move_scythe