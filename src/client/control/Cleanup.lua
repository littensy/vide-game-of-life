local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)

local function Cleanup(onDestroy: () -> ())
	return vide.create "Folder" {
		Destroying = onDestroy,
	}
end

return Cleanup
