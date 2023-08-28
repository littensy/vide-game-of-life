local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local rem = require(ReplicatedStorage.client.composables.rem)
local palette = require(ReplicatedStorage.client.utils.palette)
local Button = require(script.Parent.Button)

type GameControlsProps = {
	onPause: vide.Source<boolean>,
	onShuffle: () -> (),
}

local function GameControls(props: GameControlsProps)
	return vide.create "Frame" {
		Position = rem.udim2(0.5, 0, 1, -4),
		ZIndex = 2,

		vide.create "UIListLayout" {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = rem.udim(0, 1),
		},

		Button {
			onClick = function()
				props.onPause(not props.onPause())
			end,

			text = function()
				return if props.onPause() then "Paused" else "Playing"
			end,

			backgroundColor = vide.spring(function()
				return if props.onPause() then palette.yellow else palette.green
			end, 0.2),

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
