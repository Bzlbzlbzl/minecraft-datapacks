# Teleports underwater/lava players up to the surface and spawns a stone block recursively
#Checks if underwater/lava, and teleports up (not kelp_plant is middle kelp, and kelp is the topmost kelp)
execute at @s if block ~ ~ ~ water run tp @s ~ ~1 ~
execute at @s if block ~ ~ ~ seagrass run tp @s ~ ~1 ~
execute at @s if block ~ ~ ~ kelp run tp @s ~ ~1 ~
execute at @s if block ~ ~ ~ kelp_plant run tp @s ~ ~1 ~
execute at @s if block ~ ~ ~ lava run tp @s ~ ~1 ~
execute at @s unless block ~ ~ ~ water unless block ~ ~ ~ seagrass unless block ~ ~ ~ kelp unless block ~ ~ ~ kelp_plant unless block ~ ~ ~ lava run setblock ~ ~-1 ~ stone
execute at @s unless block ~ ~ ~ water unless block ~ ~ ~ seagrass unless block ~ ~ ~ kelp unless block ~ ~ ~ kelp_plant unless block ~ ~ ~ lava run fill ~ ~ ~ ~ ~1 ~ air
execute at @s unless block ~ ~ ~ air run function death-tag:scripts/go_up

