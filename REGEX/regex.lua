string.find("banana", 'na')  -- find 1st occurance of 'an' as exact match
string.find("abcdefg", 'c...')  -- find pattern c followed by 3 letters, return position
string.match("abcdefg", 'c...') -- find and return the matched text

--[[
+  - one or more times, [] - classes, %d - digit
() grouping, * zero or more, ? one or more, | or
--]]

--[[
Parsing into syntax tree from left to right 
]]--
local function parse(input)
	local s  = stack.new_stack()
	--node list is built such that the node appears in reverse polish notation.
	local node_list = {}

	--shift each iteration
	for i=1,string.len(input),1 do
		local c = string.sub(input, i, i)
		local lexval = {lexer(c)}
		stack.push(s, lexval)
		while true do
			local node = try_reduce(s)
			if node == nil then
				break
			end
			table.insert(node_list, #node_list+1, node)
		end
	end
	stack.push(s, {token.END})
	try_reduce(s)

	if stack.peek(s)[1] ~= token.S then
		return nil
	end
	--build the tree
	local tree = build_tree(node_list)
	--print(dump_tree(tree))
	return tree
end
