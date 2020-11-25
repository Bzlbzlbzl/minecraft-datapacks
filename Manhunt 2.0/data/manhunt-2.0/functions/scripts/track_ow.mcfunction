#Spawns a new marker on the runner's location (if in dimension), and then points towards it (runs function point) OVERWORLD
execute if entity @a[tag=manhuntRunner,nbt={Dimension:"minecraft:overworld"}] run kill @e[tag=manhuntMarkerOW]
execute at @a[tag=manhuntRunner,nbt={Dimension:"minecraft:overworld"},limit=1,sort=nearest] run summon armor_stand ~ ~ ~ {Tags:["manhuntMarkerOW"],Marker:1b,Invisible:1b}
execute facing entity @e[tag=manhuntMarkerOW,limit=1,sort=nearest] eyes positioned ~ ~0.8 ~ rotated ~ 0 run function manhunt-2.0:scripts/point