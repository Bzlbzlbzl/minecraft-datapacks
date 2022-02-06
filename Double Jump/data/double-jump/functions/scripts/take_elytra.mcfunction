#Sets item back to chest slot from storage. Note special case for when there's nothing

#Rotates to storage 0
execute unless score @s dj_id matches 0 run function double-jump:scripts/rotate

#Sets item from storage[0] back to chest using shulker box breaking method
forceload add 0 0 0 0
setblock 0 -64 0 minecraft:yellow_shulker_box
data modify block 0 -64 0 Items append from storage minecraft:double-jump ChestItem[0]
loot replace entity @s armor.chest 1 mine 0 -64 0 air{drop_contents:1b}
setblock 0 -64 0 bedrock
forceload remove 0 0 0 0

#Stops the annoying armor equip sounds
data modify storage minecraft:double-jump CurrentItem set from storage minecraft:double-jump ChestItem[0]
execute if data storage minecraft:double-jump CurrentItem{id:"minecraft:chainmail_chestplate"} at @s run stopsound @a[distance=..16] player minecraft:item.armor.equip_chain
execute if data storage minecraft:double-jump CurrentItem{id:"minecraft:diamond_chestplate"} at @s run stopsound @a[distance=..16] player minecraft:item.armor.equip_diamond
execute if data storage minecraft:double-jump CurrentItem{id:"minecraft:gold_chestplate"} at @s run stopsound @a[distance=..16] player minecraft:item.armor.equip_gold
execute if data storage minecraft:double-jump CurrentItem{id:"minecraft:iron_chestplate"} at @s run stopsound @a[distance=..16] player minecraft:item.armor.equip_iron
execute if data storage minecraft:double-jump CurrentItem{id:"minecraft:leather_chestplate"} at @s run stopsound @a[distance=..16] player minecraft:item.armor.equip_leather
execute if data storage minecraft:double-jump CurrentItem{id:"minecraft:netherite_chestplate"} at @s run stopsound @a[distance=..16] player minecraft:item.armor.equip_netherite
