local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local Cleanup = require(script.Parent.Cleanup)

type Component<T> = (T) -> any

local function unmount(elements)
	local container = vide.create "Folder" { elements }
	container:Destroy()
end

local function Dynamic<T>(props: {
	component: vide.Source<Component<T>?>,
} & T): { any }
	local set = vide.source({})
	local destroyed = false

	vide.watch(function()
		set({ props.component() })
	end)

	return {
		vide.values(set, function(render)
			local elements = render(props)

			vide.cleanup(function()
				if not destroyed then
					unmount(elements)
				end
			end)

			return elements
		end),

		Cleanup(function()
			destroyed = true
		end),
	}
end

return Dynamic
