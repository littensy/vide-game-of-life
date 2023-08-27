local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local Game = require(script.Parent.Game)

local function App()
	return vide.create "ScreenGui" {
		Name = "App",
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
		Game(),
	}
end

return App
