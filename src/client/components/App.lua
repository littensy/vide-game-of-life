local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local Game = require(script.Parent.Game)
local Connector = require(script.Parent.Connector)

local function App(): { any }
	return {
		Connector(),

		vide.create "ScreenGui" {
			Name = "App",
			ResetOnSpawn = false,
			IgnoreGuiInset = true,
			Game(),
		},
	}
end

return App
