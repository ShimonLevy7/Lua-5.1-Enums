--- Enum
--
-- @param names				variable names
-- @param ruler_function	ruler function that recieves the index and decides the value of the enum entry
--
-- @return	enum (table)
--
local function newEnum(names, ruler_function)
	local index, tbl = 0, { }

	for i = 1, #names do
		tbl[names[i]] = (ruler_function(index) or index)

		index = index + 1
	end

	return tbl
end

--- Example
local test_enum = newEnum({ 'A', 'B', 'C' },
	function(index)
		if index == 3 then
			return 'test'
		end
	end)

print(test_enum.A)
print(test_enum.B)
print(test_enum.C)
