local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local unmount = require(ReplicatedStorage.client.control.unmount)
local Game = require(ReplicatedStorage.client.components.Game)
local Connector = require(ReplicatedStorage.client.components.Connector)

return function(target: Instance)
	local children = {
		Game(),
		Connector(),
	}

	vide.apply(target) { children }

	return function()
		unmount(children)
	end
end
