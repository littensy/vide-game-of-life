local ReplicatedStorage = game:GetService("ReplicatedStorage")

local rem = require(ReplicatedStorage.client.composables.rem)
local Cleanup = require(ReplicatedStorage.client.control.Cleanup)

local function Connector()
	return Cleanup {
		rem.useRem(),
	}
end

return Connector
