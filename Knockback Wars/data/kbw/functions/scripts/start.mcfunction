# Starts the game (this should only be called from main function)

#Clears inventory, effects, traps, and fireballs, scythes
clear @a[scores={queue=1}]
effect clear @a[scores={queue=1}]
kill @e[tag=archerTrap]
kill @e[tag=pyroFireball]
kill @e[tag=reapScythe]

# Kit Items
#Default
give @a[team=,scores={queue=1}] stick{display:{Name:'{"text":"Knockback Stick","color":"white","italic":false}',Lore:['{"text":"The original."}']},Enchantments:[{id:"minecraft:knockback",lvl:4s}]} 1
give @a[team=,scores={queue=1}] bow{display:{Name:'{"text":"Annoying Bow","color":"white","italic":false}',Lore:['{"text":"A rather simple bow."}']},HideFlags:4,Unbreakable:1b,Enchantments:[{id:"minecraft:punch",lvl:1s},{id:"minecraft:infinity",lvl:1s}]} 1
give @a[team=,scores={queue=1}] arrow 1

#Archer
give @a[team=Archer,scores={queue=1}] bow{display:{Name:'{"text":"Heavy Bow","color":"aqua","italic":false}',Lore:['{"text":"A bow that shoots"}','{"text":"with unparalleled strength."}']},HideFlags:4,Unbreakable:1b,Enchantments:[{id:"minecraft:punch",lvl:3s},{id:"minecraft:infinity",lvl:1s},{id:"minecraft:knockback",lvl:1s}]} 1
give @a[team=Archer,scores={queue=1}] turtle_spawn_egg{HideFlags:16,CanPlaceOn:["minecraft:glowstone","minecraft:white_wool","minecraft:lime_wool","minecraft:sand","minecraft:red_terracotta"],display:{Name:'{"text":"Hunting Trap","color":"aqua","italic":false}',Lore:['{"text":"Roots your opponents"}','{"text":"for a short time."}']},EntityTag:{Invulnerable:1b,CustomNameVisible:0b,Age:-2147483647,Tags:["archerTrap"]}} 4
give @a[team=Archer,scores={queue=1}] splash_potion{display:{Name:'{"text":"Wind\'s Blessing","color":"aqua","italic":false}',Lore:['{"text":"A magical essence that"}','{"text":"allows you to nimbly"}','{"text":"outmaneuver your opponents."}']},HideFlags:0,CustomPotionEffects:[{Id:1b,Amplifier:2b,Duration:180}],CustomPotionColor:2293580} 3
give @a[team=Archer,scores={queue=1}] arrow{display:{Name:'{"text":"Arrow","color":"aqua","italic":false}'}} 1

#Knight
give @a[team=Knight,scores={queue=1}] wooden_sword{display:{Name:'{"text":"The Stik","color":"dark_red","italic":false}',Lore:['{"text":"A legendary rod which"}','{"text":"hits with great force."}']},HideFlags:4,Unbreakable:1b,Enchantments:[{id:"minecraft:knockback",lvl:10s}],AttributeModifiers:[{AttributeName:"generic.movement_speed",Name:"generic.movement_speed",Amount:-0.15,Operation:1,UUID:[I;575302506,1974028878,-1096895868,321966357],Slot:"mainhand"}]} 1

#Assassin
give @a[scores={queue=1},team=Assassin] stick{display:{Name:'{"text":"Dagger","color":"yellow","italic":false}',Lore:['{"text":"It seems pretty good"}','{"text":"for stabbing people."}']},HideFlags:60,Enchantments:[{id:"minecraft:knockback",lvl:2s}]} 1
give @a[scores={queue=1},team=Assassin] splash_potion{display:{Name:'{"text":"Smoke Bomb","color":"yellow","italic":false}',Lore:['{"text":"Leaves your opponents in"}','{"text":"a murky cloud of smoke."}']},HideFlags:63,CustomPotionEffects:[{Id:9b,Amplifier:2b,Duration:180},{Id:15b,Amplifier:2b,Duration:120,ShowParticles:1b}],CustomPotionColor:0} 2
give @a[scores={queue=1},team=Assassin] ender_pearl{display:{Name:'{"text":"Ender Pearl","color":"yellow","italic":false}'},HideFlags:63} 6
give @a[scores={queue=1},team=Assassin] splash_potion{display:{Name:'{"text":"Cloak of Shadows","color":"yellow","italic":false}',Lore:['{"text":"A brew that helps you"}','{"text":"evade attacks unnoticed."}']},HideFlags:63,CustomPotionEffects:[{Id:8b,Amplifier:9b,Duration:200,ShowParticles:0b},{Id:14b,Amplifier:0b,Duration:200,ShowParticles:0b}],CustomPotionColor:2293580} 2

#Witch
give @a[scores={queue=1},team=Witch] stick{display:{Name:'{"text":"Magic Wand","color":"dark_purple","italic":false}',Lore:['{"text":"It leaves behind"}','{"text":"a sparkly trail."}']},HideFlags:60,Enchantments:[{id:"minecraft:knockback",lvl:2s}],wand:1b} 1
give @a[scores={queue=1},team=Witch] splash_potion{display:{Name:'{"text":"Potion of Nausea","color":"dark_purple","italic":false}',Lore:['{"text":"What is this disgusting"}','{"text":"liquid? It can\'t be healthy."}']},HideFlags:28,CustomPotionEffects:[{Id:9b,Amplifier:0b,Duration:400}],CustomPotionColor:5578058} 2
give @a[scores={queue=1},team=Witch] splash_potion{display:{Name:'{"text":"Potion of Slowness","color":"dark_purple","italic":false}',Lore:['{"text":"Drains your limbs"}','{"text":"of all vigor."}']},HideFlags:28,CustomPotionEffects:[{Id:2b,Amplifier:1b,Duration:600}],CustomPotionColor:5926017} 2
give @a[scores={queue=1},team=Witch] minecraft:splash_potion{display:{Name:'{"text":"Potion of Speed","color":"dark_purple","italic":false}',Lore:['{"text":"Charges your legs with"}','{"text":"a magical energy."}']},HideFlags:28,CustomPotionEffects:[{Id:1b,Amplifier:2b,Duration:300}],CustomPotionColor:8171462} 1
give @a[scores={queue=1},team=Witch] splash_potion{display:{Name:'{"text":"Potion of Fear","color":"dark_purple","italic":false}',Lore:['{"text":"A strange potion that"}','{"text":"forces you to shake with"}','{"text":"a phantom dread."}']},HideFlags:28,CustomPotionEffects:[{Id:19b,Amplifier:0b,Duration:2000}],CustomPotionColor:5797459} 1
give @a[scores={queue=1},team=Witch] milk_bucket{display:{Name:'{"text":"Magic Milk","color":"dark_purple","italic":false}',Lore:['{"text":"Milk milked from a magic"}','{"text":"cow. This strange liquid"}','{"text":"flows endlessly."}']},HideFlags:63} 1

#Pyromaniac
give @a[team=Pyromaniac,scores={queue=1}] golden_sword{display:{Name:'{"text":"Molten Blade","color":"gold","italic":false}',Lore:['{"text":"A glowing blade"}','{"text":"hot to the touch"}']},HideFlags:6,Unbreakable:1b,Enchantments:[{id:"minecraft:knockback",lvl:3s},{id:"minecraft:fire_aspect",lvl:2s}]} 1
give @a[team=Pyromaniac,scores={queue=1}] carrot_on_a_stick{CanPlaceOn:["minecraft:glowstone","minecraft:white_wool","minecraft:lime_wool","minecraft:sand","minecraft:red_terracotta"],display:{Name:'{"text":"Fiery Flail","color":"gold","italic":false}',Lore:['{"text":"It\'s like a bow..."}','{"text":"but more explosive."}']},HideFlags:60,Unbreakable:1b,Enchantments:[{id:"minecraft:fire_aspect",lvl:3s}]} 1

#Ghost
give @a[scores={queue=1},team=Ghost] ender_eye{display:{Name:'{"text":"Ghostly Presence","color":"gray","italic":false}',Lore:['{"text":"Enter the realm of spirits"}','{"text":"and drift around freely."}']},HideFlags:61,Enchantments:[{id:"minecraft:protection",lvl:0s}],AttributeModifiers:[{AttributeName:"generic.movement_speed",Name:"generic.movement_speed",Amount:1,Operation:2,UUID:[I;179462367,-963490680,-1762281322,-1956631532],Slot:"mainhand"},{AttributeName:"generic.knockback_resistance",Name:"generic.knockback_resistance",Amount:-1,Operation:0,UUID:[I;-2002646642,-240104341,-1171626862,1167655472],Slot:"mainhand"},{AttributeName:"generic.attack_damage",Name:"generic.attack_damage",Amount:-1,Operation:0,UUID:[I;-765710489,881607713,-1975002354,1893954731],Slot:"mainhand"}]} 1
give @a[scores={queue=1},team=Ghost] minecraft:carved_pumpkin{display:{Name:'{"text":"Scary Face","color":"gray","italic":false}',Lore:['{"text":"Hold your ground and"}','{"text":"make your opponents"}','{"text":"jump with fright!"}']},HideFlags:60,Enchantments:[{id:"minecraft:knockback",lvl:4s}],AttributeModifiers:[{AttributeName:"generic.movement_speed",Name:"generic.movement_speed",Amount:-1,Operation:2,UUID:[I;-912982774,1689929578,-1494637146,1327020688],Slot:"mainhand"}]} 1
give @a[scores={queue=1},team=Ghost] blaze_powder{display:{Name:'{"text":"Cursed Flames","color":"gray","italic":false}',Lore:['{"text":"Spirit fire seems to"}','{"text":"burn the living, too."}']},HideFlags:60,Enchantments:[{id:"minecraft:knockback",lvl:1s},{id:"minecraft:fire_aspect",lvl:1s}],AttributeModifiers:[{AttributeName:"generic.movement_speed",Name:"generic.movement_speed",Amount:0.3,Operation:2,UUID:[I;-2035470949,83774175,-1644332883,1052361980],Slot:"mainhand"}]} 1
#item replace entity @a[scores={queue=1},team=Ghost] hotbar.7 with nether_star{display:{Name:'{"text":"Warp Star","color":"gray","italic":false}',Lore:['{"text":"Who says a ghost can only "}','{"text":"be in one place at a time?"}']},HideFlags:60,AttributeModifiers:[{AttributeName:"generic.movement_speed",Name:"generic.movement_speed",Amount:5,Operation:0,UUID:[I;-1652766893,-1774239305,-1409458173,1357684309],Slot:"mainhand"}]} 1

#Reaper
give @a[scores={queue=1},team=Reaper] netherite_hoe{display:{Name:'{"text":"Soul Reaper","color":"black","italic":false}',Lore:['{"text":"This mysterious scythe has"}','{"text":"strange powers. Not even you"}','{"text":"have complete mastery of it. "}']},HideFlags:6,Unbreakable:1b,Enchantments:[{id:"minecraft:sharpness",lvl:10s},{id:"minecraft:knockback",lvl:2s}],scythe:2b} 1
give @a[scores={queue=1},team=Reaper] wooden_hoe{display:{Name:'{"text":"Farmer\'s Scythe","color":"black","italic":false}',Lore:['{"text":"This stick isn\'t very good"}','{"text":"at stealing souls. You should"}','{"text":"probably get your weapon back."}']},HideFlags:6,Unbreakable:1b,Enchantments:[{id:"minecraft:knockback",lvl:1s}],scythe:1b} 1

#Duelist
give @a[scores={queue=1},team=Duelist] iron_axe{display:{Name:'{"text":"Iron Axe","color":"red","italic":false}',Lore:['{"text":"All you need to survive"}','{"text":"is your trusty iron axe"}']},HideFlags:6,Unbreakable:1b,Damage:0,Enchantments:[{id:"minecraft:knockback",lvl:3s}],duelist:1b} 1
item replace entity @a[scores={queue=1},team=Duelist] armor.head with iron_helmet{display:{Name:'{"text":"Iron Helmet","color":"red","italic":false}',Lore:['{"text":"Although this armor doesn\'t"}','{"text":"protect you from knockback,"}','{"text":"at least it\'s pretty shiny"}']},HideFlags:4,Unbreakable:1b} 1
item replace entity @a[scores={queue=1},team=Duelist] armor.chest with iron_chestplate{display:{Name:'{"text":"Iron Chestplate","color":"red","italic":false}',Lore:['{"text":"Although this armor doesn\'t"}','{"text":"protect you from knockback,"}','{"text":"at least it\'s pretty shiny"}']},HideFlags:4,Unbreakable:1b} 1
item replace entity @a[scores={queue=1},team=Duelist] armor.legs with iron_leggings{display:{Name:'{"text":"Iron Leggings","color":"red","italic":false}',Lore:['{"text":"Although this armor doesn\'t"}','{"text":"protect you from knockback,"}','{"text":"at least it\'s pretty shiny"}']},HideFlags:4,Unbreakable:1b} 1
item replace entity @a[scores={queue=1},team=Duelist] armor.feet with iron_boots{display:{Name:'{"text":"Iron Boots","color":"red","italic":false}',Lore:['{"text":"Although this armor doesn\'t"}','{"text":"protect you from knockback,"}','{"text":"at least it\'s pretty shiny"}']},HideFlags:4,Unbreakable:1b} 1

#Builder
give @a[scores={queue=1},team=Builder] tube_coral_block{CanPlaceOn:["minecraft:red_terracotta","minecraft:glowstone","minecraft:white_wool","minecraft:lime_wool","minecraft:sand","minecraft:tube_coral_block"],display:{Name:'{"translate":"Building Block","color":"blue","italic":false}',Lore:['{"translate":"These blocks don\'t last forever..."}','{"translate":"Luckily you\'ve got tons more"}']},builder:1b,Enchantments:[{id:"minecraft:knockback",lvl:2s}],HideFlags:16} 8
give @a[scores={queue=1},team=Builder] diamond_pickaxe{CanDestroy:["minecraft:tube_coral_block"],display:{Name:'{"translate":"Diamond Pickaxe","color":"blue","italic":false}'},HideFlags:14,Unbreakable:1b} 1

#All players given The Stik except Knight
item replace entity @a[scores={queue=1},team=!Knight] hotbar.8 with wooden_sword{display:{Name:'{"text":"The Stik","color":"red","italic":false}',Lore:['{"text":"This hefty rod is"}','{"text":"really hard to wield."}']},HideFlags:60,Damage:59,Enchantments:[{id:"minecraft:knockback",lvl:10s}],AttributeModifiers:[{AttributeName:"generic.movement_speed",Name:"generic.movement_speed",Amount:-1,Operation:1,UUID:[I;565302506,1974028878,-1096895868,321966357],Slot:"mainhand"}]} 1

#Tagging inGame; untagging noScythe; reset all players score and queue; set @a calculation 0
tag @a[scores={queue=1}] add inGame
tag @a[tag=noScythe] remove noScythe
scoreboard players reset * score
scoreboard players reset * queue
scoreboard players set @a calculation 0

#Attribute Modifiers
execute as @a run attribute @s minecraft:generic.attack_speed base set 80
execute as @a run attribute @s minecraft:generic.attack_knockback base set 0

#Teleportating all inGame players into arena
spreadplayers 0 0 3 11 false @a[tag=inGame]

# %game set to true
scoreboard players set %game wins 1