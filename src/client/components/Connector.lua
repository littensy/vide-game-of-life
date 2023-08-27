local ReplicatedStorage = game:GetService("ReplicatedStorage")

local rem = require(ReplicatedStorage.client.composables.rem)

local function Connector()
	return {
		rem.RemConnector(),
	}
end

return Connector
