#Initial shape for the sphere
#Initial transformation matrix
scoreboard players set %1-1 values 140
scoreboard players set %1-2 values 0
scoreboard players set %1-3 values 0
scoreboard players set %2-1 values 0
scoreboard players set %2-2 values 140
scoreboard players set %2-3 values 0
scoreboard players set %3-1 values 0
scoreboard players set %3-2 values 0
scoreboard players set %3-3 values 50

#Constant for the animation
scoreboard players set %transform_speed values 1

#Setup
function vsv:scripts/animation/animate_setup
#This essentially starts the animation
scoreboard players operation %animation_count values = %transform_speed values
scoreboard players operation %animation_count values *= %10 values
#Negative value so that it doesn't repeat again
scoreboard players operation %animation_count values *= %-1 values