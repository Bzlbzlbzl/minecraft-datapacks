#Finds a portal, run by DROPPED WATER BUCKET
execute align xyz unless entity @e[tag=aetherCheck,distance=..0.01] run summon area_effect_cloud ~ ~ ~ {Duration:-1,Age:-2147483648,WaitTime:-2147483648,Tags:["aetherCheck"]}
execute align xyz as @e[tag=aetherCheck,distance=..0.01,tag=!aetherFailed,tag=!aetherNorth,tag=!aetherSouth,tag=!aetherEast,tag=!aetherWest,limit=1,sort=nearest] run function aether:scripts/check12
execute align xyz if entity @e[tag=aetherCheck,distance=..0.01,tag=!aetherFailed] run data modify entity @s Item.id set value "minecraft:bucket"