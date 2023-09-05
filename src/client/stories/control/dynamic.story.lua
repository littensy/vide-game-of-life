local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Button = require(ReplicatedStorage.client.components.Button)
local dynamic = require(ReplicatedStorage.client.control.dynamic)
local vide = require(ReplicatedStorage.modules.vide)
local unmount = require(ReplicatedStorage.client.control.unmount)
local palette = require(ReplicatedStorage.client.utils.palette)

return function(target: Instance)
	local source = vide.source(1)

	local function randomize()
		source(math.random(0, 15))
	end

	local children = dynamic(source, function(x)
		if x > 10 then
			return Button {
				text = `{x} is greater than 10`,
				size = UDim2.new(1, 0, 1, 0),
				backgroundColor = palette.blue,
				onClick = randomize,
			}
		elseif 5 > x then
			return Button {
				text = `{x} is less than 5`,
				size = UDim2.new(1, 0, 1, 0),
				backgroundColor = palette.red,
				onClick = randomize,
			}
		else
			return Button {
				text = `{x} is between 5 and 10`,
				size = UDim2.new(1, 0, 1, 0),
				backgroundColor = palette.green,
				onClick = randomize,
			}
		end
	end)

	vide.apply(target) { children }

	return function()
		unmount(children)
	end
end
