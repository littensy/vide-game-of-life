local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local Dynamic = require(script.Parent.Dynamic)

type Children = { any }

local function Show(props: Children & {
	when: vide.Source<unknown>,
	render: () -> any,
	fallback: (() -> any)?,
})
	return Dynamic {
		component = function()
			return if props.when() then props.render else props.fallback
		end,
	}
end

return Show
