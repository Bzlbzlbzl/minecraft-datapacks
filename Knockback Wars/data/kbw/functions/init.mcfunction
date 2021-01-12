tellraw @a [{"text":"reload - "},{"text":"Knockback Wars","color":"white","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives add queue dummy
scoreboard objectives setdisplay list queue
scoreboard objectives add wins dummy
scoreboard objectives setdisplay belowName wins
scoreboard objectives add score dummy
scoreboard objectives setdisplay sidebar score

team add Assassin
team modify Assassin color yellow
team modify Assassin seeFriendlyInvisibles false
team add Knight
team modify Knight color dark_red
team add Archer
team modify Archer color aqua
team add Witch
team modify Witch color dark_purple
team add Pyromaniac
team modify Pyromaniac color gold
team add Ghost
team modify Ghost color dark_gray
team modify Ghost seeFriendlyInvisibles false

scoreboard players set %game wins 0

#wins scoreboard will be used for fake player scores (%)
#%game - represents if the game is started or not
#%timer - used for keeping track of when to increment score