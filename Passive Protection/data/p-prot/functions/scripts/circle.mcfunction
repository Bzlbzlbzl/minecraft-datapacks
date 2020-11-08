#Summons an armorstand on you to execute the circle function for you (so your head doesnt get force turned)
summon minecraft:armor_stand ~ ~0.1 ~ {Marker:1b,Invisible:1b,Invulnerable:1b,Tags:["tpParticle"],Rotation:[0.0f,0.0f]}
execute if entity @s[type=minecraft:player] as @e[tag=tpParticle] at @s run function p-prot:scripts/player_circle
execute if entity @s[type=!minecraft:player] as @e[tag=tpParticle] at @s run function p-prot:scripts/mob_circle
kill @e[type=armor_stand,tag=tpParticle]