local RunService = game:GetService("RunService")

local function setInterval(callback: () -> (), interval: number)
	local timer = 0
	local connection

	connection = RunService.Heartbeat:Connect(function(deltaTime)
		timer += deltaTime
		if timer >= interval then
			timer -= interval
			callback()
		end
	end)

	return function()
		connection:Disconnect()
	end
end

return setInterval
