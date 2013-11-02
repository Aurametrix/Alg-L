string.find("banana", 'na')  -- find 1st occurance of 'an' as exact match
string.find("abcdefg", 'c...')  -- find pattern c followed by 3 letters, return position
string.match("abcdefg", 'c...') -- find and return the matched text

--[[
+  - one or more times, [] - classes, %d - digit
--]]

