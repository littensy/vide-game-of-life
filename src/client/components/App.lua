local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local Game = require(script.Parent.Game)

local function App(props: { target: Instance? })
	return vide.create "ScreenGui" {
		Name = "App",
		Parent = props.target,
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
		Game {},
	}
end

return App
