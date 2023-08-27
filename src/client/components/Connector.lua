local ReplicatedStorage = game:GetService("ReplicatedStorage")

local rem = require(ReplicatedStorage.client.composables.rem)

local function Connector()
	return {
		rem.connect(),
	}
end

return Connector
