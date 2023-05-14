# Calculates the square root using recrusion
scoreboard players operation %sq_check values += %sq_inc values
scoreboard players add %sq_inc values 2
scoreboard players add %sqrt values 1
execute if score %sq_check values < %sq_target values run function vsv:scripts/center/sqrt