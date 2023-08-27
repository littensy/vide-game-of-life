local types = require(script.Parent.types)

local RANGE = 32

local function generate(): types.BoardState
	local state = {}

	for x = -RANGE, RANGE do
		for y = -RANGE, RANGE do
			state[Vector3.new(x, y, 0)] = math.random() > 0.5 or nil
		end
	end

	return state
end

return generate
