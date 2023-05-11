#Stretches the tail to the vector. This is only run during generation. 
data merge entity @s {start_interpolation:0,interpolation_duration:20}
execute store result entity @s transformation.scale[2] float 1 run scoreboard players get @s vsv_norm
