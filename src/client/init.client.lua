local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local App = require(script.components.App)
local Connector = require(script.components.Connector)

local root = Players.LocalPlayer:WaitForChild("PlayerGui")

vide.apply(root) {
	Connector(),
	App(),
}
