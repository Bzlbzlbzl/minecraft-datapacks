#Makes the mob get pushed, away from presPush
execute facing entity @a[tag=presPush,limit=1,sort=nearest] feet rotated ~ 0 run summon marker ^ ^ ^-1.5 {Tags:["pushMarker"]}
execute store result score @s pres_drop run data get entity @s Pos[0]
execute store result score %marker pres_drop run data get entity @e[type=marker,tag=pushMarker,limit=1,sort=nearest] Pos[0]
scoreboard players operation %marker pres_drop -= @s pres_drop
execute store result entity @s Motion[0] double 1 run scoreboard players get %marker pres_drop
execute store result score @s pres_drop run data get entity @s Pos[2]
execute store result score %marker pres_drop run data get entity @e[type=marker,tag=pushMarker,limit=1,sort=nearest] Pos[2]
scoreboard players operation %marker pres_drop -= @s pres_drop
execute store result entity @s Motion[2] double 1 run scoreboard players get %marker pres_drop
data modify entity @s Motion[1] set value 1.0d
kill @e[type=marker,tag=pushMarker]