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
execute at @s run stopsound @a[distance=..16] player minecraft:item.armor.equip_chain
execute at @s run stopsound @a[distance=..16] player minecraft:item.armor.equip_diamond
execute at @s run stopsound @a[distance=..16] player minecraft:item.armor.equip_gold
execute at @s run stopsound @a[distance=..16] player minecraft:item.armor.equip_iron
execute at @s run stopsound @a[distance=..16] player minecraft:item.armor.equip_leather
execute at @s run stopsound @a[distance=..16] player minecraft:item.armor.equip_netherite
