local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local palette = require(ReplicatedStorage.client.utils.palette)
local Button = require(script.Parent.Button)

local BUTTON_SIZE = UDim2.new(0, 96, 0, 48)

local function GameControls(props: {
	onPause: vide.Source<boolean>,
	onShuffle: () -> (),
})
	local function pauseButtonText()
		return if props.onPause() then "Resume" else "Pause"
	end

	local pauseButtonColor = vide.spring(function()
		return if props.onPause() then palette.green else palette.yellow
	end, 0.2)

	props.onPause(true)

	return vide.create "Frame" {
		Position = UDim2.new(0.5, 0, 1, -36),

		vide.create "UIListLayout" {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 10),
		},

		Button {
			text = pauseButtonText,
			backgroundColor = pauseButtonColor,
			size = BUTTON_SIZE,
			onClick = function()
				props.onPause(not props.onPause())
			end,
		},

		Button {
			text = "Shuffle",
			backgroundColor = palette.red,
			size = BUTTON_SIZE,
			onClick = props.onShuffle,
		},
	}
end

return GameControls
