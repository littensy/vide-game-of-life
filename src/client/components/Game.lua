local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local source = vide.source

local setInterval = require(ReplicatedStorage.shared.setInterval)
local logic = require(ReplicatedStorage.client.logic)
local Cleanup = require(ReplicatedStorage.client.control.Cleanup)

local GameBoard = require(script.Parent.GameBoard)
local GameControls = require(script.Parent.GameControls)

local function Game(): { any }
	local state = source(logic.presets.fireship)
	local paused = source(true)

	local disconnect = setInterval(function()
		if not paused() then
			state(logic.solve(state()))
		end
	end, 1 / 30)

	local function pause()
		paused(not paused())
	end

	local function shuffle()
		state(logic.shuffle())
	end

	return {
		GameBoard {
			state = state,
		},

		GameControls {
			onPause = pause,
			onShuffle = shuffle,
			paused = paused,
		},

		Cleanup {
			disconnect,
		},
	}
end

return Game
