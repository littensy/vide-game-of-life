local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local App = require(script.components.App)

vide.apply(Players.LocalPlayer:WaitForChild("PlayerGui")) {
	App(),
}
