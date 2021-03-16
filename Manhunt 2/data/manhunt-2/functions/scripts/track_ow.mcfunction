#Spawns a new marker on the runner's location (if in dimension OVERWORLD)
execute if entity @a[tag=manhuntRunner,nbt={Dimension:"minecraft:overworld"}] as @e[tag=manhuntMarkerOW] at @s run forceload remove ~ ~ ~ ~
execute if entity @a[tag=manhuntRunner,nbt={Dimension:"minecraft:overworld"}] run kill @e[tag=manhuntMarkerOW]
execute at @a[tag=manhuntRunner,nbt={Dimension:"minecraft:overworld"},limit=1,sort=nearest] run summon armor_stand ~ -5 ~ {Tags:["manhuntMarkerOW"],Marker:1b,Invisible:1b,Silent:1b}
execute as @e[tag=manhuntMarkerOW] at @s run forceload add ~ ~ ~ ~