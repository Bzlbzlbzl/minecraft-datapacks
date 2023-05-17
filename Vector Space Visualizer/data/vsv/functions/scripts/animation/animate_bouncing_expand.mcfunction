#Expanding animation setup
#Expanding matrix
scoreboard players set %1-1 values 714
scoreboard players set %1-2 values 0
scoreboard players set %1-3 values 0
scoreboard players set %2-1 values 0
scoreboard players set %2-2 values 714
scoreboard players set %2-3 values 0
scoreboard players set %3-1 values 0
scoreboard players set %3-2 values 0
scoreboard players set %3-3 values 2000

#Calculates values where currently is (animation doesn't calculate as moving) NOT RUN DUE TO ROUNDING
#execute as @e[tag=vsvVector,type=block_display] run function vsv:scripts/vector/calculate_values
#Setup
function vsv:scripts/animation/animate_setup

