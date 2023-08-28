local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local rem = require(ReplicatedStorage.client.composables.rem)
local fonts = require(ReplicatedStorage.client.utils.fonts)
local palette = require(ReplicatedStorage.client.utils.palette)

type Props = {
	onClick: () -> (),

	font: Font?,
	text: string | vide.Source<string>?,
	textSize: number | vide.Source<number>?,
	textColor: Color3 | vide.Source<Color3>?,
	backgroundColor: Color3 | vide.Source<Color3>?,

	anchorPoint: Vector2 | vide.Source<Vector2>?,
	size: UDim2 | vide.Source<UDim2>?,
	position: UDim2 | vide.Source<UDim2>?,
}

local function Button(props: Props)
	local hovered = vide.source(false)
	local pressed = vide.source(false)

	local offset = vide.spring(function()
		return if pressed() then UDim2.new(0, 0, 0, rem.use(0.4)) else UDim2.new()
	end, 0.2)

	return vide.create "TextButton" {
		Text = "",
		BackgroundTransparency = 1,

		AnchorPoint = props.anchorPoint,
		Size = props.size,
		Position = props.position,

		Activated = props.onClick,

		MouseEnter = function()
			hovered(true)
		end,

		MouseLeave = function()
			hovered(false)
			pressed(false)
		end,

		MouseButton1Down = function()
			pressed(true)
		end,

		MouseButton1Up = function()
			pressed(false)
		end,

		vide.create "TextLabel" {
			Name = "Body",

			Text = props.text,
			TextSize = props.textSize or rem.units(1),
			TextColor3 = props.textColor or palette.white,
			FontFace = props.font or fonts.inter.medium,

			BackgroundColor3 = props.backgroundColor or palette.blue,
			BorderSizePixel = 0,

			Size = UDim2.new(1, 0, 1, 0),
			Position = offset,

			vide.create "UICorner" {
				CornerRadius = rem.udim(0, 0.5),
			},
		},

		vide.create "Frame" {
			Name = "Highlight",

			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = vide.spring(function()
				local hover = hovered()
				local press = pressed()
				return if hover and not press then 0.85 else 1
			end, 0.2),
			BorderSizePixel = 0,

			Size = UDim2.new(1, 0, 1, 0),
			Position = offset,

			vide.create "UICorner" {
				CornerRadius = rem.udim(0, 0.5),
			},
		},
	}
end

return Button
