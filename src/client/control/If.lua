local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local Dynamic = require(script.Parent.Dynamic)

local function If(condition: vide.Source<unknown>, render: () -> any): { any }
	return Dynamic {
		component = function()
			return if condition() then render else nil
		end,
	}
end

return If
