local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)

type ChangeListeners = {
	[string]: (value: any) -> (),
}

local function connect(instance: any, listeners: ChangeListeners)
	local connections: { RBXScriptConnection } = {}

	for property, listener in listeners do
		local connection = instance:GetPropertyChangedSignal(property):Connect(function()
			listener(instance[property])
		end)

		table.insert(connections, connection)
	end

	return function()
		for _, connection in connections do
			connection:Disconnect()
		end
	end
end

local function change(listeners: ChangeListeners)
	return vide.action(function(instance)
		local ref = setmetatable({ instance = instance }, { __mode = "v" })
		local disconnect: (() -> ())?

		if instance.Parent then
			disconnect = connect(instance, listeners)
		end

		instance.AncestryChanged:Connect(function(_, parent)
			if parent and ref.instance and not disconnect then
				disconnect = connect(ref.instance, listeners)
			elseif disconnect then
				disconnect()
				disconnect = nil
			end
		end)
	end)
end

return change
