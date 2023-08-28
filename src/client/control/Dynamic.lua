local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.modules.vide)

type Component<T> = (T) -> any

type DynamicProps<T> = {
	component: vide.Source<Component<T>?>,
} & T

local function Dynamic<T>(props: DynamicProps<T>)
	local container = vide.create "Folder" {}

	local function update(component: Component<T>?)
		container:ClearAllChildren()

		if component then
			vide.apply(container) { component(props) }
		end
	end

	vide.watch(function()
		task.defer(update, props.component())
	end)

	return container
end

return Dynamic
