local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)

local function unmount(children: any)
	local parent = vide.create "Folder" { children }
	parent:Destroy()
end

return unmount
