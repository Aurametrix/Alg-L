-- pseudocode of a fifo queue in lua

-- an empty table 
basicFifo = {}
 
-- add elements
 
table.insert(basicFifo, "wash dishes")
table.insert(basicFifo, "walk dog")
table.insert(basicFifo, "dance jig")
 
-- remove elements in the order they were added
 
actionToTake = table.remove(basicFifo, 1)
doAction(actionToTake)
