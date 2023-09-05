local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local action = vide.action

type CleanupProps = () -> () | {
	[any]: () -> (),
}

local function cleanup(props: CleanupProps)
	return action(function(instance)
		instance.AncestryChanged:Connect(function(_, parent)
			if parent then
				return
			end

			if type(props) == "function" then
				props()
				return
			end

			for _, callback in props do
				callback()
			end
		end)
	end)
end

return cleanup
