local ReplicatedStorage = game:GetService("ReplicatedStorage")

local board = require(ReplicatedStorage.client.board)
local Game = require(ReplicatedStorage.client.components.Game)
local story = require(script.Parent.helpers.story)

local function generate(): board.BoardState
	local state = {}

	for x = -16, 16 do
		for y = -16, 16 do
			if math.random() > 0.5 then
				continue
			end

			state[Vector3.new(x, y, 0)] = true
		end
	end

	return state
end

return story(function()
	return Game { state = generate() }
end)
