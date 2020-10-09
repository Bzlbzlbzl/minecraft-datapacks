# # # Death Swap Datapack - Bzlbzlbzl # # #

#Gives all players still in survival their own ID in random order when countdown is started
execute if score %countdown death_swap matches 5999 as @r[gamemode=survival,scores={death_swap=-1}] run function death-swap:reset

#Gamemode spectator players who've died so they can't participate in next swap, and resets the order
execute unless score %countdown death_swap matches -1 as @a[scores={death_swap_died=1..}] run gamemode spectator @s
execute unless score %countdown death_swap matches -1 as @a[scores={death_swap_died=1..}] run scoreboard players set @a death_swap -1
execute unless score %countdown death_swap matches -1 as @a[scores={death_swap_died=1..}] run scoreboard players set %next death_swap 0
execute unless score %countdown death_swap matches -1 as @a[scores={death_swap_died=1..}] as @r[gamemode=survival,scores={death_swap=-1}] run function death-swap:reset
execute unless score %countdown death_swap matches -1 as @a[scores={death_swap_died=1..}] run scoreboard players set @s death_swap_died 0

#Summons a temporary marker as the first player and then swaps players when countdown reaches 0 then teleports highest player to marker
execute if score %countdown death_swap matches 0 as @a[scores={death_swap=0}] run summon area_effect_cloud ~ ~ ~ {Duration:10,Tags:["toSwap"]}
execute if score %countdown death_swap matches 0 run function death-swap:swap
execute if score %countdown death_swap matches 0 as @a if score @s death_swap = %swap death_swap run tp @s @e[tag=toSwap,limit=1]

#Checks player count to see if someones won. If so, then stops countdown and tellraws winner
execute unless score %countdown death_swap matches -1 store result score %remaining death_swap if entity @a[gamemode=survival]
execute unless score %countdown death_swap matches -1 if score %remaining death_swap matches 1 run tellraw @a {"text":"","color":"dark_green","bold":true,"extra":[{"selector":"@p[gamemode=survival]"},{"text":" has won the game!"}]}
execute unless score %countdown death_swap matches -1 if score %remaining death_swap matches 1 run scoreboard players set %countdown death_swap -1

#If countdown is 0 and there was no winner, then starts the game back up again
execute if score %countdown death_swap matches 0 run function death-swap:start

#Decreases the %countdown by 1 every tick
execute if score %countdown death_swap matches 1.. run scoreboard players remove %countdown death_swap 1