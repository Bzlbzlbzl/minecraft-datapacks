# # # No Jump - Bzlbzlbzl # # #
# use </trigger Jump> to toggle on and off. Using /trigger Jump set 0 will disable you from toggling Jump
#Enables the jump trigger for anyone who accidentally sets their score to negative
execute as @a if score @s Jump matches ..-1 run scoreboard players enable @s Jump
execute as @a if score @s Jump matches ..-1 run scoreboard players set @s Jump 0

#Changes %jump (to 1 or 0 depending on %jump currently) when a player triggers the Jump scoreboard
execute as @a[scores={Jump=1..},limit=1] if score %jump Jump matches 0 run tellraw @a ["",{"selector":"@s","bold":true,"color":"green"},{"text":" enabled jumping!","bold":true,"color":"green"}]
execute as @a[scores={Jump=1..},limit=1] if score %jump Jump matches 1 run tellraw @a ["",{"selector":"@s","bold":true,"color":"red"},{"text":" disabled jumping!","bold":true,"color":"red"}]
execute as @a[scores={Jump=1..},limit=1] run scoreboard players add %jump Jump 1
execute as @a[scores={Jump=1..},limit=1] if score %jump Jump matches 2.. run scoreboard players set %jump Jump 0
execute as @a[scores={Jump=1..},limit=1] run effect clear @a minecraft:jump_boost
execute as @a[scores={Jump=1..},limit=1] run scoreboard players enable * Jump
execute as @a[scores={Jump=1..},limit=1] run scoreboard players set @a Jump 0

#Gives the no-jump effect if %jump is 0 (1639 is the number where the effect looks like **** instead of numbers)
execute if score %jump Jump matches 0 run effect give @a minecraft:jump_boost 1639 128 true

#Stores the FallDistance of each player into FallDistance; removes jump boost if will take fall damage
execute if score %jump Jump matches 0 as @a store result score @s FallDistance run data get entity @s FallDistance 10
execute if score %jump Jump matches 0 as @a[scores={FallDistance=27..}] run effect clear @s minecraft:jump_boost

#Removes jump boost for all players who just took damage (to prevent the weird jump boost launch)
# WARNING: This check is not perfect and jump boost launch MAY still occur
#execute as @a[nbt=!{HurtTime:0s}] run effect clear @s minecraft:jump_boost
execute as @a[nbt={HurtTime:10s}] run effect clear @s minecraft:jump_boost
execute as @a[nbt={HurtTime:9s}] run effect clear @s minecraft:jump_boost
execute as @a[nbt={HurtTime:8s}] run effect clear @s minecraft:jump_boost
execute as @a[nbt={HurtTime:7s}] run effect clear @s minecraft:jump_boost
execute as @a[nbt={HurtTime:6s}] run effect clear @s minecraft:jump_boost