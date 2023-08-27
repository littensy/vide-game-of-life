local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local Game = require(ReplicatedStorage.client.components.Game)
local Connector = require(ReplicatedStorage.client.components.Connector)

return function(target: Instance)
	vide.apply(target) {
		Game(),
		Connector(),
	}
end
