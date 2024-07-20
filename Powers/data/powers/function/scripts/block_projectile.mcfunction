#Run by projectile that is getting blocked
summon vindicator ~ ~-0.8 ~ {PortalCooldown:10000000,CustomNameVisible:1b,DeathLootTable:"minecraft:empty",Team:"president",Health:1f,Johnny:1b,Tags:["presGuard","presSpawned"],CustomName:'"Bodyguard"',active_effects:[{id:"minecraft:wither",amplifier:1,duration:40,show_particles:0b}],attributes:[{id:"minecraft:generic.max_health",base:4}]}
data modify entity @e[type=vindicator,tag=presSpawned,limit=1] Motion set from entity @s Motion
execute if data entity @s[type=#arrows] weapon.components."minecraft:enchantments".levels."minecraft:flame" run data modify entity @e[type=vindicator,tag=presSpawned,limit=1] HasVisualFire set value 1b
execute if entity @s[type=arrow,nbt={item:{id:"minecraft:tipped_arrow"}}] run particle entity_effect{color:[0.000,0.000,0.000,0.90]} ~ ~ ~ 0.2 0.2 0.2 1 40 force
execute if entity @s[type=spectral_arrow] run effect give @e[type=vindicator,tag=presSpawned,limit=1] glowing 10 0 false
execute if entity @s[type=firework_rocket] run particle minecraft:flash ~ ~ ~ 0 0 0 1 1 force
execute if entity @s[type=firework_rocket] run playsound minecraft:entity.firework_rocket.blast master @a ~ ~ ~ 1 2
execute if entity @s[type=snowball] run playsound minecraft:entity.player.hurt_freeze master @a ~ ~ ~ 1 1
execute if entity @s[type=fireball] run playsound minecraft:entity.generic.explode master @a ~ ~ ~ 1 2
execute if entity @s[type=fireball] run particle minecraft:explosion ~ ~ ~ 0 0 0 0 1 force
execute if entity @s[type=small_fireball] run data modify entity @e[type=vindicator,tag=presSpawned,limit=1] HasVisualFire set value 1b
execute if entity @s[type=egg] if predicate powers:50_chance run summon chicken ~ ~ ~ {Age:-24000}
execute if entity @s[type=trident] run data modify entity @s shake set value 1b
execute if entity @s[type=trident] run data modify entity @s Motion set value [0.0,0.0,0.0]
execute if entity @s[type=trident] run data modify entity @s damage set value 0
execute if entity @s[type=trident] run tag @s add presProj
execute if entity @s[type=dragon_fireball] run particle dragon_breath ~ ~ ~ 0.2 0.2 0.2 0.05 40 force
execute if entity @s[type=dragon_fireball] run playsound entity.dragon_fireball.explode master @a ~ ~ ~ 1 2
execute if entity @s[type=wither_skull] run playsound minecraft:entity.generic.explode master @a ~ ~ ~ 1 2
execute if entity @s[type=wither_skull] run particle minecraft:explosion ~ ~ ~ 0 0 0 0 1 force
execute if entity @s[type=wind_charge] run playsound minecraft:entity.wind_charge.wind_burst master @a ~ ~ ~ 1 2
execute if entity @s[type=wind_charge] run particle minecraft:gust ~ ~ ~ 0.2 0.2 0.2 0 1 force
execute if entity @s[type=breeze_wind_charge] run playsound minecraft:entity.wind_charge.wind_burst master @a ~ ~ ~ 1 2
execute if entity @s[type=breeze_wind_charge] run particle minecraft:gust ~ ~ ~ 0.2 0.2 0.2 0 1 force
execute if entity @s[type=shulker_bullet] run effect give @e[type=vindicator,tag=presSpawned,limit=1] levitation 10 3 false
execute unless entity @s[type=trident] run kill @s
tag @e[type=vindicator,tag=presSpawned,limit=1] remove presSpawned