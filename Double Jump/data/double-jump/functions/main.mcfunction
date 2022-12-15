# # # Double Jump - Bzlbzlbzl # # #
# use </trigger double_jump> to toggle on and off. Using /trigger double_jump set 0 will disable you from toggling double_jump

#Changes %doublejump (to 1 or 0 depending on %doublejump currently) when a player triggers the double_jump scoreboard
execute as @a[scores={double_jump=1..},limit=1] if score %doublejump double_jump matches 0 run tellraw @a ["",{"selector":"@s","bold":true,"color":"green"},{"text":" enabled double jumping!","bold":true,"color":"green"}]
execute as @a[scores={double_jump=1..},limit=1] if score %doublejump double_jump matches 1 run tellraw @a ["",{"selector":"@s","bold":true,"color":"red"},{"text":" disabled double jumping!","bold":true,"color":"red"}]
execute as @a[scores={double_jump=1..},limit=1] if score %doublejump double_jump matches 1 run clear @a elytra{doubleJump:1s}
execute as @a[scores={double_jump=1..},limit=1] run scoreboard players add %doublejump double_jump 1
execute as @a[scores={double_jump=1..},limit=1] if score %doublejump double_jump matches 2.. run scoreboard players set %doublejump double_jump 0

#Enables the double_jump trigger for anyone who just joined or set score to negative (DISABLED WHEN %lock is 1)
execute unless score %lock double_jump matches 1 as @a unless score @s double_jump matches 0 run scoreboard players enable @a double_jump
execute unless score %lock double_jump matches 1 as @a unless score @s double_jump matches 0 run scoreboard players set @a double_jump 0


#Updates ID number of non-IDed player (and creates a placeholder in the minecraft:double-jump storage)
execute as @a unless score @s dj_id matches 0.. run function double-jump:scripts/update_id

#Gives an elytra to all players who are not OnGround and not in #climables, water, lava, #snow. (manages storage)
execute if score %doublejump double_jump matches 1 as @a[nbt={OnGround:0b}] at @s unless score @s dj_cd matches 1.. unless entity @s[nbt={Inventory:[{Slot:102b,id:"minecraft:elytra"}]}] unless block ~ ~ ~ #climbable unless block ~ ~ ~ water unless block ~ ~ ~ lava unless block ~ ~ ~ #snow run function double-jump:scripts/give_elytra

#If conditions not met, removes elytra from them
execute if score %doublejump double_jump matches 1 as @a[nbt={OnGround:1b,Inventory:[{Slot:102b,tag:{doubleJump:1s}}]}] run function double-jump:scripts/take_elytra
execute if score %doublejump double_jump matches 1 as @a[nbt={OnGround:0b,Inventory:[{Slot:102b,tag:{doubleJump:1s}}]}] at @s if block ~ ~ ~ #climbable run function double-jump:scripts/take_elytra
execute if score %doublejump double_jump matches 1 as @a[nbt={OnGround:0b,Inventory:[{Slot:102b,tag:{doubleJump:1s}}]}] at @s if block ~ ~ ~ water run function double-jump:scripts/take_elytra
execute if score %doublejump double_jump matches 1 as @a[nbt={OnGround:0b,Inventory:[{Slot:102b,tag:{doubleJump:1s}}]}] at @s if block ~ ~ ~ lava run function double-jump:scripts/take_elytra
execute if score %doublejump double_jump matches 1 as @a[nbt={OnGround:0b,Inventory:[{Slot:102b,tag:{doubleJump:1s}}]}] at @s if block ~ ~ ~ #snow run function double-jump:scripts/take_elytra

#Sets dj_cd to 0 when player touches ground (Resets double jump cooldown)
execute as @a[scores={dj_cd=6..},nbt={OnGround:1b}] run scoreboard players set @s dj_cd 0

#Detects when player uses elytra and increases their score by 1, removes elytra, performs double jump. 
execute if score %doublejump double_jump matches 1 as @a[nbt={FallFlying:1b,Inventory:[{Slot:102b,tag:{doubleJump:1s}}]}] unless score @s dj_cd matches 1.. run scoreboard players set @s dj_cd 1
execute if score %doublejump double_jump matches 1 as @a[scores={dj_cd=1}] run function double-jump:scripts/take_elytra
execute if score %doublejump double_jump matches 1 as @a[scores={dj_cd=1}] at @s run function double-jump:scripts/vel_reset
execute if score %doublejump double_jump matches 1 as @a[scores={dj_cd=1}] at @s run function double-jump:scripts/circle
execute if score %doublejump double_jump matches 1 as @a[scores={dj_cd=1}] at @s run particle minecraft:cloud ~ ~ ~ 0.7 0 0.7 0.1 6 normal
execute if score %doublejump double_jump matches 1 as @a[scores={dj_cd=1}] at @s run playsound minecraft:entity.blaze.shoot player @a ~ ~ ~ 0.5 1.3
#execute unless score %lock double_jump matches 1 as @a[scores={dj_cd=1}] at @s run playsound minecraft:entity.ender_dragon.flap master @a
execute if score %doublejump double_jump matches 1 as @a[scores={dj_cd=1}] unless data entity @s ActiveEffects[{Id:28}] run effect give @s slow_falling 1 1 true
execute if score %doublejump double_jump matches 1 as @a[scores={dj_cd=1}] run effect give @s levitation 1 20 true
execute if score %doublejump double_jump matches 1 as @a[scores={dj_cd=5}] run effect clear @s levitation
execute if score %doublejump double_jump matches 1 as @a[scores={dj_cd=5}] if data entity @s ActiveEffects[{Id:28,Amplifier:1b}] run effect clear @s slow_falling

#Increases dj_cd score by 1 for all players who double jumped (to 6 max, signifying they are on cooldown)
execute as @a[scores={dj_cd=1..5}] run scoreboard players add @s dj_cd 1
