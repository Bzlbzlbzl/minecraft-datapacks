# Run by creepers to set name. REPLACES CURRENT POS WITH AIR BUT THATS FINE
execute at @s run setblock ~ ~ ~ cherry_sign
execute at @s run data modify block ~ ~ ~ front_text.messages[0] set value {"selector":"@a[team=creeper,limit=1,sort=nearest,scores={creeper_boom=30..}]"}
execute at @s run data modify entity @s CustomName set from block ~ ~ ~ front_text.messages[0]
execute at @s run setblock ~ ~ ~ air