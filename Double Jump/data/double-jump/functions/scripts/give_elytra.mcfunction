#Stores chest data in respective storage, then gives an elytra. Note special case for when there's nothing

#Rotates to storage 0
execute unless score @s dj_id matches 0 run function double-jump:scripts/rotate

#Changes storage[0] to match chest item. Slot is removed cuz is too large (102) else it cant fill shulker box
execute if data entity @s Inventory[{Slot:102b}] run data modify storage minecraft:double-jump ChestItem[0] set from entity @s Inventory[{Slot:102b}]
execute if data entity @s Inventory[{Slot:102b}] run data remove storage minecraft:double-jump ChestItem[0].Slot
execute unless data entity @s Inventory[{Slot:102b}] run data modify storage minecraft:double-jump ChestItem[0] set value {id:"minecraft:air",Count:1b}

#Finally, replaces the item on the chest with the double jump elytra, based on armor
item replace entity @s armor.chest with elytra{display:{Name:'{"translate":"Double Jump Ready!","color":"aqua","bold":true,"italic":false}'},HideFlags:127,Unbreakable:1b,doubleJump:1s,Enchantments:[{id:"minecraft:binding_curse",lvl:1s},{id:"minecraft:vanishing_curse",lvl:1s}]}

forceload add 0 0 0 0
setblock 0 -64 0 minecraft:yellow_shulker_box
data modify block 0 -64 0 Items[] set value {id:"minecraft:elytra",Count:1b,tag:{display:{Name:'{"translate":"Double Jump Ready!","color":"aqua","bold":true,"italic":false}'},HideFlags:127,Unbreakable:1b,doubleJump:1s,Enchantments:[{id:"minecraft:binding_curse",lvl:1s},{id:"minecraft:vanishing_curse",lvl:1s}]}}
data modify block 0 -64 0 Items[0].tag.Enchantments append from storage minecraft:double-jump ChestItem[0].tag.Enchantments[]

data modify storage minecraft:double-jump CurrentItem set from storage minecraft:double-jump ChestItem[0]
execute if data storage minecraft:double-jump CurrentItem{id:"minecraft:netherite_chestplate"} run data modify block 0 -64 0 Items[0].tag.AttributeModifiers append value {AttributeName:"generic.armor",Name:"generic.armor",Amount:8,Operation:0,UUID:[I;1777304665,-209695076,-1222661193,1329069735],Slot:"chest"}
execute if data storage minecraft:double-jump CurrentItem{id:"minecraft:netherite_chestplate"} run data modify block 0 -64 0 Items[0].tag.AttributeModifiers append value {AttributeName:"generic.armor_toughness",Name:"generic.armor_toughness",Amount:3,Operation:0,UUID:[I;-604510426,1399736894,-1662137472,460937015],Slot:"chest"}
execute if data storage minecraft:double-jump CurrentItem{id:"minecraft:netherite_chestplate"} run data modify block 0 -64 0 Items[0].tag.AttributeModifiers append value {AttributeName:"generic.knockback_resistance",Name:"generic.knockback_resistance",Amount:0.1,Operation:0,UUID:[I;2022892432,-1802223190,-1217420965,665190784],Slot:"chest"}
execute if data storage minecraft:double-jump CurrentItem{id:"minecraft:diamond_chestplate"} run data modify block 0 -64 0 Items[0].tag.AttributeModifiers append value {AttributeName:"generic.armor",Name:"generic.armor",Amount:8,Operation:0,UUID:[I;1777304665,-209695076,-1222661193,1329069735],Slot:"chest"}
execute if data storage minecraft:double-jump CurrentItem{id:"minecraft:diamond_chestplate"} run data modify block 0 -64 0 Items[0].tag.AttributeModifiers append value {AttributeName:"generic.armor_toughness",Name:"generic.armor_toughness",Amount:2,Operation:0,UUID:[I;-604510426,1399736894,-1662137472,460937015],Slot:"chest"}
execute if data storage minecraft:double-jump CurrentItem{id:"minecraft:iron_chestplate"} run data modify block 0 -64 0 Items[0].tag.AttributeModifiers append value {AttributeName:"generic.armor",Name:"generic.armor",Amount:6,Operation:0,UUID:[I;1777304665,-209695076,-1222661193,1329069735],Slot:"chest"}
execute if data storage minecraft:double-jump CurrentItem{id:"minecraft:chainmail_chestplate"} run data modify block 0 -64 0 Items[0].tag.AttributeModifiers append value {AttributeName:"generic.armor",Name:"generic.armor",Amount:5,Operation:0,UUID:[I;1777304665,-209695076,-1222661193,1329069735],Slot:"chest"}
execute if data storage minecraft:double-jump CurrentItem{id:"minecraft:gold_chestplate"} run data modify block 0 -64 0 Items[0].tag.AttributeModifiers append value {AttributeName:"generic.armor",Name:"generic.armor",Amount:5,Operation:0,UUID:[I;1777304665,-209695076,-1222661193,1329069735],Slot:"chest"}
execute if data storage minecraft:double-jump CurrentItem{id:"minecraft:leather_chestplate"} run data modify block 0 -64 0 Items[0].tag.AttributeModifiers append value {AttributeName:"generic.armor",Name:"generic.armor",Amount:3,Operation:0,UUID:[I;1777304665,-209695076,-1222661193,1329069735],Slot:"chest"}

loot replace entity @s armor.chest 1 mine 0 -64 0 air{drop_contents:1b}
setblock 0 -64 0 bedrock
forceload remove 0 0 0 0

#Stops annoying elytra equip sound
execute at @s run stopsound @a[distance=..16] player minecraft:item.armor.equip_elytra
