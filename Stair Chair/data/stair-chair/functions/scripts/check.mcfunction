#Check if there stair there; summons pig for new stair (directions are inverted because minecraft thinks the "facing" side is the whole side)
#North (south)
execute if block ~ ~ ~ #minecraft:stairs[facing=north,half=bottom,shape=straight,waterlogged=false] align xyz positioned ~0.5 ~-0.399 ~0.62 unless entity @e[type=pig,tag=pigChair,distance=..0.2] run summon pig ~ -2 ~ {Silent:1b,Invulnerable:1b,NoAI:1b,Health:20f,Age:2147483647,Saddle:0b,Rotation:[0F,0F],Tags:["pigChair","newPChair"],ActiveEffects:[{Id:14b,Amplifier:0b,Duration:2147483647,ShowParticles:0b}],Attributes:[{Name:generic.max_health,Base:20}]}
execute if block ~ ~ ~ #minecraft:stairs[facing=north,half=bottom,shape=straight,waterlogged=false] align xyz positioned ~0.5 ~-0.399 ~0.62 unless entity @e[type=pig,tag=pigChair,distance=..0.2] run tp @e[type=pig,tag=pigChair,tag=newPChair,limit=1,sort=nearest,nbt={Age:2147483647,Saddle:0b,Rotation:[0F,0F]}] ~ ~ ~
#South (north)
execute if block ~ ~ ~ #minecraft:stairs[facing=south,half=bottom,shape=straight,waterlogged=false] align xyz positioned ~0.5 ~-0.399 ~0.38 unless entity @e[type=pig,tag=pigChair,distance=..0.2] run summon pig ~ -2 ~ {Silent:1b,Invulnerable:1b,NoAI:1b,Health:20f,Age:2147483647,Saddle:0b,Rotation:[180F,0F],Tags:["pigChair","newPChair"],ActiveEffects:[{Id:14b,Amplifier:0b,Duration:2147483647,ShowParticles:0b}],Attributes:[{Name:generic.max_health,Base:20}]}
execute if block ~ ~ ~ #minecraft:stairs[facing=south,half=bottom,shape=straight,waterlogged=false] align xyz positioned ~0.5 ~-0.399 ~0.38 unless entity @e[type=pig,tag=pigChair,distance=..0.2] run tp @e[type=pig,tag=pigChair,tag=newPChair,limit=1,sort=nearest,nbt={Age:2147483647,Saddle:0b,Rotation:[180F,0F]}] ~ ~ ~
#West (east)
execute if block ~ ~ ~ #minecraft:stairs[facing=west,half=bottom,shape=straight,waterlogged=false] align xyz positioned ~0.62 ~-0.399 ~0.5 unless entity @e[type=pig,tag=pigChair,distance=..0.2] run summon pig ~ -2 ~ {Silent:1b,Invulnerable:1b,NoAI:1b,Health:20f,Age:2147483647,Saddle:0b,Rotation:[-90F,0F],Tags:["pigChair","newPChair"],ActiveEffects:[{Id:14b,Amplifier:0b,Duration:2147483647,ShowParticles:0b}],Attributes:[{Name:generic.max_health,Base:20}]}
execute if block ~ ~ ~ #minecraft:stairs[facing=west,half=bottom,shape=straight,waterlogged=false] align xyz positioned ~0.62 ~-0.399 ~0.5 unless entity @e[type=pig,tag=pigChair,distance=..0.2] run tp @e[type=pig,tag=pigChair,tag=newPChair,limit=1,sort=nearest,nbt={Age:2147483647,Saddle:0b,Rotation:[-90F,0F]}] ~ ~ ~
#East (west)
execute if block ~ ~ ~ #minecraft:stairs[facing=east,half=bottom,shape=straight,waterlogged=false] align xyz positioned ~0.38 ~-0.399 ~0.5 unless entity @e[type=pig,tag=pigChair,distance=..0.2] run summon pig ~ -2 ~ {Silent:1b,Invulnerable:1b,NoAI:1b,Health:20f,Age:2147483647,Saddle:0b,Rotation:[90F,0F],Tags:["pigChair","newPChair"],ActiveEffects:[{Id:14b,Amplifier:0b,Duration:2147483647,ShowParticles:0b}],Attributes:[{Name:generic.max_health,Base:20}]}
execute if block ~ ~ ~ #minecraft:stairs[facing=east,half=bottom,shape=straight,waterlogged=false] align xyz positioned ~0.38 ~-0.399 ~0.5 unless entity @e[type=pig,tag=pigChair,distance=..0.2] run tp @e[type=pig,tag=pigChair,tag=newPChair,limit=1,sort=nearest,nbt={Age:2147483647,Saddle:0b,Rotation:[90F,0F]}] ~ ~ ~

#Removes 1 from range then continues recursion
scoreboard players remove @s sc_range 1
execute unless score @s sc_range matches ..0 if block ~ ~ ~ air positioned ^ ^ ^0.2 run function stair-chair:scripts/check