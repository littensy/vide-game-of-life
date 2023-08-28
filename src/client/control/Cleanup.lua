local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)

type CleanupProps = { () -> () }

local function Cleanup(props: CleanupProps)
	return vide.create "Folder" {
		Name = "Cleanup",
		Destroying = function()
			for _, callback in props do
				callback()
			end
		end,
	}
end

return Cleanup
