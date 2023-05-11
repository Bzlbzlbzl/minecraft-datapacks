#Creates a center
kill @e[tag=vsvOrigin,type=armor_stand]
kill @e[tag=vsvAxis,type=block_display]
kill @e[tag=vsvVector,type=block_display]

# NOTE THE Z-Y SWAP (need the armor stand in case there exists no axis)
execute store result score %origin_x values run data get entity @s Pos[0] 1
execute store result score %origin_y values run data get entity @s Pos[2] 1
execute store result score %origin_z values run data get entity @s Pos[1] 1
execute at @s align xyz run summon armor_stand ~ ~ ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,NoBasePlate:1b,Tags:["vsvOrigin"]}

execute if score @s center matches 1 at @s align xyz run summon block_display ~ ~ ~ {Glowing:0b,Tags:["vsvAxis"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.0f,0.0f,0.0f],scale:[0.0f,0.0f,0.0f]},block_state:{Name:"minecraft:obsidian"}}
execute if score @s center matches 1 at @s align xyz run summon block_display ~ ~ ~ {Glowing:0b,Tags:["vsvAxis"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.05f,-0.05f,-0.05f],scale:[0.1f,0.1f,0.1f]},block_state:{Name:"minecraft:red_concrete"}}
execute if score @s center matches 1 at @s align xyz run summon block_display ~ ~ ~ {Glowing:0b,Tags:["vsvAxis"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.05f,-0.05f,-0.05f],scale:[0.1f,0.1f,0.1f]},block_state:{Name:"minecraft:blue_concrete"}}
execute if score @s center matches 1 at @s align xyz run summon block_display ~ ~ ~ {Glowing:0b,Tags:["vsvAxis"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.05f,-0.05f,-0.05f],scale:[0.1f,0.1f,0.1f]},block_state:{Name:"minecraft:green_concrete"}}

execute if score @s center matches 2 at @s align xyz run summon block_display ~ ~ ~ {Glowing:1b,Tags:["vsvAxis"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.0f,0.0f,0.0f],scale:[0.0f,0.0f,0.0f]},block_state:{Name:"minecraft:obsidian"}}
execute if score @s center matches 2 at @s align xyz run summon block_display ~ ~ ~ {Glowing:1b,Tags:["vsvAxis"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.05f,-0.05f,-0.05f],scale:[0.0f,0.1f,0.1f]},block_state:{Name:"minecraft:red_concrete"}}
execute if score @s center matches 2 at @s align xyz run summon block_display ~ ~ ~ {Glowing:1b,Tags:["vsvAxis"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.05f,-0.05f,-0.05f],scale:[0.1f,0.0f,0.1f]},block_state:{Name:"minecraft:blue_concrete"}}
execute if score @s center matches 2 at @s align xyz run summon block_display ~ ~ ~ {Glowing:1b,Tags:["vsvAxis"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.05f,-0.05f,-0.05f],scale:[0.1f,0.1f,0.0f]},block_state:{Name:"minecraft:green_concrete"}}

#This is my way of delaying the animation because for some reason it doesn't work immediately
execute if score @s center matches 1..2 at @s align xyz as @e[type=armor_stand,limit=1,sort=nearest,tag=vsvOrigin] run scoreboard players set @s values 20

#Scaled origins (for later calculations)
scoreboard players operation %scaled_origin_x values = %origin_x values
scoreboard players operation %scaled_origin_y values = %origin_y values
scoreboard players operation %scaled_origin_z values = %origin_z values
scoreboard players operation %scaled_origin_x values *= %100 values
scoreboard players operation %scaled_origin_y values *= %100 values
scoreboard players operation %scaled_origin_z values *= %100 values