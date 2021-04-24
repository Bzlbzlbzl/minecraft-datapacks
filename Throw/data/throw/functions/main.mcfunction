# # # Throw - Bzlbzlbzl # # #
# use </trigger throw> to toggle on and off. Using /trigger throw set 0 will disable you from toggling throw

#Changes %throw (to 1 or 0 depending on %throw currently) when a player triggers the throw scoreboard
execute as @a[scores={throw=1..},limit=1] if score %throw throw_main matches 0 run tellraw @a ["",{"selector":"@s","bold":true,"color":"green"},{"text":" enabled throwing!","bold":true,"color":"green"}]
execute as @a[scores={throw=1..},limit=1] if score %throw throw_main matches 1 run tellraw @a ["",{"selector":"@s","bold":true,"color":"red"},{"text":" disabled throwing!","bold":true,"color":"red"}]
execute as @a[scores={throw=1..},limit=1] run scoreboard players add %throw throw_main 1
execute as @a[scores={throw=1..},limit=1] if score %throw throw_main matches 2.. run scoreboard players set %throw throw_main 0

#Enables the throw trigger for anyone who just joined or set score to negative (DISABLED WHEN %lock is 1)
execute unless score %lock throw_main matches 1 as @a unless score @s throw matches 0 run scoreboard players enable @a throw
execute unless score %lock throw_main matches 1 as @a unless score @s throw matches 0 run scoreboard players set @a throw 0

#Assigns a new ID to all players without an ID in throw_main
execute as @a unless score @s throw_main matches 0.. run function throw:scripts/next_id

#Gives the throwing stick to all players who are sneaking, and clears it if they shouldn't have it, kills if dropped (when %throw is 1)
execute if score %throw throw_main matches 1 as @a[predicate=throw:sneaking] unless data entity @s SelectedItem run replaceitem entity @s weapon.mainhand carrot_on_a_stick{display:{Name:'{"translate":"Throwing Stick","color":"gold","italic":false}',Lore:['{"translate":"Grabs the targeted entity,","color":"dark_green"}','{"text":"then sends it flying.","color":"dark_green"}','{"translate":"[Hold right click to use]","color":"blue","italic":false}']},HideFlags:127,Unbreakable:1b,throw:1b} 1
execute as @a[predicate=!throw:sneaking,nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{throw:1b}}]}] run clear @s minecraft:carrot_on_a_stick{throw:1b}
kill @e[type=item,nbt={Item:{id:"minecraft:carrot_on_a_stick",tag:{throw:1b}}}]

#Clears player of pickUp tag if there isn't a mob that has the same score as self or stopped using pickup stick (doing the inverse because thats the only way I can think of to get it to work)
tag @a[tag=pickUp] remove pickUp
execute if score %throw throw_main matches 1 as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{throw:1b}}},scores={throw_use=1..}] at @e[scores={throw_main=0..},type=!minecraft:player] if score @e[limit=1,sort=nearest,scores={throw_main=0..},type=!minecraft:player] throw_main = @s throw_main run tag @s add pickUp

#Resets mob of throw_main score if there isn't a pickUp player that has the same score as self (doing the inverse; no further checks necessary as checked in previous lines)
tag @e[scores={throw_main=0..},type=!minecraft:player] add noPickUp
execute if score %throw throw_main matches 1 as @e[scores={throw_main=0..},type=!minecraft:player] at @a[tag=pickUp] if score @a[limit=1,sort=nearest,tag=pickUp] throw_main = @s throw_main run tag @s remove noPickUp
scoreboard players reset @e[tag=noPickUp] throw_main
execute as @e[tag=noPickUp] run data modify entity @s NoAI set value 0b
tag @e[tag=noPickUp] remove noPickUp

#Keeps the picked up mob above the correct pickUp player
execute if score %throw throw_main matches 1 as @a[tag=pickUp] at @e[type=!minecraft:player,scores={throw_main=0..}] if score @e[limit=1,sort=nearest,scores={throw_main=0..},type=!minecraft:player] throw_main = @s throw_main run tp @e[limit=1,sort=nearest,type=!minecraft:player,scores={throw_main=0..}] @s
execute if score %throw throw_main matches 1 as @a[tag=pickUp] at @s run tp @e[limit=1,sort=nearest,type=!minecraft:player,scores={throw_main=0..}] ~ ~2 ~

#All players using throwing rod who aren't currently pickUp runs function throw:scripts/pick_up (this function is the only way to receive pickUp)
execute if score %throw throw_main matches 1 as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{throw:1b}}},scores={throw_use=1..},tag=!pickUp] run say 2
execute if score %throw throw_main matches 1 as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{throw:1b}}},scores={throw_use=1..},tag=!pickUp] at @s run function throw:scripts/pick_up

#Increment timer by 1 and reset at 4; resets all throw_use scores (uses a 5 tick timer because a player doesn't use a carrot on a stick every tick); sets a limiter on max amount to catch spam clicks
scoreboard players add %timer throw_main 1
execute if score %timer throw_main matches 5 run scoreboard players set %timer throw_main 0
execute if score %timer throw_main matches 1 run scoreboard players remove @a[scores={throw_use=1..}] throw_use 1
scoreboard players set @a[scores={throw_use=6..}] throw_use 5

