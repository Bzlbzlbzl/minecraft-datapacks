#Another funky function because of Minecraft's glitchiness; just makes enderman and head rotate and adds tag
execute at @s anchored feet run tp @s ~ ~ ~ ~60 0
execute at @s rotated ~ 0 positioned ^ ^-0.7 ^0.8 run data modify entity @e[type=armor_stand,tag=psyHead,limit=1,sort=nearest] Rotation set from entity @s Rotation
tag @s add psyRotated
