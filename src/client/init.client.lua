local Players = game:GetService("Players")

local App = require(script.components.App)

App {
	target = Players.LocalPlayer:WaitForChild("PlayerGui"),
}
