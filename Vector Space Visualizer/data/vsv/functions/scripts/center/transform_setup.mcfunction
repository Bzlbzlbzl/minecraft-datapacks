#Calculates and starts the transformation
execute as @e[tag=vsvVector,type=block_display] run scoreboard players set @s vsv_tx 0
execute as @e[tag=vsvVector,type=block_display] run scoreboard players set @s vsv_ty 0
execute as @e[tag=vsvVector,type=block_display] run scoreboard players set @s vsv_tz 0

# x value
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform = @s vsv_dx
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform *= %1-1 values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_tx += @s _transform
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform = @s vsv_dy
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform *= %1-2 values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_tx += @s _transform
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform = @s vsv_dx
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform *= %1-3 values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_tx += @s _transform

# y value
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform = @s vsv_dx
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform *= %2-1 values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_ty += @s _transform
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform = @s vsv_dy
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform *= %2-2 values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_ty += @s _transform
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform = @s vsv_dx
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform *= %2-3 values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_ty += @s _transform

# z value
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform = @s vsv_dx
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform *= %3-1 values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_tz += @s _transform
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform = @s vsv_dy
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform *= %3-2 values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_tz += @s _transform
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform = @s vsv_dx
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform *= %3-3 values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_tz += @s _transform

#This essentially starts the transformation
scoreboard players operation %transformation values = %transform_speed values
scoreboard players operation %transformation values *= %20 values

#Final bit of calculations
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_tx /= %transformation values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_ty /= %transformation values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_tz /= %transformation values

