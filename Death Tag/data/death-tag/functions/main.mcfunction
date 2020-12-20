# # # Death Tag Datapack - Bzlbzlbzl # # #

#Runs function death-tag:scripts/game_main if the game is running (I do this so I don't have to check before every line of code)
execute if score %timer death_tag matches 0.. run function death-tag:scripts/game_main

