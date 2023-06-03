# Just spin increasing per increment
execute store result score %spin psychosis run data get entity @s Pose.RightArm[0]
scoreboard players operation %spin psychosis += @s psychosis
execute store result entity @s Pose.RightArm[0] float 1 run scoreboard players get %spin psychosis

# The moving part is annoying, has to be hard coded since very small increment recursive tp's dont work for some reason
execute if score @s psychosis matches 1 run tp @s ^ ^ ^0.0134
execute if score @s psychosis matches 2 run tp @s ^ ^ ^0.0268
execute if score @s psychosis matches 3 run tp @s ^ ^ ^0.0402
execute if score @s psychosis matches 4 run tp @s ^ ^ ^0.0536
execute if score @s psychosis matches 5 run tp @s ^ ^ ^0.067
execute if score @s psychosis matches 6 run tp @s ^ ^ ^0.0804
execute if score @s psychosis matches 7 run tp @s ^ ^ ^0.0938
execute if score @s psychosis matches 8 run tp @s ^ ^ ^0.1072
execute if score @s psychosis matches 9 run tp @s ^ ^ ^0.1206
execute if score @s psychosis matches 10 run tp @s ^ ^ ^0.134
execute if score @s psychosis matches 11 run tp @s ^ ^ ^0.1474
execute if score @s psychosis matches 12 run tp @s ^ ^ ^0.1608
execute if score @s psychosis matches 13 run tp @s ^ ^ ^0.1742
execute if score @s psychosis matches 14 run tp @s ^ ^ ^0.1876
execute if score @s psychosis matches 15 run tp @s ^ ^ ^0.201
execute if score @s psychosis matches 16 run tp @s ^ ^ ^0.2144
execute if score @s psychosis matches 17 run tp @s ^ ^ ^0.2278
execute if score @s psychosis matches 18 run tp @s ^ ^ ^0.2412
execute if score @s psychosis matches 19 run tp @s ^ ^ ^0.2546
execute if score @s psychosis matches 20 run tp @s ^ ^ ^0.268
execute if score @s psychosis matches 21 run tp @s ^ ^ ^0.2814
execute if score @s psychosis matches 22 run tp @s ^ ^ ^0.2948
execute if score @s psychosis matches 23 run tp @s ^ ^ ^0.3082
execute if score @s psychosis matches 24 run tp @s ^ ^ ^0.3216
execute if score @s psychosis matches 25 run tp @s ^ ^ ^0.335
execute if score @s psychosis matches 26 run tp @s ^ ^ ^0.3484
execute if score @s psychosis matches 27 run tp @s ^ ^ ^0.3618
execute if score @s psychosis matches 28 run tp @s ^ ^ ^0.3752