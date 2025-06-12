# Binds armor on target. Run by player hit, needs to revoke advancement for it to be re-useable
tag @s add crazyThis
# Modify cursed armor with curses and lore
execute on attacker if data entity @s {equipment:{head:{}}} run data merge entity @s {equipment:{head:{components:{"minecraft:enchantments":{"minecraft:binding_curse":1,"minecraft:vanishing_curse":1},"minecraft:lore":[{"color":"dark_gray","translate":"Armor that had once been discarded and abandoned."},{"color":"dark_gray","translate":"It's dejected spirit now hungers for purpose —"},{"color":"dark_gray","translate":"clinging to any who’ll help it feel useful again."}],"minecraft:custom_name":{"bold":false,"italic":false,"translate":"Cursed Armor"}}}}}
execute on attacker if data entity @s {equipment:{chest:{}}} run data merge entity @s {equipment:{chest:{components:{"minecraft:enchantments":{"minecraft:binding_curse":1,"minecraft:vanishing_curse":1},"minecraft:lore":[{"color":"dark_gray","translate":"Armor that had once been discarded and abandoned."},{"color":"dark_gray","translate":"It's dejected spirit now hungers for purpose —"},{"color":"dark_gray","translate":"clinging to any who’ll help it feel useful again."}],"minecraft:custom_name":{"bold":false,"italic":false,"translate":"Cursed Armor"}}}}}
execute on attacker if data entity @s {equipment:{legs:{}}} run data merge entity @s {equipment:{legs:{components:{"minecraft:enchantments":{"minecraft:binding_curse":1,"minecraft:vanishing_curse":1},"minecraft:lore":[{"color":"dark_gray","translate":"Armor that had once been discarded and abandoned."},{"color":"dark_gray","translate":"It's dejected spirit now hungers for purpose —"},{"color":"dark_gray","translate":"clinging to any who’ll help it feel useful again."}],"minecraft:custom_name":{"bold":false,"italic":false,"translate":"Cursed Armor"}}}}}
execute on attacker if data entity @s {equipment:{feet:{}}} run data merge entity @s {equipment:{feet:{components:{"minecraft:enchantments":{"minecraft:binding_curse":1,"minecraft:vanishing_curse":1},"minecraft:lore":[{"color":"dark_gray","translate":"Armor that had once been discarded and abandoned."},{"color":"dark_gray","translate":"It's dejected spirit now hungers for purpose —"},{"color":"dark_gray","translate":"clinging to any who’ll help it feel useful again."}],"minecraft:custom_name":{"bold":false,"italic":false,"translate":"Cursed Armor"}}}}}

# Summon player's item on the ground (before it gets replaced)
execute at @s if data entity @s {equipment:{head:{}}} run summon item ~ ~1 ~ {Tags:["crazyHelmet"],Item:{id:"minecraft:firework_star",count:1,components:{"minecraft:custom_name":"Armor Placeholder","minecraft:lore":["If you are holding this item, ","something is really wrong with my code..."]}}}
execute at @s if data entity @s {equipment:{chest:{}}} run summon item ~ ~1 ~ {Tags:["crazyChestplate"],Item:{id:"minecraft:firework_star",count:1,components:{"minecraft:custom_name":"Armor Placeholder","minecraft:lore":["If you are holding this item, ","something is really wrong with my code..."]}}}
execute at @s if data entity @s {equipment:{legs:{}}} run summon item ~ ~1 ~ {Tags:["crazyLeggings"],Item:{id:"minecraft:firework_star",count:1,components:{"minecraft:custom_name":"Armor Placeholder","minecraft:lore":["If you are holding this item, ","something is really wrong with my code..."]}}}
execute at @s if data entity @s {equipment:{feet:{}}} run summon item ~ ~1 ~ {Tags:["crazyBoots"],Item:{id:"minecraft:firework_star",count:1,components:{"minecraft:custom_name":"Armor Placeholder","minecraft:lore":["If you are holding this item, ","something is really wrong with my code..."]}}}

execute at @s on attacker if data entity @s {equipment:{head:{}}} run data modify entity @e[type=item,tag=crazyHelmet,limit=1,sort=nearest] Item set from entity @p[tag=crazyThis] equipment.head
execute at @s on attacker if data entity @s {equipment:{chest:{}}} run data modify entity @e[type=item,tag=crazyChestplate,limit=1,sort=nearest] Item set from entity @p[tag=crazyThis] equipment.chest
execute at @s on attacker if data entity @s {equipment:{legs:{}}} run data modify entity @e[type=item,tag=crazyLeggings,limit=1,sort=nearest] Item set from entity @p[tag=crazyThis] equipment.legs
execute at @s on attacker if data entity @s {equipment:{feet:{}}} run data modify entity @e[type=item,tag=crazyBoots,limit=1,sort=nearest] Item set from entity @p[tag=crazyThis] equipment.feet

# Bind armor to player
execute on attacker if data entity @s {equipment:{head:{}}} run item replace entity @p[tag=crazyThis] armor.head from entity @s armor.head
execute on attacker if data entity @s {equipment:{chest:{}}} run item replace entity @p[tag=crazyThis] armor.chest from entity @s armor.chest
execute on attacker if data entity @s {equipment:{legs:{}}} run item replace entity @p[tag=crazyThis] armor.legs from entity @s armor.legs
execute on attacker if data entity @s {equipment:{feet:{}}} run item replace entity @p[tag=crazyThis] armor.feet from entity @s armor.feet

# Sounds and particles
execute at @s run playsound minecraft:block.iron_door.open master @a ~ ~ ~ 2 0
execute at @s run playsound minecraft:entity.horse.armor master @a ~ ~ ~ 1 1
execute at @s run playsound minecraft:block.enchantment_table.use master @a ~ ~ ~ 0.6 0
execute at @s run particle minecraft:enchanted_hit ~ ~0.8 ~ 0.3 0.8 0.3 0.6 30
execute at @s run particle minecraft:enchant ~ ~0.8 ~ 0.3 0.8 0.3 1 80

# Kill the armor
execute on attacker at @s run particle minecraft:poof ~ ~1 ~ 0.3 0.8 0.3 0.1 4
execute on attacker run tp @s ~ -80 ~
execute on attacker run kill @s

advancement revoke @s only why:armor_hit
