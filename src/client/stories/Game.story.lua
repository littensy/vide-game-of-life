local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local Game = require(ReplicatedStorage.client.components.Game)

return function(target: Instance)
	vide.apply(target) {
		Game(),
	}
end
