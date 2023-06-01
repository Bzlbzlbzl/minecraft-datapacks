#Another funky function because of Minecraft's glitchiness; just makes enderman look at skeleton and adds tag
execute anchored feet run tp @s ~ ~ ~ facing entity @e[tag=psyCreature,type=skeleton,limit=1,sort=nearest] feet
execute at @s rotated ~ 0 positioned ^ ^-0.7 ^0.8 run tp @e[type=armor_stand,tag=psyHead,limit=1,sort=nearest] ~ ~ ~
execute at @s anchored feet run tp @s ~ ~ ~ ~ 0
tag @s add psyLooked
