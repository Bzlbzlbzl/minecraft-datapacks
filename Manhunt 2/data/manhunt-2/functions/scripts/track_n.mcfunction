#Spawns a new marker on the runner's location (if in dimension NETHER)
execute if entity @a[tag=manhuntRunner,nbt={Dimension:"minecraft:the_nether"}] run kill @e[tag=manhuntMarkerN]
execute at @a[tag=manhuntRunner,nbt={Dimension:"minecraft:the_nether"},limit=1,sort=nearest] run summon armor_stand ~ ~ ~ {Tags:["manhuntMarkerN"],Marker:1b,Invisible:1b,Silent:1b}
