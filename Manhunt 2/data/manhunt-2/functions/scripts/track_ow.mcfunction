#Spawns a new marker on the runner's location (if in dimension OVERWORLD)
execute if entity @a[tag=manhuntRunner,nbt={Dimension:"minecraft:overworld"}] run kill @e[tag=manhuntMarkerOW]
execute at @a[tag=manhuntRunner,nbt={Dimension:"minecraft:overworld"},limit=1,sort=nearest] run summon armor_stand ~ ~ ~ {Tags:["manhuntMarkerOW"],Marker:1b,Invisible:1b}