#Grim Reaper prepares for rend
clear @s minecraft:netherite_hoe{scythe:2b}
execute if data entity @s SelectedItem run give @s diamond_hoe{display:{Name:'{"text":"Soul Rend","color":"aqua","italic":true}',Lore:['{"text":"Attack someone to rend"}','{"text":"their soul away temporarily."}']},HideFlags:6,Damage:1561,Enchantments:[{id:"minecraft:sharpness",lvl:10s},{id:"minecraft:knockback",lvl:5s}],scythe:3b} 1
execute unless data entity @s SelectedItem run clear @s minecraft:diamond_hoe{scythe:3b}
execute unless data entity @s SelectedItem run item replace entity @s weapon.mainhand with diamond_hoe{display:{Name:'{"text":"Soul Rend","color":"aqua","italic":true}',Lore:['{"text":"Attack someone to rend"}','{"text":"their soul away temporarily."}']},HideFlags:6,Damage:1561,Enchantments:[{id:"minecraft:sharpness",lvl:10s},{id:"minecraft:knockback",lvl:5s}],scythe:3b} 1
