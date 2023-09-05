local ReplicatedStorage = game:GetService("ReplicatedStorage")

local change = require(ReplicatedStorage.client.control.change)
local dynamic = require(ReplicatedStorage.client.control.dynamic)
local vide = require(ReplicatedStorage.modules.vide)
local unmount = require(ReplicatedStorage.client.control.unmount)
local setInterval = require(ReplicatedStorage.shared.setInterval)

local function pollCleanup(instance: Instance)
	local ref = setmetatable({ instance = instance }, { __mode = "v" })
	local name = instance.Name
	local disconnect
	disconnect = setInterval(function()
		if ref.instance then
			print(name)
		else
			print(`Released {name}`)
			disconnect()
		end
	end, 1)
end

return function(target: Instance)
	local size = vide.source(Vector2.zero)

	local function condition()
		return size().X > 800
	end

	local handle = dynamic(condition, function(big)
		local instance = vide.create "TextLabel" {
			Name = if big then "Big" else "Small",
			Text = function()
				return tostring(size())
			end,
			TextSize = 32,
			Size = UDim2.new(1, 0, 1, 0),
			change { AbsoluteSize = size },
		}

		pollCleanup(instance)

		return instance
	end)

	vide.apply(target) { handle }

	return function()
		unmount(handle)
	end
end
