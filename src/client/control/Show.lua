local ReplicatedStorage = game:GetService("ReplicatedStorage")

local match = require(script.Parent.match)
local vide = require(ReplicatedStorage.modules.vide)

type ShowComponents = {
	show: () -> any,
	hide: () -> any,
}

local function show(condition: vide.Source<boolean>)
	local function truthy()
		return not not condition()
	end

	return function(components: ShowComponents)
		return match(truthy) {
			[true] = components.show,
			[false] = components.hide,
		}
	end
end

return show
