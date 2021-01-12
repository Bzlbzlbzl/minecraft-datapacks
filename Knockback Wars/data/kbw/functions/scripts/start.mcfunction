# Starts the game (this should only be called from main function)

#Clears inventory, traps, and fireballs
clear @a[scores={queue=1}]
kill @e[tag=archerTrap]
kill @e[tag=pyroFireball]

# Kit Items
#Default
give @a[team=,scores={queue=1}] stick{display:{Name:'{"text":"Knockback Stick","color":"white","italic":false}',Lore:['{"text":"The original."}']},Enchantments:[{id:"minecraft:knockback",lvl:4s}]} 1
give @a[team=,scores={queue=1}] bow{display:{Name:'{"text":"Annoying Bow","color":"white","italic":false}',Lore:['{"text":"A rather simple bow."}']},HideFlags:4,Unbreakable:1b,Enchantments:[{id:"minecraft:punch",lvl:1s},{id:"minecraft:infinity",lvl:1s}]} 1
give @a[team=,scores={queue=1}] arrow 1

#Archer
give @a[team=Archer,scores={queue=1}] bow{display:{Name:'{"text":"Heavy Bow","color":"aqua","italic":false}',Lore:['{"text":"A bow that shoots"}','{"text":"with unparalleled strength."}']},HideFlags:4,Unbreakable:1b,Enchantments:[{id:"minecraft:punch",lvl:3s},{id:"minecraft:infinity",lvl:1s}]} 1
give @a[team=Archer,scores={queue=1}] turtle_spawn_egg{HideFlags:16,CanPlaceOn:["minecraft:glowstone","minecraft:white_wool","minecraft:lime_wool","minecraft:sand","minecraft:red_terracotta"],display:{Name:'{"text":"Hunting Trap","color":"aqua","italic":false}',Lore:['{"text":"Roots your opponents"}','{"text":"for a short time."}']},EntityTag:{Invulnerable:1b,CustomNameVisible:0b,Age:-2147483647,Tags:["archerTrap"]}} 3
give @a[team=Archer,scores={queue=1}] splash_potion{display:{Name:'{"text":"Wind\'s Blessing","color":"aqua","italic":false}',Lore:['{"text":"A magical essence that"}','{"text":"allows you to nimbly"}','{"text":"outmaneuver your opponents."}']},HideFlags:0,CustomPotionEffects:[{Id:1b,Amplifier:2b,Duration:180}],CustomPotionColor:2293580} 3
give @a[team=Archer,scores={queue=1}] arrow{display:{Name:'{"text":"Arrow","color":"aqua","italic":false}'}} 1

#Knight
give @a[team=Knight,scores={queue=1}] wooden_sword{display:{Name:'{"text":"The Stik","color":"dark_red","italic":false}',Lore:['{"text":"A legendary rod which"}','{"text":"hits with great force."}']},HideFlags:6,Unbreakable:1b,Enchantments:[{id:"minecraft:knockback",lvl:10s}],AttributeModifiers:[{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:20,Operation:0,UUID:[I;698039306,41304990,-1928363259,-1658436984],Slot:"mainhand"}]} 1

#Assassin
give @a[scores={queue=1},team=Assassin] stick{display:{Name:'{"text":"Dagger","color":"yellow","italic":false}',Lore:['{"text":"It seems pretty good"}','{"text":"for stabbing people."}']},HideFlags:60,Enchantments:[{id:"minecraft:knockback",lvl:2s}]} 1
give @a[scores={queue=1},team=Assassin] splash_potion{display:{Name:'{"text":"Smoke Bomb","color":"yellow","italic":false}',Lore:['{"text":"Leaves your opponents in"}','{"text":"a murky cloud of smoke."}']},HideFlags:63,CustomPotionEffects:[{Id:9b,Amplifier:2b,Duration:160},{Id:15b,Amplifier:2b,Duration:100,ShowParticles:1b}],CustomPotionColor:0} 2
give @a[scores={queue=1},team=Assassin] ender_pearl{display:{Name:'{"text":"Ender Pearl","color":"yellow","italic":false}'},HideFlags:63} 6
give @a[scores={queue=1},team=Assassin] splash_potion{display:{Name:'{"text":"Cloak of Shadows","color":"yellow","italic":false}',Lore:['{"text":"A brew that helps you"}','{"text":"evade attacks unnoticed."}']},HideFlags:63,CustomPotionEffects:[{Id:8b,Amplifier:9b,Duration:200,ShowParticles:0b},{Id:14b,Amplifier:0b,Duration:200,ShowParticles:0b}],CustomPotionColor:2293580} 2

#Witch
give @a[scores={queue=1},team=Witch] stick{display:{Name:'{"text":"Magic Wand","color":"dark_purple","italic":false}',Lore:['{"text":"It leaves behind"}','{"text":"a sparkly trail."}']},HideFlags:60,Enchantments:[{id:"minecraft:knockback",lvl:3s}]} 1
give @a[scores={queue=1},team=Witch] splash_potion{display:{Name:'{"text":"Potion of Nausea","color":"dark_purple","italic":false}',Lore:['{"text":"What is this disgusting"}','{"text":"liquid? It can\'t be healthy."}']},HideFlags:28,CustomPotionEffects:[{Id:9b,Amplifier:0b,Duration:400}],CustomPotionColor:5578058} 2
give @a[scores={queue=1},team=Witch] minecraft:splash_potion{display:{Name:'{"text":"Potion of Speed","color":"dark_purple","italic":false}',Lore:['{"text":"Charges your legs with"}','{"text":"a magical energy."}']},HideFlags:28,CustomPotionEffects:[{Id:1b,Amplifier:2b,Duration:300}],CustomPotionColor:8171462} 1
give @a[scores={queue=1},team=Witch] splash_potion{display:{Name:'{"text":"Potion of Fear","color":"dark_purple","italic":false}',Lore:['{"text":"A strange potion that"}','{"text":"forces you to shake with"}','{"text":"a phantom dread."}']},HideFlags:28,CustomPotionEffects:[{Id:19b,Amplifier:0b,Duration:2000}],CustomPotionColor:5797459} 1
give @a[scores={queue=1},team=Witch] milk_bucket{display:{Name:'{"text":"Magic Milk","color":"dark_purple","italic":false}',Lore:['{"text":"Milk milked from a magic"}','{"text":"cow. This strange liquid"}','{"text":"flows endlessly."}']},HideFlags:63} 1

#Pyromaniac
give @a[team=Pyromaniac,scores={queue=1}] golden_sword{display:{Name:'{"text":"Blasting Blade","color":"gold","italic":false}',Lore:['{"text":"Each hit is followed"}','{"text":"by a powerful fireball."}']},HideFlags:6,Unbreakable:1b,Enchantments:[{id:"minecraft:knockback",lvl:3s}]} 1
give @a[scores={queue=1},team=Pyromaniac] carrot_on_a_stick{CanPlaceOn:["minecraft:glowstone","minecraft:white_wool","minecraft:lime_wool","minecraft:sand","minecraft:red_terracotta"],display:{Name:'{"text":"Fiery Flail","color":"gold","italic":false}',Lore:['{"text":"It\'s like a bow..."}','{"text":"but more explosive."}']},HideFlags:60,Unbreakable:1b,Enchantments:[{id:"minecraft:fire_aspect",lvl:3s}]} 1

#Ghost
give @a[scores={queue=1},team=Ghost] ender_eye{display:{Name:'{"text":"Ghostly Presence","color":"gray","italic":false}',Lore:['{"text":"Enter the realm of spirits"}','{"text":"and drift around freely."}']},HideFlags:61,Enchantments:[{id:"minecraft:protection",lvl:0s}],AttributeModifiers:[{AttributeName:"generic.movement_speed",Name:"generic.movement_speed",Amount:1,Operation:2,UUID:[I;179462367,-963490680,-1762281322,-1956631532],Slot:"mainhand"},{AttributeName:"generic.knockback_resistance",Name:"generic.knockback_resistance",Amount:-1,Operation:0,UUID:[I;-2002646642,-240104341,-1171626862,1167655472],Slot:"mainhand"},{AttributeName:"generic.attack_damage",Name:"generic.attack_damage",Amount:-1,Operation:0,UUID:[I;-765710489,881607713,-1975002354,1893954731],Slot:"mainhand"}]} 1
give @a[scores={queue=1},team=Ghost] minecraft:carved_pumpkin{display:{Name:'{"text":"Scary Face","color":"gray","italic":false}',Lore:['{"text":"Hold your ground and"}','{"text":"make your opponents"}','{"text":"jump with fright!"}']},HideFlags:60,Enchantments:[{id:"minecraft:knockback",lvl:4s}],AttributeModifiers:[{AttributeName:"generic.movement_speed",Name:"generic.movement_speed",Amount:-1,Operation:2,UUID:[I;-912982774,1689929578,-1494637146,1327020688],Slot:"mainhand"},{AttributeName:"generic.knockback_resistance",Name:"generic.knockback_resistance",Amount:0.1,Operation:0,UUID:[I;1758795995,1078218631,-1923599396,-1142005909],Slot:"mainhand"}]} 1
give @a[scores={queue=1},team=Ghost] blaze_powder{display:{Name:'{"text":"Cursed Flames","color":"gray","italic":false}',Lore:['{"text":"Spirit fire seems to"}','{"text":"burn the living, too."}']},HideFlags:60,Enchantments:[{id:"minecraft:knockback",lvl:1s},{id:"minecraft:fire_aspect",lvl:1s}],AttributeModifiers:[{AttributeName:"generic.movement_speed",Name:"generic.movement_speed",Amount:0.3,Operation:2,UUID:[I;-2035470949,83774175,-1644332883,1052361980],Slot:"mainhand"}]} 1
replaceitem entity @a[scores={queue=1},team=Ghost] hotbar.7 nether_star{display:{Name:'{"text":"Warp Star","color":"gray","italic":false}',Lore:['{"text":"Who says a ghost can only "}','{"text":"be in one place at a time?"}']},HideFlags:60,AttributeModifiers:[{AttributeName:"generic.movement_speed",Name:"generic.movement_speed",Amount:5,Operation:0,UUID:[I;-1652766893,-1774239305,-1409458173,1357684309],Slot:"mainhand"}]} 1

#All players given The Stik except Knight
replaceitem entity @a[scores={queue=1},team=!Knight] hotbar.8 wooden_sword{display:{Name:'{"text":"The Stik","color":"red","italic":false}',Lore:['{"text":"This hefty rod is"}','{"text":"really hard to wield."}']},HideFlags:60,Damage:59,Enchantments:[{id:"minecraft:knockback",lvl:10s}]} 1

#Resetting all players score and queue; tagging inGame
scoreboard players reset * score
tag @a[scores={queue=1}] add inGame
scoreboard players reset * queue

#Teleportating all inGame players into arena
spreadplayers 0 0 3 11 false @a[tag=inGame]

#%game set to true
scoreboard players set %game wins 1