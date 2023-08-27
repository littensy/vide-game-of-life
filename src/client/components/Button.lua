local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local fonts = require(ReplicatedStorage.client.utils.fonts)
local palette = require(ReplicatedStorage.client.utils.palette)
local resolve = require(ReplicatedStorage.client.utils.resolve)

local function Button(props: {
	font: Font?,
	text: resolve.Resolvable<string>?,
	textColor: resolve.Resolvable<Color3>?,
	textSize: resolve.Resolvable<number>?,
	backgroundColor: resolve.Resolvable<Color3>?,
	size: resolve.Resolvable<UDim2>?,
	position: resolve.Resolvable<UDim2>?,
	anchorPoint: Vector2?,
	onClick: () -> (),
})
	local hovered = vide.source(false)
	local pressed = vide.source(false)

	local highlightTransparency = vide.spring(function()
		local hover = hovered()
		local press = pressed()
		return if press then 1 elseif hover then 0.85 else 1
	end, 0.2)

	local buttonOffset = vide.spring(function()
		return if pressed() then UDim2.new(0, 0, 0, 5) else UDim2.new()
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
			FontFace = props.font or fonts.inter.medium,
			Text = props.text,
			TextColor3 = props.textColor or palette.white,
			TextSize = props.textSize or 16,
			BackgroundColor3 = props.backgroundColor or palette.blue,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			Position = buttonOffset,

			vide.create "UICorner" {
				CornerRadius = UDim.new(0, 8),
			},
		},

		vide.create "Frame" {
			Name = "Highlight",
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = highlightTransparency,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			Position = buttonOffset,

			vide.create "UICorner" {
				CornerRadius = UDim.new(0, 8),
			},
		},
	}
end

return Button
