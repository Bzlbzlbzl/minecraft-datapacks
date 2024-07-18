# Turns thrown book and quill into claim book (run by the book)
scoreboard players set @s pres_drop 21
data modify entity @s Owner set from entity @s Thrower
data modify entity @s Glowing set value 1b
data modify entity @s Invulnerable set value 1b
data modify entity @s PickupDelay set value 32767s
data modify entity @s CustomNameVisible set value 1b
data modify entity @s CustomName set from entity @s Item.components."minecraft:written_book_content".title.raw
