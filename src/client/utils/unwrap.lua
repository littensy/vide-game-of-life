local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)

type MaybeSource<T> = T | vide.Source<T>

local function unwrap<T>(value: MaybeSource<T>): T
	if type(value) == "function" then
		return value()
	else
		return value
	end
end

return unwrap
