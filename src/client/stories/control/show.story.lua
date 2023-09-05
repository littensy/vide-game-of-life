local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Button = require(ReplicatedStorage.client.components.Button)
local cleanup = require(ReplicatedStorage.client.control.cleanup)
local show = require(ReplicatedStorage.client.control.show)
local unmount = require(ReplicatedStorage.client.control.unmount)
local vide = require(ReplicatedStorage.modules.vide)

local function On()
	return vide.create "Frame" {
		BackgroundColor3 = Color3.fromRGB(34, 164, 106),
		Size = UDim2.new(0, 100, 0, 100),
		cleanup(function()
			print("on -> off")
		end),
	}
end

local function Off()
	return vide.create "Frame" {
		BackgroundColor3 = Color3.fromRGB(203, 74, 74),
		Size = UDim2.new(0, 100, 0, 100),
		Position = UDim2.new(0, 100, 0, 0),
		cleanup(function()
			print("off -> on")
		end),
	}
end

return function(target: Instance)
	local condition = vide.source(false)

	local children: { any } = {
		show(condition) {
			show = On,
			hide = Off,
		},

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

	vide.apply(target)(children)

	return function()
		unmount(children)
	end
end
