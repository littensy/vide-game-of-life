local ReplicatedStorage = game:GetService("ReplicatedStorage")

local dynamic = require(script.Parent.dynamic)
local vide = require(ReplicatedStorage.modules.vide)

type ShowComponents = {
	show: (() -> ())?,
	hide: (() -> ())?,
}

local function show(condition: vide.Source<boolean>)
	local function truthy()
		return not not condition()
	end

	return function(components: ShowComponents)
		return dynamic(truthy, function(value)
			local component: (() -> ())? = if value then components.show else components.hide
			return component and component()
		end)
	end
end

return show
