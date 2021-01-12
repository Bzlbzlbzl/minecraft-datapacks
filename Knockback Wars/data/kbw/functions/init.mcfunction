tellraw @a [{"text":"reload - "},{"text":"Knockback Wars","color":"white","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

scoreboard objectives add queue dummy
scoreboard objectives setdisplay list queue
scoreboard objectives add wins dummy
scoreboard objectives setdisplay belowName wins
scoreboard objectives add score dummy
scoreboard objectives setdisplay sidebar score
scoreboard objectives add pyroFlail minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add calculation dummy

team add Assassin
team modify Assassin color yellow
team modify Assassin seeFriendlyInvisibles false
team add Knight
team modify Knight color dark_red
team modify Knight seeFriendlyInvisibles false
team add Archer
team modify Archer color aqua
team modify Archer seeFriendlyInvisibles false
team add Witch
team modify Witch color dark_purple
team modify Witch seeFriendlyInvisibles false
team add Pyromaniac
team modify Pyromaniac color gold
team modify Pyromaniac seeFriendlyInvisibles false
team add Ghost
team modify Ghost color dark_gray
team modify Ghost seeFriendlyInvisibles false

scoreboard players set %game wins 0

#wins scoreboard will be used for fake player scores (%)
#%game - represents if the game is started or not
#%timer - used for keeping track of when to increment score
#%countdown - the countdown before the game starts
#%count - count of players currently queued

#Witch will use calculation score for Witch potions