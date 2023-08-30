local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local create = vide.create
local source = vide.source

local Button = require(ReplicatedStorage.client.components.Button)
local Dynamic = require(ReplicatedStorage.client.control.Dynamic)
local palette = require(ReplicatedStorage.client.utils.palette)

type StoryProps = {
	text: vide.Source<string>,
	onClick: () -> (),
}

local components = {
	function(props: StoryProps)
		return Button {
			onClick = props.onClick,
			text = props.text,
			size = UDim2.new(0, 100, 0, 50),
			backgroundColor = palette.red,
		}
	end,
	function(props: StoryProps)
		return Button {
			onClick = props.onClick,
			text = props.text,
			size = UDim2.new(0, 100, 0, 50),
			backgroundColor = palette.green,
		}
	end,
	function(props: StoryProps)
		return Button {
			onClick = props.onClick,
			text = props.text,
			size = UDim2.new(0, 100, 0, 50),
			backgroundColor = palette.blue,
		}
	end,
}

return function(target: Instance)
	local cycle = source(0)

	local function forward()
		cycle((cycle() + 1) % 3)
	end

	local container = create "Folder" {
		Parent = target,

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

	return function()
		container:Destroy()
	end
end
