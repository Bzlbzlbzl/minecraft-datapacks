#Recursive for single block tps. Others don't need the tp
execute at @s if block ~ ~-1 ~ #psychosis:one_block_down run tp @s ~ ~-1 ~
execute at @s if block ~ ~-1 ~ #psychosis:one_block_down run function psychosis:scripts/tp_down_single
