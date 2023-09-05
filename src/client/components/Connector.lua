local ReplicatedStorage = game:GetService("ReplicatedStorage")

local rem = require(ReplicatedStorage.client.composables.rem)
local cleanup = require(ReplicatedStorage.client.control.cleanup)

local function Connector()
	return cleanup {
		rem.useRem(),
	}
end

return Connector
