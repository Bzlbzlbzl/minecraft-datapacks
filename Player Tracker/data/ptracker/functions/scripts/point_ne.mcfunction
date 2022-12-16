# Loop that makes particles towards the tracked player, stops if the beam hits the ptracked position

#Particles run at different loop intervals
execute if score %point ptracker_delay matches 0 run particle minecraft:dust 1 0.7 0 1.5 ^ ^ ^ 0 0 0 10 1 force @s
execute if score %point ptracker_delay matches 1 run particle minecraft:dust 1 0.6 0 1.5 ^ ^ ^ 0 0 0 10 1 force @s
execute if score %point ptracker_delay matches 2 run particle minecraft:dust 1 0.5 0 1.5 ^ ^ ^ 0 0 0 10 1 force @s
execute if score %point ptracker_delay matches 3 run particle minecraft:dust 1 0.4 0 1.5 ^ ^ ^ 0 0 0 10 1 force @s
execute if score %point ptracker_delay matches 4 run particle minecraft:dust 1 0.3 0 1.5 ^ ^ ^ 0 0 0 10 1 force @s
execute if score %point ptracker_delay matches 5 run particle minecraft:dust 1 0.2 0 1.5 ^ ^ ^ 0 0 0 10 1 force @s
execute if score %point ptracker_delay matches 6 run particle minecraft:dust 1 0.1 0 1.5 ^ ^ ^ 0 0 0 10 1 force @s
execute if score %point ptracker_delay matches 7 run particle minecraft:dust 1 0 0 1.5 ^ ^ ^ 0 0 0 10 1 force @s
execute if score %point ptracker_delay matches 8 run particle minecraft:dust 1 1 1 1.5 ^ ^ ^ 0 0 0 10 1 force @s

#Add one to %point on each loop call
scoreboard players add %point ptracker_delay 1

#If at armor stand then set %point to -1, then the -1 tells next line to run a white particle (does not change score if white particle already done before)
execute unless score %point ptracker_delay matches 9 positioned ~ -6 ~ if entity @e[type=armor_stand,tag=ptrackedNE,distance=..0.4] run scoreboard players set %point ptracker_delay -1
execute if score %point ptracker_delay matches -1 run particle minecraft:dust 0.6 0.1 1 1.5 ^ ^ ^0.4 0 0 0 10 1 force @s
execute if score %point ptracker_delay matches -1 at @s run playsound minecraft:block.note_block.snare record @s ~ ~ ~ 1 2

#If %point not between 1-8, ie. is -1 or reached 9, then set back to 0
execute unless score %point ptracker_delay matches 1..8 run scoreboard players set %point ptracker_delay 0

#Loop through the function again until the previous line makes %point 0
execute unless score %point ptracker_delay matches 0 positioned ^ ^ ^0.4 run function ptracker:scripts/point_ne