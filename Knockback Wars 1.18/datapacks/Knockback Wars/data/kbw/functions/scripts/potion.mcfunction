#Witch replenish potion
particle minecraft:witch ~ ~2 ~ 0.15 0.05 0.15 0 10
playsound minecraft:entity.witch.drink master @a ~ ~ ~ 1 1
item replace entity @s weapon.offhand with splash_potion{display:{Name:'{"text":"Simple Harming Potion","color":"dark_purple","italic":false}',Lore:['{"text":"You\'re not running out"}','{"text":"of these any time soon."}','{"text":"Spammable","color":"blue","italic":false}']},Potion:"minecraft:strong_harming"} 1
scoreboard players set @s calculation 21