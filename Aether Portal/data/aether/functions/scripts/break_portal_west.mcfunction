#Destroys north-facing portal with fill and sounds and kill aec and stuff
playsound minecraft:block.amethyst_block.break block @a ~ ~ ~ 2 0
playsound minecraft:block.amethyst_block.break block @a ~ ~ ~ 2 1
playsound minecraft:block.amethyst_block.break block @a ~ ~ ~ 2 1
playsound minecraft:block.amethyst_block.break block @a ~ ~ ~ 2 1
playsound minecraft:block.amethyst_block.break block @a ~ ~ ~ 2 2
particle minecraft:block water ~ ~1.5 ~ 1 1.5 0.5 1 2 normal
fill ~ ~ ~1 ~-1 ~2 ~-1 air replace #aether:structure_void_water
kill @s