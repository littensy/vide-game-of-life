local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)

local function Cleanup(...: () -> ())
	local listeners = { ... }

	return vide.create "Folder" {
		Name = "Cleanup",
		Destroying = function()
			for _, callback in listeners do
				callback()
			end
		end,
	}
end

return Cleanup
