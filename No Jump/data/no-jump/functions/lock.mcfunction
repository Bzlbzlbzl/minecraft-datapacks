#Locks all players from toggling Jump (since I'm resetting Jump, %jump gets messed up so I'm using %temp in FallDistance to store it temporarily)
scoreboard players operation %temp FallDistance = %jump Jump
scoreboard players reset * Jump
scoreboard players operation %jump Jump = %temp FallDistance 