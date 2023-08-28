local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local Dynamic = require(script.Parent.Dynamic)

type ShowProps = {
	when: vide.Source<unknown>,
	component: () -> any,
	fallback: (() -> any)?,
}

local function Show(props: ShowProps)
	return Dynamic {
		component = function()
			return if props.when() then props.component else props.fallback
		end,
	}
end

return Show
