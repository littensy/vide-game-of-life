local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local create = vide.create

local Game = require(ReplicatedStorage.client.components.Game)
local Connector = require(ReplicatedStorage.client.components.Connector)

return function(target: Instance)
	local container = create "Folder" {
		Parent = target,

		Game(),
		Connector(),
	}

	return function()
		container:Destroy()
	end
end
