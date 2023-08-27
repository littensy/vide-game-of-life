local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)

local function Cleanup(callback: () -> ())
	return vide.create "Folder" {
		Destroying = callback,
	}
end

return Cleanup
