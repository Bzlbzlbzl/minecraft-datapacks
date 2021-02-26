# # # Magnetism - Bzlbzlbzl # # #
# use </trigger magnetism> to toggle on and off. Using /trigger magnetism set 0 will disable you from toggling magnetism
#Enables the jump trigger for anyone who accidentally sets their score to negative
execute as @a if score @s magnetism matches ..-1 run scoreboard players enable @s magnetism
execute as @a if score @s magnetism matches ..-1 run scoreboard players set @s magnetism 0

#Changes %magnetism (to 1 or 0 depending on %jump currently) when a player triggers the Jump scoreboard
execute as @a[scores={magnetism=1..},limit=1] if score %magnetism magnetism matches 0 run tellraw @a ["",{"selector":"@s","bold":true,"color":"green"},{"text":" enabled magnetism!","bold":true,"color":"green"}]
execute as @a[scores={magnetism=1..},limit=1] if score %magnetism magnetism matches 1 run tellraw @a ["",{"selector":"@s","bold":true,"color":"red"},{"text":" disabled magnetism!","bold":true,"color":"red"}]
execute as @a[scores={magnetism=1..},limit=1] run scoreboard players add %magnetism magnetism 1
execute as @a[scores={magnetism=1..},limit=1] if score %magnetism magnetism matches 2.. run scoreboard players set %magnetism magnetism 0
execute as @a[scores={magnetism=1..},limit=1] run scoreboard players enable * magnetism
execute as @a[scores={magnetism=1..},limit=1] run scoreboard players set @a magnetism 0