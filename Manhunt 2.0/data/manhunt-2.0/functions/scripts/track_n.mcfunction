#Spawns a new marker on the runner's location, and then points towards it (runs function point) NETHER
execute if entity @a[tag=manhuntRunner,nbt={Dimension:"minecraft:the_nether"}] run kill @e[tag=manhuntMarkerN]
execute at @a[tag=manhuntRunner,nbt={Dimension:"minecraft:the_nether"},limit=1,sort=nearest] run summon armor_stand ~ ~ ~ {Tags:["manhuntMarkerN"],Marker:1b,Invisible:1b}
execute facing entity @e[tag=manhuntMarkerN,limit=1,sort=nearest] eyes positioned ~ ~0.8 ~ rotated ~ 0 run function manhunt-2.0:scripts/point