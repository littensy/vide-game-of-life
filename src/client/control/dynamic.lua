local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)

local function dynamic<T>(source: vide.Source<T>, render: (value: T) -> ())
	local children = vide.source({})

	vide.watch(function()
		local value = source()

		-- todo: use vide.untrack
		task.defer(function()
			children({ render(value) })
		end)
	end)

	return children
end

return dynamic
