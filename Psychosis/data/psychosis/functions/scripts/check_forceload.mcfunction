#Checks if chunks are marked for forceload, and if not then set forceload
execute store success score %forceload psychosis run forceload query ~ ~
execute if score %forceload psychosis matches 0 run forceload add ~ ~
