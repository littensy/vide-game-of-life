local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)

type Resolvable<T> = T | vide.Source<T>

local function resolve<T>(value: Resolvable<T>): T
	if type(value) == "function" then
		return value()
	else
		return value
	end
end

return resolve
