local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local create = vide.create

local rem = require(ReplicatedStorage.client.composables.rem)
local palette = require(ReplicatedStorage.client.utils.palette)

local Button = require(script.Parent.Button)

type GameControlsProps = {
	paused: vide.Source<boolean>,
	onPause: () -> (),
	onShuffle: () -> (),
}

local function GameControls(props: GameControlsProps)
	local function pauseText()
		return if props.paused() then "Paused" else "Playing"
	end

	local function pauseColor()
		return if props.paused() then palette.yellow else palette.green
	end

	return create "Frame" {
		Position = rem.udim2(0.5, 0, 1, -4),
		ZIndex = 2,

		create "UIListLayout" {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = rem.udim(0, 1),
		},

		Button {
			onClick = props.onPause,
			text = pauseText,
			backgroundColor = pauseColor,
			size = rem.udim2(0, 6, 0, 3),
		},

		Button {
			onClick = props.onShuffle,
			text = "Shuffle",
			backgroundColor = palette.red,
			size = rem.udim2(0, 6, 0, 3),
		},
	}
end

return GameControls
