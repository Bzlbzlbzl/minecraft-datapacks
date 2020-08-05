scoreboard players remove @s magnet_removed 1
give @s blaze_rod{display:{Name:'{"text":"Magnet","color":"red","italic":false}'},magnet:1b} 1
execute as @a[scores={magnet_removed=1..}] run function magnet:return