tellraw @a [{"text":"reload - "},{"text":"Knockback Wars","color":"white","bold":true},{"text":" - ","color":"white","bold":false},{"text":"by Bzlbzlbzl","color":"light_purple"}]

gamerule doLimitedCrafting true
gamerule commandBlockOutput false
gamerule mobGriefing false
gamerule doMobLoot false
gamerule doMobSpawning false
gamerule keepInventory true
gamerule doDaylightCycle true
gamerule doFireTick false
gamerule announceAdvancements false
gamerule doImmediateRespawn true
gamerule doWeatherCycle false

scoreboard players reset * queue
#scoreboard players reset * wins
scoreboard players reset * score
scoreboard players reset * pyroFlail
scoreboard players reset * calculation
scoreboard players reset * reap 
scoreboard players reset * attack 
scoreboard players reset * rend
scoreboard players reset * damage
scoreboard players reset * blocked
scoreboard players reset * last_sprint
scoreboard players reset * jingle

scoreboard objectives add queue dummy
scoreboard objectives setdisplay list queue
scoreboard objectives add wins dummy
scoreboard objectives setdisplay belowName wins
scoreboard objectives add score dummy
scoreboard objectives setdisplay sidebar score
scoreboard objectives add pyroFlail minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add calculation dummy
scoreboard objectives add reap minecraft.used:minecraft.netherite_hoe
scoreboard objectives add attack minecraft.used:minecraft.wooden_hoe
scoreboard objectives add rend minecraft.used:minecraft.diamond_hoe
scoreboard objectives add damage minecraft.custom:minecraft.damage_dealt
scoreboard objectives add blocked minecraft.custom:minecraft.damage_blocked_by_shield
scoreboard objectives add last_sprint dummy
scoreboard objectives add jingle dummy

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
team add Reaper
team modify Reaper color black
team modify Reaper seeFriendlyInvisibles false
team add Duelist
team modify Duelist color red
team modify Duelist seeFriendlyInvisibles false

scoreboard players set %game wins 0

#wins scoreboard will be used for fake player scores (%)
# %game - represents if the game is started or not
# %timer - used for keeping track of when to increment score
# %countdown - the countdown before the game starts
# %count - count of players currently queued

#calculation objective is to calculate the motion of pyromaniac's fireballs
#witch and pyromaniac and reaper also use calculation as a cooldown timer