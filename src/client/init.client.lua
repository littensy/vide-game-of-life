local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local apply = vide.apply

local App = require(script.components.App)
local Connector = require(script.components.Connector)

apply(Players.LocalPlayer:WaitForChild("PlayerGui")) {
	Connector(),
	App(),
}
