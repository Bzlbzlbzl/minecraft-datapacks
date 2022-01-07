# # # Stair Chair - Bzlbzlbzl # # #

#For anyone holding a saddle, resets sc_range to 22 and then runs a recursive pig spawning check
execute as @a[nbt={SelectedItem:{id:"minecraft:saddle"}}] run scoreboard players set @s sc_range 22
execute as @a[nbt={SelectedItem:{id:"minecraft:saddle"}}] at @s anchored eyes run function stair-chair:scripts/check
execute as @a[nbt={Inventory:[{Slot:-106b, id:"minecraft:saddle"}]}] run scoreboard players set @s sc_range 22
execute as @a[nbt={Inventory:[{Slot:-106b, id:"minecraft:saddle"}]}] at @s anchored eyes run function stair-chair:scripts/check

#Checks if a newPChair pig has become saddled, if so summons saddle item and untags the newPChair tag
execute as @e[type=pig,tag=newPChair,nbt={Saddle:1b}] at @s run summon item ~ ~1 ~ {Item:{id:"minecraft:saddle",Count:1b}}
execute as @e[type=pig,tag=newPChair,nbt={Saddle:1b}] run tag @s remove newPChair

#Checks if newPChair pig has existed for 5 seconds (by checking age is 100 less than spawned with), if so then tags the pig toKill
execute as @e[type=pig,tag=newPChair] if data entity @s {Age:2147483547} run tag @s add toKill

#Checks if pigChair pig has still a stair there, if not then tags the pig toKill
execute as @e[type=pig,tag=pigChair,tag=!toKill] at @s unless block ~ ~1 ~ #minecraft:stairs[half=bottom,shape=straight,waterlogged=false] run tag @s add toKill

#First teleports the player off, then kills all toKill pigChair pigs
execute as @e[predicate=stair-chair:riding_death] at @s run tp @s ~ ~1 ~
execute as @e[type=pig,tag=pigChair,tag=toKill] at @s run tp @s ~ -72 ~
kill @e[type=pig,tag=pigChair,tag=toKill]