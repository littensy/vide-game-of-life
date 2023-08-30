local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local create = vide.create

local Game = require(script.Parent.Game)

local function App(): { any }
	return {
		create "ScreenGui" {
			Name = "App",
			ResetOnSpawn = false,
			IgnoreGuiInset = true,

			Game(),
		},
	}
end

return App
