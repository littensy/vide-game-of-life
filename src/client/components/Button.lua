local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local rem = require(ReplicatedStorage.client.composables.rem)
local useButton = require(ReplicatedStorage.client.composables.useButton)
local cleanup = require(ReplicatedStorage.client.control.cleanup)
local color = require(ReplicatedStorage.client.utils.color)
local fonts = require(ReplicatedStorage.client.utils.fonts)
local palette = require(ReplicatedStorage.client.utils.palette)
local unwrap = require(ReplicatedStorage.client.utils.unwrap)

type ButtonProps = useButton.Events & {
	font: Font?,
	text: string | vide.Source<string>?,
	textSize: number | vide.Source<number>?,
	textColor: Color3 | vide.Source<Color3>?,
	backgroundColor: Color3 | vide.Source<Color3>?,

	anchorPoint: Vector2 | vide.Source<Vector2>?,
	size: UDim2 | vide.Source<UDim2>?,
	position: UDim2 | vide.Source<UDim2>?,
}

local function Button(props: ButtonProps)
	local hovered, pressed, buttonEvents = useButton(props)

	local backgroundColor = vide.spring(function()
		local hover = hovered()
		local press = pressed()

		return color.brightness(
			unwrap(props.backgroundColor) or palette.blue,
			if press then -0.15 elseif hover then -0.1 else 0
		)
	end, 0.2)

	local bodyPosition = vide.spring(function()
		return if pressed() then UDim2.new(0, 0, 0, rem.use(0.4)) else UDim2.new()
	end, 0.2)

	return vide.create "TextButton" {
		Text = "",
		BackgroundTransparency = 1,

		AnchorPoint = props.anchorPoint,
		Size = props.size,
		Position = props.position,

		buttonEvents,

		vide.create "Frame" {
			Name = "Body",

			BackgroundColor3 = backgroundColor,
			BorderSizePixel = 0,

			Size = UDim2.new(1, 0, 1, 0),
			Position = bodyPosition,

			vide.create "UICorner" {
				CornerRadius = rem.udim(0, 0.5),
			},

			vide.create "TextLabel" {
				Name = "Text",
				Text = props.text,
				TextSize = props.textSize or rem.units(1),
				TextColor3 = props.textColor or palette.white,
				FontFace = props.font or fonts.inter.medium,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
			},
		},
	}
end

return Button
