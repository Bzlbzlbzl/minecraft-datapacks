# # # No Jump - Bzlbzlbzl # # #
# use </trigger jump> to toggle on and off. Using /trigger jump set 0 will disable you from toggling jump

#Changes %jump (to 1 or 0 depending on %jump currently) when a player triggers the jump scoreboard
execute as @a[scores={jump=1..},limit=1] if score %jump nj_fallDistance matches 0 run tellraw @a ["",{"selector":"@s","bold":true,"color":"green"},{"text":" enabled jumping!","bold":true,"color":"green"}]
execute as @a[scores={jump=1..},limit=1] if score %jump nj_fallDistance matches 1 run tellraw @a ["",{"selector":"@s","bold":true,"color":"red"},{"text":" disabled jumping!","bold":true,"color":"red"}]
execute as @a[scores={jump=1..},limit=1] run scoreboard players add %jump nj_fallDistance 1
execute as @a[scores={jump=1..},limit=1] if score %jump nj_fallDistance matches 2.. run scoreboard players set %jump nj_fallDistance 0
execute as @a[scores={jump=1..},limit=1] run effect clear @a minecraft:jump_boost

#Enables the jump trigger for anyone who just joined or set score to negative (DISABLED WHEN %lock is 1)
execute unless score %lock nj_fallDistance matches 1 as @a unless score @s jump matches 0 run scoreboard players enable @a jump
execute unless score %lock nj_fallDistance matches 1 as @a unless score @s jump matches 0 run scoreboard players set @a jump 0

#Gives the no-jump effect if %jump is 0 (1639 is the number where the effect looks like **** instead of numbers)
execute if score %jump nj_fallDistance matches 0 run effect give @a minecraft:jump_boost 1639 128 true

#Stores the FallDistance of each player into fallDistance; removes jump boost if will take fall damage
execute if score %jump nj_fallDistance matches 0 as @a store result score @s nj_fallDistance run data get entity @s FallDistance 10
execute if score %jump nj_fallDistance matches 0 as @a[scores={nj_fallDistance=27..}] run effect clear @s minecraft:jump_boost

#Removes jump boost and teleports back for all players who just took damage (to prevent the weird jump boost launch)
#execute if score %jump nj_fallDistance matches 0 as @a[nbt=!{HurtTime:0s}] run effect clear @s minecraft:jump_boost
execute if score %jump nj_fallDistance matches 0 as @a[nbt={HurtTime:10s}] run effect clear @s minecraft:jump_boost
execute if score %jump nj_fallDistance matches 0 as @a[nbt={HurtTime:9s}] run effect clear @s minecraft:jump_boost
execute if score %jump nj_fallDistance matches 0 as @a[nbt={HurtTime:10s}] run effect clear @s minecraft:jump_boost
execute if score %jump nj_fallDistance matches 0 as @a[nbt={HurtTime:9s}] run effect clear @s minecraft:jump_boost


execute if score %jump nj_fallDistance matches 0 as @a[nbt={HurtTime:10s}] at @s run tp @s ~ ~ ~
execute if score %jump nj_fallDistance matches 0 as @a[nbt={HurtTime:9s}] at @s run tp @s ~ ~ ~
execute if score %jump nj_fallDistance matches 0 as @a[nbt={HurtTime:10s}] at @s run tp @s ~ ~ ~
execute if score %jump nj_fallDistance matches 0 as @a[nbt={HurtTime:9s}] at @s run tp @s ~ ~ ~