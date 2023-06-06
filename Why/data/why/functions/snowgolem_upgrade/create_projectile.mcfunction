#Creates a projectile based on random number generation
scoreboard players set %proj snowgolem_upgrade 0
execute if predicate why:50_chance run scoreboard players add %proj snowgolem_upgrade 1
execute if predicate why:50_chance run scoreboard players add %proj snowgolem_upgrade 2
execute if predicate why:50_chance run scoreboard players add %proj snowgolem_upgrade 4
execute if predicate why:50_chance run scoreboard players add %proj snowgolem_upgrade 8

#Selection option (a little dangerous since the randomization completely breaks if the score gets set, but I guess that's the point)
execute if score %proj_select snowgolem_upgrade matches 1..15 run scoreboard players operation %proj snowgolem_upgrade = %proj_select snowgolem_upgrade

#Snowball
#Egg
execute if score %proj snowgolem_upgrade matches 1 at @s run summon egg ~ ~ ~ {Tags:["suProj","suSpawned"]}
#Slow potion
execute if score %proj snowgolem_upgrade matches 2 at @s run summon potion ~ ~ ~ {Tags:["suProj","suSpawned"],Item:{id:"minecraft:splash_potion",Count:1b,tag:{Potion:"minecraft:slowness"}}}
#Weakness potion
execute if score %proj snowgolem_upgrade matches 3 at @s run summon potion ~ ~ ~ {Tags:["suProj","suSpawned"],Item:{id:"minecraft:splash_potion",Count:1b,tag:{Potion:"minecraft:weakness"}}}
#Heal/harm potion
execute if score %proj snowgolem_upgrade matches 4 run scoreboard players set %not_undead snowgolem_upgrade 0
execute if score %proj snowgolem_upgrade matches 4 as @e[type=snow_golem,limit=1,sort=nearest] on target if entity @s[type=!#why:undead] run scoreboard players set %not_undead snowgolem_upgrade 1
execute if score %proj snowgolem_upgrade matches 4 if score %not_undead snowgolem_upgrade matches 1 at @s run summon potion ~ ~ ~ {Tags:["suProj","suSpawned"],Item:{id:"minecraft:splash_potion",Count:1b,tag:{Potion:"minecraft:harming"}}}
execute if score %proj snowgolem_upgrade matches 4 if score %not_undead snowgolem_upgrade matches 0 at @s run summon potion ~ ~ ~ {Tags:["suProj","suSpawned"],Item:{id:"minecraft:splash_potion",Count:1b,tag:{Potion:"minecraft:healing"}}}
#Arrow
execute if score %proj snowgolem_upgrade matches 5 at @s run summon arrow ~ ~ ~ {Tags:["suProj","suSpawned"],pickup:2b}
#Spectral arrow
execute if score %proj snowgolem_upgrade matches 6 at @s run summon spectral_arrow ~ ~ ~ {Tags:["suProj","suSpawned"],pickup:2b}
#Trident
execute if score %proj snowgolem_upgrade matches 7 at @s run summon trident ~ ~ ~ {pickup:2b,Tags:["suProj","suSpawned"]}
#Pufferfish
execute if score %proj snowgolem_upgrade matches 8 at @s run summon pufferfish ~ ~ ~ {Tags:["suProj","suSpawned"]}
#Ender pearl
execute if score %proj snowgolem_upgrade matches 9 at @s run summon ender_pearl ~ ~ ~ {Tags:["suProj","suSpawned"]}
#Shulker bullet
execute if score %proj snowgolem_upgrade matches 10 as @e[type=snow_golem,limit=1,sort=nearest] on target run data modify storage snowgolem_upgrade UUID set from entity @s UUID
execute if score %proj snowgolem_upgrade matches 10 at @s run summon shulker_bullet ~ ~ ~ {Tags:["suProj","suSpawned"],Steps:4}
execute if score %proj snowgolem_upgrade matches 10 at @s run data modify entity @e[type=shulker_bullet,tag=suSpawned,limit=1,sort=nearest] Target set from storage snowgolem_upgrade UUID
#Fireworks 
execute if score %proj snowgolem_upgrade matches 11 at @s run summon firework_rocket ~ ~ ~ {LifeTime:20,ShotAtAngle:1b,Tags:["suProj","suSpawned"],FireworksItem:{id:"firework_rocket",Count:1,tag:{Fireworks:{Explosions:[{Type:2,Trail:1b,Colors:[I;4161203,7055308],FadeColors:[I;16449279]},{Type:0,Flicker:1b,Trail:1b,Colors:[I;11459568,14875903],FadeColors:[I;9947585]}]}}}}
#Blaze fireball (power, not motion)
execute if score %proj snowgolem_upgrade matches 12 at @s run summon small_fireball ~ ~ ~ {Tags:["suProj","suSpawned"]}
#Ghast fireball
execute if score %proj snowgolem_upgrade matches 13 at @s run summon fireball ~ ~ ~ {ExplosionPower:0b,Tags:["suProj","suSpawned"]}
#Dragon fireball
execute if score %proj snowgolem_upgrade matches 14 run scoreboard players set %dragon snowgolem_upgrade 0
execute if score %proj snowgolem_upgrade matches 14 if predicate why:50_chance run scoreboard players set %dragon snowgolem_upgrade 1
execute if score %proj snowgolem_upgrade matches 14 run scoreboard players set %not_undead snowgolem_upgrade 0
execute if score %proj snowgolem_upgrade matches 14 as @e[type=snow_golem,limit=1,sort=nearest] on target if entity @s[type=!#why:undead] run scoreboard players set %not_undead snowgolem_upgrade 1
execute if score %proj snowgolem_upgrade matches 14 if score %not_undead snowgolem_upgrade matches 1 if score %dragon snowgolem_upgrade matches 1 at @s run summon dragon_fireball ~ ~ ~ {Tags:["suProj","suSpawned"]}
execute if score %proj snowgolem_upgrade matches 14 if score %not_undead snowgolem_upgrade matches 1 if score %dragon snowgolem_upgrade matches 0 at @s run summon fireball ~ ~ ~ {ExplosionPower:0b,Tags:["suProj","suSpawned"]}
execute if score %proj snowgolem_upgrade matches 14 if score %not_undead snowgolem_upgrade matches 0 at @s run summon fireball ~ ~ ~ {ExplosionPower:0b,Tags:["suProj","suSpawned"]}
#Wither skull
execute if score %proj snowgolem_upgrade matches 15 at @s run summon wither_skull ~ ~ ~ {Tags:["suProj","suSpawned"]}

#Sets motion for entities 1-10
execute if score %proj snowgolem_upgrade matches 1..9 at @s run data modify entity @e[tag=suSpawned,limit=1,sort=nearest] Motion set from entity @s Motion

#Calculates and sets power for entities 12-15
execute if score %proj snowgolem_upgrade matches 11..15 as @e[type=snow_golem,limit=1,sort=nearest] on target run tag @s add suTarget
execute if score %proj snowgolem_upgrade matches 11..15 at @s facing entity @e[tag=suTarget,limit=1,sort=nearest] eyes run summon area_effect_cloud ^ ^ ^1 {Tags:["suDirection"]} 
# x power
execute if score %proj snowgolem_upgrade matches 11..15 store result score %x snowgolem_upgrade run data get entity @s Pos[0] 100
execute if score %proj snowgolem_upgrade matches 11..15 store result score %x_dir snowgolem_upgrade at @s as @e[type=area_effect_cloud,limit=1,sort=nearest,tag=suDirection] run data get entity @s Pos[0] 100
execute if score %proj snowgolem_upgrade matches 11..15 run scoreboard players operation %x_dir snowgolem_upgrade -= %x snowgolem_upgrade
execute if score %proj snowgolem_upgrade matches 11 store result entity @e[tag=suSpawned,limit=1] Motion[0] double 0.008 run scoreboard players get %x_dir snowgolem_upgrade
execute if score %proj snowgolem_upgrade matches 12..15 store result entity @e[tag=suSpawned,limit=1] power[0] double 0.0015 run scoreboard players get %x_dir snowgolem_upgrade
# y power
execute if score %proj snowgolem_upgrade matches 11..15 store result score %y snowgolem_upgrade run data get entity @s Pos[1] 100
execute if score %proj snowgolem_upgrade matches 11..15 store result score %y_dir snowgolem_upgrade at @s as @e[type=area_effect_cloud,limit=1,sort=nearest,tag=suDirection] run data get entity @s Pos[1] 100
execute if score %proj snowgolem_upgrade matches 11..15 run scoreboard players operation %y_dir snowgolem_upgrade -= %y snowgolem_upgrade
execute if score %proj snowgolem_upgrade matches 11 store result entity @e[tag=suSpawned,limit=1] Motion[1] double 0.008 run scoreboard players get %y_dir snowgolem_upgrade
execute if score %proj snowgolem_upgrade matches 12..15 store result entity @e[tag=suSpawned,limit=1] power[1] double 0.0015 run scoreboard players get %y_dir snowgolem_upgrade
# z power
execute if score %proj snowgolem_upgrade matches 11..15 store result score %z snowgolem_upgrade run data get entity @s Pos[2] 100
execute if score %proj snowgolem_upgrade matches 11..15 store result score %z_dir snowgolem_upgrade at @s as @e[type=area_effect_cloud,limit=1,sort=nearest,tag=suDirection] run data get entity @s Pos[2] 100
execute if score %proj snowgolem_upgrade matches 11..15 run scoreboard players operation %z_dir snowgolem_upgrade -= %z snowgolem_upgrade
execute if score %proj snowgolem_upgrade matches 11 store result entity @e[tag=suSpawned,limit=1] Motion[2] double 0.008 run scoreboard players get %z_dir snowgolem_upgrade
execute if score %proj snowgolem_upgrade matches 12..15 store result entity @e[tag=suSpawned,limit=1] power[2] double 0.0015 run scoreboard players get %z_dir snowgolem_upgrade

#Sets owner
execute unless score %proj snowgolem_upgrade matches 8 unless score %proj snowgolem_upgrade matches 10 as @e[type=snow_golem,limit=1,sort=nearest] run data modify entity @e[tag=suSpawned,limit=1] Owner set from entity @s UUID

#Scoreboard counter
execute unless score %proj snowgolem_upgrade matches 8 run scoreboard players set @e[tag=suSpawned] snowgolem_upgrade 200

kill @e[tag=suDirection]
tag @e[tag=suSpawned] remove suSpawned
execute unless score %proj snowgolem_upgrade matches 0 run kill @s
