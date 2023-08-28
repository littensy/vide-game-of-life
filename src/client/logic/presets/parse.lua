local types = require(script.Parent.Parent.types)

local CHARACTER = "x"

local function parse(grid: string): types.BoardState
	local cells: types.BoardState = {}
	local output: types.BoardState = {}

	local cursor = Vector3.new()
	local min = Vector3.new()
	local max = Vector3.new()

	for line in string.gmatch(grid, ".-\n") do
		for character in string.gmatch(line, ".") do
			if character == CHARACTER then
				cells[cursor] = true
			end

			cursor += Vector3.new(1, 0, 0)

			if character == CHARACTER then
				min = Vector3.new(math.min(min.X, cursor.X), math.min(min.Y, cursor.Y), 0)
				max = Vector3.new(math.max(max.X, cursor.X), math.max(max.Y, cursor.Y), 0)
			end
		end

		cursor = Vector3.new(0, cursor.Y + 1, 0)
	end

	local offset = Vector3.new(math.floor((max.X - min.X) / 2), math.floor((max.Y - min.Y) / 2), 0)

	for cell in cells do
		output[cell - offset] = true
	end

	return output
end

return parse
