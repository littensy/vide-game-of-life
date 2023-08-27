local ReplicatedStorage = game:GetService "ReplicatedStorage"

local vide = require(ReplicatedStorage.modules.vide)
local setInterval = require(ReplicatedStorage.shared.setInterval)
local logic = require(ReplicatedStorage.client.logic)

local Cleanup = require(script.Parent.Cleanup)
local GameBoard = require(script.Parent.GameBoard)

local function Game(): { any }
	local state = vide.source(logic.generate())

	local disconnect = setInterval(function()
		debug.profilebegin("GameOfLife")
		state(logic.solve(state()))
		debug.profileend()
	end, 1 / 30)

	return {
		GameBoard {
			state = state,
		},

		Cleanup(function()
			disconnect()
		end),
	}
end

return Game
