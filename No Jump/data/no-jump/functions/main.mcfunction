# # # No Jump - Bzlbzlbzl # # #

#Enables the jump trigger for anyone without a score yet and then sets their score to 0 (this is for new players)
execute as @a unless score @s Jump matches 0.. run scoreboard players enable @s Jump
execute as @a unless score @s Jump matches 0.. run scoreboard players set @s Jump 0

#Changes %jump (to 1 or 0 depending on %jump currently) when a player triggers the Jump scoreboard
execute as @a[scores={Jump=1..},limit=1] run scoreboard players add %jump Jump 1
execute as @a[scores={Jump=1..},limit=1] if score %jump Jump matches 2.. run scoreboard players set %jump Jump 0
execute as @a[scores={Jump=1..},limit=1] run effect clear @a minecraft:jump_boost
execute as @a[scores={Jump=1..},limit=1] run scoreboard players enable @a Jump
execute as @a[scores={Jump=1..},limit=1] run scoreboard players set @a Jump 0

execute as @a[scores={Jump=1..}] if score %jump Jump matches 0 run scoreboard players set %jump Jump 1
execute as @a[scores={Jump=1..}] run scoreboard players enable @a Jump
execute as @a[scores={Jump=1..}] run scoreboard players set @a Jump 0

#Gives the no-jump effect if %jump is 0 (1639 is the number where the effect looks like **** isntead of numbers)
execute if score %jump Jump matches 0 run effect give @a minecraft:jump_boost 1639 128 true

#Stores the FallDistance of each player into FallDistance; removes jump boost if will take fall damage
execute if score %jump Jump matches 0 as @a store result score @s FallDistance run data get entity @s FallDistance 10
execute if score %jump Jump matches 0 as @a[scores={FallDistance=27..}] run effect clear @s minecraft:jump_boost