local ReplicatedStorage = game:GetService("ReplicatedStorage")

local logic = require(ReplicatedStorage.client.logic)

local function align(state: logic.BoardState): logic.BoardState
	local nextState = {}
	local bounds = Vector3.new()
	local offset = Vector3.new()

	for position in state do
		bounds = Vector3.new(math.max(bounds.X, position.X), math.max(bounds.Y, position.Y), 0)
		offset = Vector3.new(math.floor(bounds.X / 2), math.floor(bounds.Y / 2), 0)
	end

	for position in state do
		nextState[position - offset] = true
	end

	return nextState
end

local function parse(grid: string): logic.BoardState
	local state = {}
	local cursor = Vector3.new()

	for character in string.gmatch(grid, ".") do
		if character == "\n" then
			cursor = Vector3.new(0, cursor.Y + 1, 0)
			continue
		end

		if character ~= " " then
			state[cursor] = true
		end

		cursor += Vector3.new(1, 0, 0)
	end

	return align(state)
end

return parse
