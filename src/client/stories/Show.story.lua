local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local Show = require(ReplicatedStorage.client.control.Show)
local Button = require(ReplicatedStorage.client.components.Button)

return function(target: Instance)
	local condition = vide.source(false)

	vide.apply(target) {
		Show {
			when = condition,
			render = function()
				return vide.create "Frame" {
					BackgroundColor3 = Color3.fromRGB(34, 164, 106),
					Size = UDim2.new(0, 100, 0, 100),
					Destroying = function()
						print("on -> off")
					end,
				}
			end,
			fallback = function()
				return vide.create "Frame" {
					BackgroundColor3 = Color3.fromRGB(203, 74, 74),
					Size = UDim2.new(0, 100, 0, 100),
					Position = UDim2.new(0, 100, 0, 0),
					Destroying = function()
						print("off -> on")
					end,
				}
			end,
		},

		Button {
			text = function()
				return if condition() then "On" else "Off"
			end,
			anchorPoint = Vector2.new(0.5, 0.5),
			size = UDim2.new(0, 100, 0, 50),
			position = UDim2.new(0.5, 0, 0.5, 0),
			onClick = function()
				condition(not condition())
			end,
		},
	}
end
