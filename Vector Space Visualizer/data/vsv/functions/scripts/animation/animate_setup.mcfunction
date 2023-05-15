#Copied from transform_setup.mcfunction, except uses the animation counter
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
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_fx /= %100 values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_fy /= %100 values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_fz /= %100 values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_fx += %scaled_origin_x values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_fy += %scaled_origin_y values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_fz += %scaled_origin_z values

# Change in values from final values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_tx = @s vsv_fx
execute as @e[tag=vsvVector,type=block_display] store result score @s _transform run data get entity @s Pos[0] 100
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_tx -= @s _transform
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_ty = @s vsv_fy
execute as @e[tag=vsvVector,type=block_display] store result score @s _transform run data get entity @s Pos[2] 100
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_ty -= @s _transform
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_tz = @s vsv_fz
execute as @e[tag=vsvVector,type=block_display] store result score @s _transform run data get entity @s Pos[1] 100
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_tz -= @s _transform

#Final bit of calculations; divides animation displacement over animation time (ticks)
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_tx /= %10 values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_ty /= %10 values
execute as @e[tag=vsvVector,type=block_display] run scoreboard players operation @s vsv_tz /= %10 values
