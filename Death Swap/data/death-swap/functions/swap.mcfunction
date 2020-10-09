#Tags player toSwap and then tps them to the guy higher than them, stops at the last guy
execute as @a if score @s death_swap = %swap death_swap run tag @s add toSwap
scoreboard players add %swap death_swap 1
execute as @a if score @s death_swap = %swap death_swap run tp @a[tag=toSwap] @s
tag @a remove toSwap
execute unless score %swap death_swap = %next death_swap run function death-swap:swap