#Returning the scythe and untagging noScythe; playsound and kills self
give @a[team=Reaper,tag=noScythe,limit=1,sort=nearest,scores={calculation=..19}] netherite_hoe{display:{Name:'{"text":"Soul Reaper","color":"black","italic":false}',Lore:['{"text":"This mysterious scythe has"}','{"text":"strange powers. Not even you"}','{"text":"have complete mastery of it. "}']},HideFlags:6,Unbreakable:1b,Enchantments:[{id:"minecraft:knockback",lvl:2s}],scythe:2b} 1
tag @a[team=Reaper,tag=noScythe,limit=1,sort=nearest,scores={calculation=..19}] remove noScythe
playsound minecraft:block.soul_sand.step master @a ~ ~ ~ 1 2 1
kill @s