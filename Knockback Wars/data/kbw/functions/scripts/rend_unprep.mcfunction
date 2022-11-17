#Grim Reaper unprepares for rend
clear @s minecraft:diamond_hoe{scythe:3b}
execute if data entity @s SelectedItem run give @s netherite_hoe{display:{Name:'{"text":"Soul Reaper","color":"black","italic":false}',Lore:['{"text":"This mysterious scythe has"}','{"text":"strange powers. Not even you"}','{"text":"have complete mastery of it. "}']},HideFlags:6,Unbreakable:1b,Enchantments:[{id:"minecraft:knockback",lvl:2s}],scythe:2b} 1
execute unless data entity @s SelectedItem run clear @s minecraft:netherite_hoe{scythe:2b}
execute unless data entity @s SelectedItem run item replace entity @s weapon.mainhand with netherite_hoe{display:{Name:'{"text":"Soul Reaper","color":"black","italic":false}',Lore:['{"text":"This mysterious scythe has"}','{"text":"strange powers. Not even you"}','{"text":"have complete mastery of it. "}']},HideFlags:6,Unbreakable:1b,Enchantments:[{id:"minecraft:knockback",lvl:2s}],scythe:2b} 1
