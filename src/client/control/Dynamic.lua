local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)
local apply = vide.apply
local create = vide.create
local watch = vide.watch

type Component<T> = (T) -> any

type DynamicProps<T> = {
	component: vide.Source<Component<T>?>,
} & T

local function Dynamic<T>(props: DynamicProps<T>)
	local container = create "Folder" {}

	local function update(component: Component<T>?)
		container:ClearAllChildren()

		if component then
			apply(container) { component(props) }
		end
	end

	watch(function()
		task.defer(update, props.component())
	end)

	return container
end

return Dynamic
