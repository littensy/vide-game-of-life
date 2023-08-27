local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local Cleanup = require(ReplicatedStorage.client.components.Cleanup)

local BASE_REM = 16
local BASE_HEIGHT = 680

local rem = vide.source(BASE_REM)

local function update(size: Vector2)
	local proportional = size.Y / BASE_HEIGHT * BASE_REM
	rem(math.round(proportional / 2) * 2)
end

local function connect()
	local camera = workspace.CurrentCamera

	local connection = camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
		update(camera.ViewportSize)
	end)

	update(camera.ViewportSize)

	return Cleanup(function()
		connection:Disconnect()
	end)
end

local function units(n: number)
	return n * rem()
end

local function value(n: number)
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
	units = units,
	value = value,
	udim2 = udim2,
	udim = udim,
	connect = connect,
}
