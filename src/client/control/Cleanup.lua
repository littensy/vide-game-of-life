local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local create = vide.create

type CleanupProps = {
	[any]: () -> (),
}

local function Cleanup(props: CleanupProps)
	return create "Folder" {
		Name = "Cleanup",
		Destroying = function()
			for _, callback in props do
				callback()
			end
		end,
	}
end

return Cleanup
