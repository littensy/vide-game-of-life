local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Button = require(ReplicatedStorage.client.components.Button)
local match = require(ReplicatedStorage.client.control.match)
local unmount = require(ReplicatedStorage.client.control.unmount)
local palette = require(ReplicatedStorage.client.utils.palette)
local vide = require(ReplicatedStorage.modules.vide)

type StoryProps = {
	onClick: () -> (),
}

local function Red(props: StoryProps)
	return Button {
		onClick = props.onClick,
		text = "Red",
		size = UDim2.new(0, 100, 0, 50),
		backgroundColor = palette.red,
	}
end

local function Green(props: StoryProps)
	return Button {
		onClick = props.onClick,
		text = "Green",
		size = UDim2.new(0, 100, 0, 50),
		backgroundColor = palette.green,
	}
end

local function Blue(props: StoryProps)
	return Button {
		onClick = props.onClick,
		text = "Blue",
		size = UDim2.new(0, 100, 0, 50),
		backgroundColor = palette.blue,
	}
end

return function(target: Instance)
	local index = vide.source(1)

	local function nextIndex()
		index(index() % 3 + 1)
	end

	local children = match(index) {
		function()
			return Red { onClick = nextIndex }
		end,

		function()
			return Green { onClick = nextIndex }
		end,

		function()
			return Blue { onClick = nextIndex }
		end,
	}

	vide.apply(target) { children }

	return function()
		unmount(children)
	end
end
