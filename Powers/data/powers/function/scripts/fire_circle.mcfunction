# Draws a fire circle
summon armor_stand ~ ~0.1 ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["powersCurr"]}
execute as @e[type=armor_stand,tag=powersCurr] at @s run function powers:scripts/fire_circle_tick
kill @e[type=armor_stand,tag=powersCurr,limit=1,sort=nearest]