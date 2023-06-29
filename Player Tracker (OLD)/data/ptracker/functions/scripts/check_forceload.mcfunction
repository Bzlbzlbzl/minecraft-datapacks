#Checks if chunks are marked for forceload, and if not then set forceload
execute store success score %forceload compass run forceload query ~ ~
execute if score %forceload compass matches 0 run forceload add ~ ~
