# # # Half Sleep Datapack - Bzlbzlbzl # # #

#Resets the sleep scoreboard and sleeping tag if sleeping player SleepTimer data = 0 (not in bed anymore)
# THEN adds sleeping tag to players with sleep score 1.. (because SleepTimer defaults to 0, would confuse with just sleeping player)
execute as @a[tag=sleeping] if data entity @s {SleepTimer:0s} run scoreboard players set @s sleep 0
execute as @a[tag=sleeping] if data entity @s {SleepTimer:0s} run tag @s remove sleeping
execute as @a if score @s sleep matches 1.. run tag @s add sleeping

#Sets %asleep score to the number of players done with sleeping, then multiplies it by 2; sets %players score to the number of players on the server
execute store result score %asleep sleep if entity @a[tag=sleeping,nbt={SleepTimer:100s}]
scoreboard players operation %asleep sleep *= %2 sleep
execute store result score %players sleep if entity @a

#Sets time to 0 if enough players are asleep
execute if score %asleep sleep >= %players sleep run time set 0