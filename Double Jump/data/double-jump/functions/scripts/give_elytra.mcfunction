#Stores chest data in respective storage, then gives an elytra. Note special case for when there's nothing

#Rotates to storage 0
execute unless score @s dj_id matches 0 run function double-jump:scripts/rotate

#Changes storage[0] to match chest item. Slot is removed cuz is too large (102) else it cant fill shulker box
execute if data entity @s Inventory[{Slot:102b}] run data modify storage minecraft:double-jump ChestItem[0] set from entity @s Inventory[{Slot:102b}]
execute if data entity @s Inventory[{Slot:102b}] run data remove storage minecraft:double-jump ChestItem[0].Slot
execute unless data entity @s Inventory[{Slot:102b}] run data modify storage minecraft:double-jump ChestItem[0] set value {id:"minecraft:air",Count:1b}

#Finally, replaces the item on the chest with the double jump elytra
item replace entity @s armor.chest with elytra{display:{Name:'{"translate":"Double Jump Ready!","color":"aqua","bold":true,"italic":false}'},HideFlags:127,Unbreakable:1b,doubleJump:1s,Enchantments:[{id:"minecraft:binding_curse",lvl:1s},{id:"minecraft:vanishing_curse",lvl:1s}]}

#Stops annoying elytra equip sound
execute at @s run stopsound @a[distance=..16] player minecraft:item.armor.equip_elytra
