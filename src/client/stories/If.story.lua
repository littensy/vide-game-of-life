local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local create = vide.create
local source = vide.source

local If = require(ReplicatedStorage.client.control.If)
local Button = require(ReplicatedStorage.client.components.Button)

return function(target: Instance)
	local condition = source(false)

	local container = create "Folder" {
		Parent = target,

		If(condition, function()
			return vide.create "Frame" {
				BackgroundColor3 = Color3.fromRGB(34, 164, 106),
				Size = UDim2.new(0, 100, 0, 100),
				Destroying = function()
					print("on -> off")
				end,
			}
		end),

		Button {
			onClick = function()
				condition(not condition())
			end,

			text = function()
				return if condition() then "On" else "Off"
			end,

			anchorPoint = Vector2.new(0.5, 0.5),
			size = UDim2.new(0, 100, 0, 50),
			position = UDim2.new(0.5, 0, 0.5, 0),
		},
	}

	return function()
		container:Destroy()
	end
end
