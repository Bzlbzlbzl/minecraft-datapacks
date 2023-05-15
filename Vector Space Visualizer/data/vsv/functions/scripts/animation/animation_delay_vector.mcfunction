# Expands the vector block to the scoreboard value (calculating translations as well). This is only run during generation. 
data merge entity @s {start_interpolation:0,interpolation_duration:10}
execute if score %vector_size values matches ..-1 run data modify entity @s Glowing set value 1b
scoreboard players operation %calc_v_size values = %vector_size values
execute if score %calc_v_size values matches ..-1 run scoreboard players operation %calc_v_size values *= %-1 values
execute store result entity @s transformation.scale[0] float 0.1 run scoreboard players get %calc_v_size values
execute store result entity @s transformation.scale[1] float 0.1 run scoreboard players get %calc_v_size values
execute store result entity @s transformation.scale[2] float 0.1 run scoreboard players get %calc_v_size values
#This part just to avoid decimal truncation
scoreboard players operation %calc_v_size values *= %10 values
scoreboard players operation %calc_v_size values /= %2 values
execute store result entity @s transformation.translation[0] float -0.01 run scoreboard players get %calc_v_size values
execute store result entity @s transformation.translation[1] float -0.01 run scoreboard players get %calc_v_size values
execute store result entity @s transformation.translation[2] float -0.01 run scoreboard players get %calc_v_size values