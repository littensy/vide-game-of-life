local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)

local function dynamic<T>(source: vide.Source<T>, render: (value: T) -> any)
	local children = vide.source(nil :: any)

	vide.watch(function()
		local value = source()

		task.defer(function()
			children({ render(value) })
		end)
	end)

	return children
end

return dynamic
