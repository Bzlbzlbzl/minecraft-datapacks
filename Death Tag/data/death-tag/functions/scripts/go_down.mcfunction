# Teleports floating players down to the surface recursively
#Checks if floating and teleports down
execute at @s if block ~ ~-1 ~ air run tp @s ~ ~-1 ~
execute at @s if block ~ ~-1 ~ air run function death-tag:scripts/go_down

