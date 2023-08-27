local ReplicatedStorage = game:GetService "ReplicatedStorage"

local vide = require(ReplicatedStorage.modules.vide)
local setInterval = require(ReplicatedStorage.shared.setInterval)
local board = require(ReplicatedStorage.client.board)

local Cleanup = require(script.Parent.Cleanup)
local GameBoard = require(script.Parent.GameBoard)

local function Game(props: { state: board.BoardState? }): { any }
	local state = vide.source(props.state or {})

	local disconnect = setInterval(function()
		debug.profilebegin("GameOfLife")
		state(board.solve(state()))
		debug.profileend()
	end, 1 / 30)

	return {
		GameBoard { state = state },

		Cleanup(function()
			disconnect()
		end),
	}
end

return Game
