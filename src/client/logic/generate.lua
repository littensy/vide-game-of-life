local types = require(script.Parent.types)

local function generate(): types.BoardState
	local state = {}

	for x = -16, 16 do
		for y = -16, 16 do
			state[Vector3.new(x, y, 0)] = math.random() > 0.5 or nil
		end
	end

	return state
end

return generate
