local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local setInterval = require(ReplicatedStorage.shared.setInterval)
local logic = require(ReplicatedStorage.client.logic)
local presets = require(ReplicatedStorage.client.presets)

local Cleanup = require(script.Parent.Cleanup)
local GameBoard = require(script.Parent.GameBoard)
local GameControls = require(script.Parent.GameControls)

local function Game(): { any }
	local state = vide.source(presets.fireship)
	local paused = vide.source(false)

	local disconnect = setInterval(function()
		if not paused() then
			debug.profilebegin("GameOfLife")
			state(logic.solve(state()))
			debug.profileend()
		end
	end, 1 / 30)

	return {
		GameBoard {
			state = state,
		},

		GameControls {
			onPause = paused,
			onShuffle = function()
				state(logic.generate())
			end,
		},

		Cleanup(function()
			disconnect()
		end),
	}
end

return Game
