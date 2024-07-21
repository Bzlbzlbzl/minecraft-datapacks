# Turns thrown book and quill into claim book (run by the book)
scoreboard players set @s pres_drop 21
data modify entity @s Owner set from entity @s Thrower
data modify entity @s Glowing set value 1b
data modify entity @s Invulnerable set value 1b
data modify entity @s PickupDelay set value 32767s
data modify entity @s PortalCooldown set value 100000000
#Too lazy to do sign thing
#data modify entity @s CustomName set from entity @s Item.components."minecraft:written_book_content".title.raw
#execute if data entity @s CustomName run data modify entity @s CustomNameVisible set value 1b
execute at @s run playsound minecraft:ui.cartography_table.take_result master @a ~ ~ ~ 2 1
execute positioned ~ ~-1.65 ~ run scoreboard players operation @s powers_id = @a[team=president,scores={pres_drop=1..},tag=!claimed,limit=1,sort=nearest] powers_id
team join president