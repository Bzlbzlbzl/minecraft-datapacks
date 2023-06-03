# Unlike move_scythe, spin scythe doesn't need its own function but it's just more convenient
execute store result score %spin psychosis run data get entity @s Pose.RightArm[0]
scoreboard players operation %spin psychosis += @s psychosis
execute store result entity @s Pose.RightArm[0] float 1 run scoreboard players get %spin psychosis