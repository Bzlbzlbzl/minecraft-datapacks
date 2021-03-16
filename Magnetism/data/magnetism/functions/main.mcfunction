# # # Magnetism - Bzlbzlbzl # # #
# use </trigger magnetism> to toggle on and off. Using /trigger magnetism set 0 will disable you from toggling magnetism

#Changes %magnetism (to 1 or 0 depending on %magnetism currently) when a player triggers the magnetism scoreboard
execute as @a[scores={magnetism=1..},limit=1] if score %magnetism magnetism_dist matches 0 run tellraw @a ["",{"selector":"@s","bold":true,"color":"green"},{"text":" enabled magnetism!","bold":true,"color":"green"}]
execute as @a[scores={magnetism=1..},limit=1] if score %magnetism magnetism_dist matches 1 run tellraw @a ["",{"selector":"@s","bold":true,"color":"red"},{"text":" disabled magnetism!","bold":true,"color":"red"}]
execute as @a[scores={magnetism=1..},limit=1] run scoreboard players add %magnetism magnetism_dist 1
execute as @a[scores={magnetism=1..},limit=1] if score %magnetism magnetism_dist matches 2.. run scoreboard players set %magnetism magnetism_dist 0

#Enables the magnetism trigger for anyone who just joined or set score to negative (DISABLED WHEN %lock is 1)
execute unless score %lock magnetism_dist matches 1 as @a unless score @s magnetism matches 0 run scoreboard players enable @a magnetism 
execute unless score %lock magnetism_dist matches 1 as @a unless score @s magnetism matches 0 run scoreboard players set @a magnetism 0

#Runs the pull function for all players when %magnetism is 1 (sort is random to prevent a single player from getting priority)
execute if score %magnetism magnetism_dist matches 1 as @a[sort=random] at @s run function magnetism:scripts/pull

#Plays border particles for all sneaking players (cooldown 1 second)
execute if score %magnetism magnetism_dist matches 1 as @a[predicate=magnetism:sneaking] unless score @s magnetism_cd matches 1.. at @s run summon area_effect_cloud ~ ~0.3 ~ {Tags:["magneticRange"],Duration:1,Radius:0f}
execute if score %magnetism magnetism_dist matches 1 as @a[predicate=magnetism:sneaking] unless score @s magnetism_cd matches 1.. run scoreboard players set @s magnetism_cd 20
execute if score %magnetism magnetism_dist matches 1 as @e[tag=magneticRange] at @s run function magnetism:scripts/circle
execute if score %magnetism magnetism_dist matches 1 run kill @e[tag=magneticRange]
execute if score %magnetism magnetism_dist matches 1 as @a[scores={magnetism_cd=1..}] run scoreboard players remove @s magnetism_cd 1