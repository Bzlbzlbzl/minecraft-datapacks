#Calculates and starts the transformation
execute as @e[tag=vsvVector,type=block_display] run scoreboard players set @s vsv_fx 0
execute as @e[tag=vsvVector,type=block_display] run scoreboard players set @s vsv_fy 0
execute as @e[tag=vsvVector,type=block_display] run scoreboard players set @s vsv_fz 0

#Final values
# x value
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform = @s vsv_dx
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform *= %1-1 values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_fx += @s _transform
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform = @s vsv_dy
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform *= %1-2 values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_fx += @s _transform
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform = @s vsv_dz
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform *= %1-3 values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_fx += @s _transform

# y value
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform = @s vsv_dx
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform *= %2-1 values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_fy += @s _transform
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform = @s vsv_dy
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform *= %2-2 values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_fy += @s _transform
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform = @s vsv_dz
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform *= %2-3 values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_fy += @s _transform

# z value
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform = @s vsv_dx
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform *= %3-1 values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_fz += @s _transform
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform = @s vsv_dy
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform *= %3-2 values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_fz += @s _transform
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform = @s vsv_dz
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s _transform *= %3-3 values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_fz += @s _transform

# Changes final position fxyz to be account for origin shift (txyz doesn't care about origin so no need)
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_fx /= %1000 values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_fy /= %1000 values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_fz /= %1000 values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_fx += %scaled_origin_x values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_fy += %scaled_origin_y values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_fz += %scaled_origin_z values

# Change in values from final values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_tx = @s vsv_fx
execute as @e[tag=vsvVector,type=block_display] store result score @s _transform run data get entity @s Pos[0] 1000
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_tx -= @s _transform
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_ty = @s vsv_fy
execute as @e[tag=vsvVector,type=block_display] store result score @s _transform run data get entity @s Pos[2] 1000
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_ty -= @s _transform
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_tz = @s vsv_fz
execute as @e[tag=vsvVector,type=block_display] store result score @s _transform run data get entity @s Pos[1] 1000
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_tz -= @s _transform

#This essentially starts the transformation
scoreboard players operation %transformation values = %transform_speed values
scoreboard players operation %transformation values *= %10 values

#Final bit of calculations; divides transformation displacement over animation time (ticks)
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_tx /= %transformation values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_ty /= %transformation values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_tz /= %transformation values

