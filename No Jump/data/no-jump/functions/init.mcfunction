tellraw @a [{"text":"reload - "},{"text":"No Jump","color":"green","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives add Jump trigger
scoreboard objectives add FallDistance dummy
scoreboard players set %jump Jump 1
scoreboard players enable @a Jump
# %jump represents whether people can jump or not