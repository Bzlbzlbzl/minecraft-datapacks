#Summons an armorstand on you to execute the circle function for you (so your head doesnt get force turned)
summon minecraft:armor_stand ~ ~0.1 ~ {Marker:1b,Invisible:1b,Invulnerable:1b,Tags:["tpParticle"],Rotation:[0.0f,0.0f]}
execute as @e[tag=tpParticle] at @s run function tp-bow:make_circle
kill @e[type=armor_stand,tag=tpParticle]