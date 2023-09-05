local dynamic = require(script.Parent.dynamic)

local function match<T>(key: () -> T)
	return function(components: { [T]: (() -> any)? })
		return dynamic(key, function(value)
			local component = components[value]
			return component and component()
		end)
	end
end

return match
