local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local Dynamic = require(ReplicatedStorage.client.control.Dynamic)
local Button = require(ReplicatedStorage.client.components.Button)
local palette = require(ReplicatedStorage.client.utils.palette)

local components = {
	function(props: { text: vide.Source<string>, onClick: () -> () })
		return Button {
			onClick = props.onClick,
			text = props.text,
			size = UDim2.new(0, 100, 0, 50),
			backgroundColor = palette.red,
		}
	end,
	function(props: { text: vide.Source<string>, onClick: () -> () })
		return Button {
			onClick = props.onClick,
			text = props.text,
			size = UDim2.new(0, 100, 0, 50),
			backgroundColor = palette.green,
		}
	end,
	function(props: { text: vide.Source<string>, onClick: () -> () })
		return Button {
			onClick = props.onClick,
			text = props.text,
			size = UDim2.new(0, 100, 0, 50),
			backgroundColor = palette.blue,
		}
	end,
}

return function(target: Instance)
	local cycle = vide.source(0)

	local function forward()
		cycle((cycle() + 1) % 3)
	end

	vide.apply(target) {
		Dynamic {
			component = function()
				return components[cycle() + 1]
			end,
			text = function()
				return ({ "Red", "Green", "Blue" })[cycle() + 1]
			end,
			onClick = forward,
		},
	}
end
