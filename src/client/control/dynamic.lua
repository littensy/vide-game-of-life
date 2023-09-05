local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)

local function dynamic<T>(source: vide.Source<T>, render: (value: T) -> ())
	local children = vide.source({})
	local previous

	vide.watch(function()
		local current = source()

		if previous == current then
			return
		end

		previous = current

		-- todo: use vide.untrack
		task.defer(function()
			children({ render(current) })
		end)
	end)

	return children
end

return dynamic
