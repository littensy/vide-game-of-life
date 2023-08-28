local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local setInterval = require(ReplicatedStorage.shared.setInterval)
local logic = require(ReplicatedStorage.client.logic)
local Cleanup = require(ReplicatedStorage.client.control.Cleanup)

local GameBoard = require(script.Parent.GameBoard)
local GameControls = require(script.Parent.GameControls)

local function Game(): { any }
	local state = vide.source(logic.presets.fireship)
	local paused = vide.source(false)

	local disconnect = setInterval(function()
		if not paused() then
			state(logic.solve(state()))
		end
	end, 1 / 30)

	return {
		GameBoard {
			state = state,
		},

		GameControls {
			onPause = paused,
			onShuffle = function()
				state(logic.shuffle())
			end,
		},

		Cleanup {
			disconnect,
		},
	}
end

return Game
