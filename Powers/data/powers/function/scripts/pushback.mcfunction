#Pushes all evil entities away
tag @s add presPush
execute at @s as @e[type=#powers:to_push,distance=..6.2] unless entity @s[tag=presGuard] at @s run function powers:scripts/push
execute at @s as @e[type=#powers:to_maybe_push,distance=..6.2] if data entity @s AngryAt at @s run function powers:scripts/maybe_push
tag @s remove presPush
playsound minecraft:block.anvil.place master @a ~ ~ ~ 1 2
playsound item.goat_horn.sound.1 master @a ~ ~ ~ 1 1
scoreboard players set @s pres_push_cd -140
execute rotated ~90 0 positioned ^6 ^ ^-6 run function powers:scripts/shield
function powers:scripts/circle
particle minecraft:cloud ~ ~0.2 ~ 0.5 0.2 0.5 0.5 40 normal
effect give @s resistance 1 2 false