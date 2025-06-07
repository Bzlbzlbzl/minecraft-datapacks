# Flower Effects
# Speed - Pink Tulip
# Slowness - Azure Bluet
# Haste - Rose Bush
# Mining Fatigue - Lilac
# Strength - Red Tulip
# Jump Boost - Cornflower
# Nausea - Pitcher Plant
# Regeneration - Oxeye Daisy
# Resistance - Poppy
# Fire Resistance - Orange Tulip
# Water Breathing - Blue Orchid
# Invisibility - Allium
# Blindness - Closed Eyeblossom
# Night Vision - Open Eyeblossom
# Hunger - Peony
# Weakness - White Tulip
# Poison - Lily of the Valley
# Wither - Wither Rose
# Saturation - Sunflower
# Levitation - Cactus Flower
# Slow Falling - Dandelion
# Glowing - Torchflower
# Luck - Pink Petals
# Absorption - Wildflowers

execute as @a[predicate=!why:sneaking] at @s if block ~ ~ ~ #minecraft:flowers run function why:flower_effects/give_effect
