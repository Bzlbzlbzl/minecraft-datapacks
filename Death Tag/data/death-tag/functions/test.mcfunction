summon minecraft:armor_stand ~ ~ ~ {Tags:["test"]}
execute as @e[tag=test] run function death-tag:move
kill @e[tag=test]