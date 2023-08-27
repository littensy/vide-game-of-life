local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)

local function story(component: () -> unknown)
	return function(target: Instance)
		local instance = vide.create "Frame" {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			component(),
		}

		instance.Parent = target

		return function()
			instance:Destroy()
		end
	end
end

return story
