local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local Cleanup = require(ReplicatedStorage.client.components.Cleanup)

local BASE_REM = 16
local BASE_HEIGHT = 680

local rem = vide.source(BASE_REM)

local function RemConnector()
	local camera = workspace.CurrentCamera

	local function update()
		local proportional = camera.ViewportSize.Y / BASE_HEIGHT * BASE_REM
		rem(math.round(proportional / 2) * 2)
	end

	local connection = camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
		update()
	end)

	update()

	return Cleanup(function()
		connection:Disconnect()
	end)
end

local function use(n: number)
	return n * rem()
end

local function units(n: number)
	return function()
		return n * rem()
	end
end

local function udim2(xScale: number, xOffset: number, yScale: number, yOffset: number)
	return function()
		return UDim2.new(xScale, xOffset * rem(), yScale, yOffset * rem())
	end
end

local function udim(xScale: number, xOffset: number)
	return function()
		return UDim.new(xScale, xOffset * rem())
	end
end

return {
	RemConnector = RemConnector,
	use = use,
	units = units,
	udim2 = udim2,
	udim = udim,
}
